<?php

namespace App\Controllers;

use App\Models\BookCategoryModel;
use App\Models\BookModel;
use PhpOffice\PhpSpreadsheet\Reader\Xlsx;
use PhpOffice\PhpSpreadsheet\Reader\Xls;

define('_TITLE', 'Buku');

class Book extends BaseController
{
    // protected $helpers = ['url', 'form'];
    private $_book_model, $_book_category_model;
    private $_defaultImg;
    public function __construct()
    {
        $this->_book_model  =   new BookModel();
        $this->_book_category_model =   new BookCategoryModel();
        $this->_defaultImg = "default.png";
    }

    //read
    public function index()
    {
        // $book_model = new BookModel();
        $data_book = $this->_book_model->getBook();
        $data = [
            'title'     => _TITLE,
            'data_book' =>  $data_book,
        ];
        // dd($data_book); 
        return view('book/index', $data);
    }

    public function detail($slug)
    {
        // $book_model =   new BookModel();
        $data_book  =   $this->_book_model->getBook($slug);
        $data       =   [
            'title'     =>  _TITLE,
            'data_book' =>  $data_book,
        ];
        // dd($data_book);
        return view('book/detail', $data);
    }


    // Create
    public function create()
    {
        // $book_category_model    =   new BookCategoryModel();
        // session();
        $data   =   [
            'title' =>  _TITLE,
            'book_category' =>  $this->_book_category_model->orderby('name_category')->findAll(),
            'validation'    => \Config\Services::validation(),
        ];
        // dd($book_category_model->findAll());
        return view('book/create', $data);
    }

    public function save()
    {
        // dd($this->request->getVar('title'));
        // $book_model =   new BookModel();

        //validasi data
        if (!$this->validate([
            // 'title' => 'required|is_unique[book.title]',
            'title' => [
                'rules'     =>  'required|is_unique[book.title]',
                'label'     =>  'Judul',
                'errors'    =>  [
                    'required'  =>  '{field} harus diisi!',
                    'is_unique' =>  '{field} sudah digunakan!'
                ]
            ],
            'author' => 'required',
            'release_year' => 'required|numeric',
            'price' => 'required|numeric',
            'stock' => 'required|numeric',
            'cover' => [
                'rules' =>  'max_size[cover,1024]|is_image[cover]|mime_in[cover,image/jpg,image/jpeg,image/png]',
                'label' =>  'Cover',
                'errors' =>  [
                    'max_size'  =>  '{field} tidak boleh lebih 1MB',
                    'is_image'  =>  'Yang dipilih bukan gambar !',
                    'mime_in'   =>  'Yang dipilih bukan gambar !',
                ]
            ]
        ])) {
            // Berisi fungsi redirect jika validasi tidak memenuhi
            // dd(\Config\Services::validation()->getErrors());
            return redirect()->to('/book-create')->withInput();
        }

        // script untuk mendapatkan file cover
        $file_cover = $this->request->getFile('cover');
        // dd($file_cover);
        if ($file_cover->getError() === 4) //tidak ada file yang di upload
        {
            // $name_file = 'default.png';
            $name_file = $this->_defaultImg;
        } else {
            // $name_file = $file_cover->getName();
            $name_file = $file_cover->getRandomName();
            $file_cover->move('img', $name_file);
        }

        $slug   =   url_title($this->request->getVar('title'), '-', true);
        if ($this->_book_model->save([
            'title'             =>  $this->request->getVar('title'),
            'slug'              =>  $slug,
            'author'            =>  $this->request->getVar('author'),
            'release_year'      =>  $this->request->getVar('release_year'),
            'price'             =>  $this->request->getVar('price'),
            'discount'          =>  $this->request->getVar('discount'),
            'stock'             =>  $this->request->getVar('stock'),
            'book_category_id'  =>  $this->request->getVar('book_category_id'),
            'cover'             =>  $name_file,
        ])) {
            session()->setFlashdata('success', 'Data Berhasil Di Tambahkan');
        } else {
            session()->setFlashdata('error', 'Data Gagal Di Tambahkan');
        }
        return redirect()->to('/book');
    }

    //Update
    public function edit($slug)
    {
        $data   =   [
            'title'     =>   _TITLE,
            'result'    =>   $this->_book_model->getBook($slug),
            'validation'    => \Config\Services::validation(),
            'book_category' =>  $this->_book_category_model->orderby('name_category')->findAll(),
        ];
        return view('book/edit', $data);
    }

