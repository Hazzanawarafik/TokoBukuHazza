<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Entities\SupplierEntity;
use App\Models\SupplierModel;

define('_TITLE', 'Supplier');

class Supplier extends BaseController
{
    private $supplier_model;
    public function __construct()
    {
        // parent::__construct();
        $this->supplier_model   =   new SupplierModel();
    }

    public function index()
    {
        $data_supplier  =   $this->supplier_model->findAll();
        $data   =   [
            'title'     =>  _TITLE,
            'result'    =>  $data_supplier
        ];
        return view('supplier/index', $data);
    }

    public function create()
    {
        $data = [
            'title' => _TITLE
        ];
        return view('supplier/create', $data);
    }

    public function save()
    {
        $supplier   =   new SupplierEntity();
        // $data       =   [
        //     "name"      =>  $this->request->getVar('name'),
        //     "address"   =>  $this->request->getVar('address'),
        //     "email"     =>  $this->request->getVar('email'),
        //     "phone"     =>  $this->request->getVar('phone'),
        // ];
        // $supplier->fill($data);
        $supplier->nama     =   $this->request->getVar('name');
        $supplier->alamat  =   $this->request->getVar('address');
        $supplier->email    =   $this->request->getVar('email');
        $supplier->telepon     =   $this->request->getVar('phone');

        $this->supplier_model->save($supplier);
        // $this->supplier_model->save([
        //     "name"      =>  $this->request->getVar('name'),
        //     "address"   =>  $this->request->getVar('address'),
        //     "email"     =>  $this->request->getVar('email'),
        //     "phone"     =>  $this->request->getVar('phone'),
        // ]);
        session()->setFlashdata("success", "Data berhasil ditambahkan !");
        return redirect()->to('/supplier');
    }

    public function edit($id)
    {
        $data_supplier  =   $this->supplier_model->where(['supplier_id' => $id])->first();

        // Jika data kosong
        if (empty($data_supplier)) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException("Supplier dengan ID: $id");
        }
        $data   =   [
            'title' =>  _TITLE,
            'result' =>  $data_supplier
        ];
        return view('supplier/edit', $data);
    }

    public function update($id)
    {
        $supplier   =   new SupplierEntity();
        $supplier->supplier_id  =   $id;
        $supplier->nama     =   $this->request->getVar('name');
        $supplier->alamat  =   $this->request->getVar('address');
        $supplier->email    =   $this->request->getVar('email');
        $supplier->telepon     =   $this->request->getVar('phone');

        $this->supplier_model->save([
            "supplier_id"   =>  $id,
            "name"          =>  $this->request->getVar('name'),
            "address"       =>  $this->request->getVar('address'),
            "email"         =>  $this->request->getVar('email'),
            "phone"         =>  $this->request->getVar(['phone']),
        ]);

        session()->setFlashdata("success", "Data berhasil diperbaharui");
        return redirect()->to('/supplier');
    }

    public function delete($id)
    {
        $this->supplier_model->delete($id);
        session()->setFlashdata("success", "Data berhasil dihapus");
        return redirect()->to('/supplier');
    }
}
