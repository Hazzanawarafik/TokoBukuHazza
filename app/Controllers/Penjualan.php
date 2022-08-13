<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\BookModel;
use App\Models\CustomerModel;
use App\Models\SaleDetailModel;
use App\Models\SaleModel;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
// reference the Dompdf namespace
use Dompdf\Dompdf;

use TCPDF;

define('_TITLE', 'Penjualan');

class Penjualan extends BaseController
{
    private $_book_model, $_cart, $_customer_model;
    private $_sale_model, $_sale_detail_model;

    public function __construct()
    {
        $this->_book_model  =   new BookModel();
        $this->_customer_model = new CustomerModel();
        $this->_sale_model = new SaleModel();
        $this->_sale_detail_model = new SaleDetailModel();
        $this->_cart = \Config\Services::cart();
    }

    public function index()
    {
        // dd($this->_cart->contents());
        $this->_cart->destroy();
        $data_book  =   $this->_book_model->getBook();
        $data_customer = $this->_customer_model->findAll();
        // dd($data_customer);
        $data   =   [
            'title' =>  _TITLE,
            'data_buku' =>  $data_book,
            'data_customer' => $data_customer,
        ];

        return view('penjualan/index', $data);
    }

    public function add_cart()
    {
        $this->_cart->insert(array(
            'id'      => $this->request->getVar('id_buku'), // id buku
            'qty'     => 1, // qty buku
            'price'   => $this->request->getVar('harga_buku'), // harga satuan buku
            'name'    => $this->request->getVar('judul_buku'), // judul buku
            'options' => array(
                'discount' => $this->request->getVar('diskon')
            )
        ));
        echo $this->show_cart();
    }

    public function show_cart()
    {
        $output = "";
        $no = 1;
        foreach ($this->_cart->contents() as $item) {
            $diskon = ($item['options']['discount'] / 100) * $item['subtotal'];
            $output .= '
            <tr>
                <td>' . $no++ . '</td>
                <td>' . $item['name'] . '</td>
                <td>' . $item['qty'] . '</td>
                <td>' . number_to_currency($item['price'], 'IDR', 'id_ID', 2) . '</td>
                <td>' . $item['options']['discount'] . '</td>                 
                <td>' . number_to_currency(($item['subtotal'] - $diskon), 'IDR', 'id_ID', 2) . '</td>                   
                <td>
                    <button class="edit_cart btn btn-warning"  id="' . $item['rowid'] . '" qty="' . $item['qty'] . '">Update</button>
                    <button id="' . $item['rowid'] . '" class="hapus_cart btn btn-danger">Delete</button>
                </td>               
            </tr>';
        }
        return $output;
    }

    public function delete_cart($rowid)
    {
        // Remove an item using its `rowid`
        $this->_cart->remove($rowid);
        return $this->show_cart();
    }

    public function update_cart($rowid)
    {
        // Update an array of values
        $this->_cart->update(array(
            'rowid'   => $rowid,
            'qty'     => $this->request->getVar('jumlah'),
        ));
        return $this->show_cart();
    }

    public function getTotal()
    {
        $total = 0;
        foreach ($this->_cart->contents() as $item) {
            $diskon = ($item['options']['discount'] / 100) * $item['subtotal'];
            $total += $item['subtotal'] - $diskon;
        }
        echo number_to_currency($total, 'IDR', 'id_ID', 2);
    }

    public function pembayaran()
    {
        // Apakah ada transaksi atau tidak
        if (!$this->_cart->contents()) {
            // Transaksi Kosong
            $response = [
                'status' => false,
                'msg' => 'Tidak ada Transaksi'
            ];
            echo json_encode($response);
        } else {
            // Ada Transaksi
            // Memperoleh Total Transaksi
            $total = 0;
            foreach ($this->_cart->contents() as $item) {
                $diskon = ($item['options']['discount'] / 100) * $item['subtotal'];
                $total += $item['subtotal'] - $diskon;
            }
            $nominal = $this->request->getVar('nominal');

            // Pengecekan nominal
            if ($nominal < $total) {
                // Nominal tidak mencukupi
                $response = [
                    'status' => false,
                    'msg' => 'Nominal tidak mencukupi'
                ];
                echo json_encode($response);
            } else {
                // Nominal mencukupi
                // Menyimpan ke dalam tabel sale dan sale detail
                $sale_id = "J" . time();
                $this->_sale_model->save([
                    'sale_id' => $sale_id,
                    'customer_id' => $this->request->getVar('customer'),
                    'user_id' => user_id()
                ]);

                foreach ($this->_cart->contents() as $item) {
                    $diskon = ($item['options']['discount'] / 100) * $item['subtotal'];
                    $this->_sale_detail_model->save([
                        'sale_id' => $sale_id,
                        'book_id' => $item['id'],
                        'amount' => $item['qty'],
                        'price' => $item['price'],
                        'discount' => $diskon,
                        'total_price' => $item['subtotal'] - $diskon
                    ]);

                    // update stok produk
                    $data_buku = $this->_book_model->where(['book_id' => $item['id']])->first();
                    $this->_book_model->save([
                        'book_id' => $item['id'],
                        'stock' => $data_buku['stock'] - $item['qty']
                    ]);
                }

                // Hitung Kembalian
                $kembalian = $nominal - $total;
                $this->_cart->destroy();
                $response = [
                    'status' => true,
                    'msg' => "Pembayaran berhasil",
                    'kembalian' => number_to_currency($kembalian, 'IDR', 'id_ID', 2),
                ];
                echo json_encode($response);
            }
        }
    }