    public function update($id)
    {

        $slug_lama  =   $this->request->getVar('slug_lama');
        $dataBookLama   =   $this->_book_model->getBook($slug_lama);
        if ($dataBookLama['title']  === $this->request->getVar('title')) {
            $rule_title = 'required';
        } else {
            $rule_title = 'required|is_unique[book.title]';
        }
        //validasi data
        if (!$this->validate([
            // 'title' => 'required|is_unique[book.title]',
            'title' => [
                // 'rules'      =>  'required|is_unique[book.title]',
                'rules'         =>  $rule_title,
                'label'         =>  'Judul',
                'errors'        =>  [
                    'required'  =>  '{field} harus diisi!',
                    'is_unique' =>  '{field} sudah digunakan!'
                ]
            ],
            'author' => 'required',
            'release_year' => 'required|numeric',
            'price' => 'required|numeric',
            'stock' => 'required|numeric',
            'cover' => [
                'rules' =>  'max_size[cover,1024]|is_image[cover]|mime_in[cover,image/jpg,image/jpeg,image/png]',
                'label' =>  'Cover',
                'errors' =>  [
                    'max_size'  =>  '{field} tidak boleh lebih 1MB',
                    'is_image'  =>  'Yang dipilih bukan gambar !',
                    'mime_in'   =>  'Yang dipilih bukan gambar !',
                ]
            ]
        ])) {
            // Berisi fungsi redirect jika validasi tidak memenuhi
            // dd(\Config\Services::validation()->getErrors());
            return redirect()->to('/book-edit/' . $slug_lama)->withInput();
        }

        // script untuk mendapatkan file cover
        $file_cover = $this->request->getFile('cover');
        // dd($file_cover);
        if ($file_cover->getError() === 4) //tidak ada file yang di upload
        {
            // $name_file = 'default.png';
            $name_file = $this->_defaultImg;
        } else {
            // $name_file = $file_cover->getName();
            $name_file = $file_cover->getRandomName();
            $file_cover->move('img', $name_file);
            $file_cover_lama    =   $dataBookLama['cover'];
            if ($file_cover_lama != $this->_defaultImg) {
                unlink('img/' . $file_cover_lama);
            }
        }

        $slug   =   url_title($this->request->getVar('title'), '-', true);
        if ($this->_book_model->save([
            'book_id'           =>  $id,
            'title'             =>  $this->request->getVar('title'),
            'slug'              =>  $slug,
            'author'            =>  $this->request->getVar('author'),
            'release_year'      =>  $this->request->getVar('release_year'),
            'price'             =>  $this->request->getVar('price'),
            'discount'          =>  $this->request->getVar('discount'),
            'stock'             =>  $this->request->getVar('stock'),
            'book_category_id'  =>  $this->request->getVar('book_category_id'),
            'cover'             =>  $name_file

        ])) {
            session()->setFlashdata('success', 'Data Berhasil Di Perbaharui');
        } else
            session()->setFlashdata('error', 'Data Gagal Di Perbaharui');

        return redirect()->to('/book');
    }

    // delete
    public function delete($id)
    {
        $dataBookLama   =   $this->_book_model->where(['book_id' => $id])->first();
        $file_cover_lama = $dataBookLama['cover'];

        $this->_book_model->delete($id);
        session()->setFlashdata('success', 'Data berhasil dihapus!');
        if ($file_cover_lama != $this->_defaultImg) {
            unlink('img/' . $file_cover_lama);
        }
        return redirect()->to('/book');
    }

    public function import()
    {
        $file = $this->request->getFile('file');
        $ext = $file->getExtension();
        if ($ext === "xls")
            $render = new Xls();
        else $reader = new Xlsx();

        $spreadsheet = $reader->load($file);
        $sheet = $spreadsheet->getActiveSheet()->toArray();

        foreach ($sheet as $index => $item) {
            if ($index === 0) continue;
            if ($item[1] != null) {
                $slug = url_title((string)$item[1], '-', true);
                $data_buku = $this->_book_model->getBook($slug);

                if (empty($data_buku)) {
                    $this->_book_model->save([
                        'title' => $item[1],
                        'author' => $item[2],
                        'release_year' => $item[3],
                        'book_category_id' => $item[4],
                        'price' => $item[5],
                        'discount' => $item[6],
                        'stock' => $item[7],
                        'slug' => $slug,
                        'cover' => $this->_defaultImg
                    ]);
                }
            }
        }
        session()->setFlashdata('success', 'Data berhasil diimport');
        return redirect()->to('/book');
    }
}
