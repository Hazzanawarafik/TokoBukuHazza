<?php

namespace App\Controllers;

use App\Models\BerandaModel;

define('_TITLE', 'Beranda');

class Home extends BaseController
{
    private $_beranda_model;

    public function __construct()
    {
        $this->_beranda_model = new BerandaModel();
    }

    public function index()
    {
        // use the factory to create a Faker\Generator instance
        // $faker = \Faker\Factory::create('id_ID');
        // dd($faker->name());

        // die('test');
        // return view('welcome_message');
        // echo "Hello World";
        // return view('beranda');

        // echo view('template/header');
        // echo view('template/topbar');
        // echo view('template/sidebar');
        // echo view('beranda');
        // echo view('template/footer');

        $data   =   [
            'title' =>  _TITLE
        ];
        return view('beranda', $data);
    }

    // public function coba($nama = null, $usia = null){
    //     echo "Nama saya adalah $nama, usia saya adalah $usia";
    // }

    // public function coba2($uuid)
    // {
    //     echo "UUID adalah $uuid";
    // }

    public function showChartTransaksi()
    {
        $tahun = $this->request->getVar('tahun');
        $data_transaksi = $this->_beranda_model->getTransaksi($tahun);
        // dd($data_transaksi);

        $response = [
            'status' => true,
            'data' => $data_transaksi
        ];
        echo json_encode($response);
    }

    public function showChartCustomer()
    {
        $tahun = $this->request->getVar('tahun');
        $data_customer = $this->_beranda_model->getCustomer($tahun);
        $response = [
            'status' => true,
            'data' => $data_customer
        ];
        echo json_encode($response);
    }
}