    public function laporan($tgl_awal = null, $tgl_akhir = null)
    {
        // dd("Test Masuk");
        $tgl1 = $tgl_awal == null ? date('Y-m-01') : $tgl_awal;
        $tgl2 = $tgl_akhir == null ? date('Y-m-t') : $tgl_akhir;
        $laporan = $this->_sale_model->getLaporan($tgl1, $tgl2);
        // dd($laporan);
        $data = [
            'title' => _TITLE,
            'result' => $laporan,
            'tanggal' => [
                'tgl_awal' => $tgl1,
                'tgl_akhir' => $tgl2,
            ]
        ];
        return view('penjualan/laporan', $data);
    }

    public function filter()
    {
        $tgl_awal = $this->request->getVar('tgl_awal');
        $tgl_akhir = $this->request->getVar('tg;_akhir');
        return $this->laporan($tgl_awal, $tgl_akhir);
    }

    public function detail($sale_id)
    {
        $data = [
            'title' => _TITLE,
            'result' => $this->_sale_detail_model->getDetail($sale_id)
        ];
        // dd($data);
        return view('penjualan/detail', $data);
    }

    public function exportExcel($tgl_awal = null, $tgl_akhir = null)
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setCellValue('A1', 'No');
        $sheet->setCellValue('B1', 'Sale Id');
        $sheet->setCellValue('C1', 'Tgl Transaksi');
        $sheet->setCellValue('D1', 'User');
        $sheet->setCellValue('E1', 'Customer');
        $sheet->setCellValue('F1', 'Total Transaksi');

        $row = 2;
        $tgl1 = $tgl_awal == null ? date('Y-m-01') : $tgl_awal;
        $tgl2 = $tgl_akhir == null ? date('Y-m-t') : $tgl_akhir;
        $laporan = $this->_sale_model->getLaporan($tgl1, $tgl2);
        foreach ($laporan as $key => $item) {
            $sheet
                ->setCellValue('A' . $row, $key + 1)
                ->setCellValue('B' . $row, $item['sale_id'])
                ->setCellValue('C' . $row, $item['tgl_transaksi'])
                ->setCellValue('D' . $row, $item['firstname'] . ' ' . $item['lastname'])
                ->setCellValue('E' . $row, $item['nama_customer'])
                ->setCellValue('F' . $row, $item['total']);
            $row++;
        }

        $filename = "laporan-transaksi";

        $writer = new Xlsx($spreadsheet);
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attactment;filename=' . $filename . '.xlsx');
        header('Cache-Control:max-age=0');
        $writer->save('php://output');
        die();
    }

    public function exportPDF($tgl_awal = null, $tgl_akhir = null)
    {
        $tgl1 = $tgl_awal == null ? date('Y-m-01') : $tgl_awal;
        $tgl2 = $tgl_akhir == null ? date('Y-m-t') : $tgl_akhir;
        $laporan = $this->_sale_model->getLaporan($tgl1, $tgl2);
        $data = [
            'result' => $laporan,
            'tanggal' => [
                'tgl_awal' => $tgl1,
                'tgl_akhir' => $tgl2,
            ]
        ];
        $view = view('penjualan/export-laporan-pdf', $data);
        // instantiate and use the dompdf class
        $dompdf = new Dompdf();
        $dompdf->loadHtml($view);

        // (Optional) Setup the paper size and orientation
        $dompdf->setPaper('A4', 'potrait');

        // Render the HTML as PDF
        $dompdf->render();

        // Output the generated PDF to Browser
        $dompdf->stream("laporan-penjualan", array("Attachment" => false));
    }

    public function exportDetailPDF($sale_id = null)
    {
        $data_transaksi = $this->_sale_model->getLaporanById($sale_id);
        $detail = $this->_sale_detail_model->getDetail($sale_id);
        $data = [
            'data_transaksi' => $data_transaksi,
            'detail' => $detail
        ];
        // dd($data_transaksi);
        $view = view('penjualan/detail-pdf', $data);
        // create new PDF document
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT);
        $pdf->AddPage();
        $pdf->writeHTML($view);
        $this->response->setContentType('application/pdf');
        $pdf->Output('detail-laporan.pdf', 'I');
    }
}
