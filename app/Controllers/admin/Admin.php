<?php

namespace App\Controllers\admin;

use App\Controllers\BaseController;

class Admin extends BaseController
{

    public function index()
    {
        // echo "Ini adalah halaman index admin";
        return view('overview');
    }
}

/* End of file Controllername.php */
