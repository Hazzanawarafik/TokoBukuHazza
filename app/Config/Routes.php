<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
$routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
// $routes->add('/coba/(:any)','Home::coba/$1'); //http://localhost:8080/coba/hazza/25
// $routes->get('/coba/(:any)','Home::coba/$1'); //http://localhost:8080/coba/hazza/25
// $routes->get('/coba/(:alpha)/(:num)','Home::coba/$1/$2'); //http://localhost:8080/coba/hazza/25
// $routes->get('/coba/(:num)/(:num)','Home::coba/$1/$2'); //http://localhost:8080/coba/(harus angka)/25
// $routes->addPlaceholder('uuid', '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}'); //custom placeholder
// $routes->get('/coba2/(:uuid)','Home::coba2/$1'); //http://localhost:8080/coba2/a123a123-a123-a123-a123-a123a123a123

// Closures Routing
// $routes->get('/coba2/(:uuid)', function ($uuid) {
//     echo "UUID $uuid";
// });

//Redirect Routes
// $routes->addRedirect('/coba3', '/coba');

//Grouping Routes
// $routes->group('cb', function ($r) {
//     $r->get('coba/(:alpha)/(:num)', 'Home::coba/$1/$2');
//     $r->get('coba2/(:uuid)', function ($uuid) {
//         echo "UUID $uuid";
//     });
// });

$routes->get('/', 'Home::index');
$routes->get('/admin', 'admin\Admin::index');
$routes->get('/book', 'Book::index', ['filter' => 'permission:data-buku']);
$routes->get('book-detail/(:any )', 'Book::detail/$1 ');
$routes->get('/book-create', 'Book::create', ['as' => 'tambah-buku']);
$routes->post('/book-create', 'Book::save', ['as' => 'simpan-buku']);
$routes->get('/book-edit/(:any)', 'Book::edit/$1', ['as' => 'ubah-buku']);
$routes->post('book-edit/(:num)', 'Book::update/$1', ['as' => 'update-buku']);
$routes->delete('book-delete/(:num)', 'Book::delete/$1', ['as' => 'delete-buku']);
$routes->post('book-import', 'Book::import');

$routes->get('/galeri', 'Gallery::index', ['filter' => 'permission:data-galeri']);
$routes->post('/galeri/upload', 'Gallery::save', ['as' => 'upload-galeri']);
$routes->delete('/galeri/hapus/(:num)', 'Gallery::delete/$1', ['as' => 'delete-galeri']);

//Supplier
$routes->get('/supplier', 'Supplier::index', ['filter' => 'permission:data-supplier']);
$routes->get('create-supplier', 'Supplier::create');
$routes->post('create-supplier', 'Supplier::save');
$routes->get('edit-supplier/(:num)', 'Supplier::edit/$1');
$routes->post('edit-supplier/(:num)', 'Supplier::update/$1');
$routes->delete('delete-supplier/(:num)', 'Supplier::delete/$1');

//Customers
$routes->get('/customer/index', 'Customer::index', ['filter' => 'permission:data-customer'])->setAutoRoute(true);
$routes->addRedirect('/customer', 'customer/index');

//Users
$routes->get('/users', 'Users::index', ['filter' => 'permission:read-users']);
$routes->get('/create-users', 'Users::create', ['filter' => 'permission:create-users']);
$routes->post('/create-users', 'Users::save', ['filter' => 'permission:create-users']);
$routes->delete('/delete-users/(:num)', 'Users::delete/$1', ['filter' => 'permission:delete-users']);
$routes->post('/reset-password-users/(:num)', 'Users::resetPassword/$1', ['filter' => 'permission:reset-password']);

// Profile
$routes->get('/profil', 'Profil::index');
$routes->post('/profil/(:num)', 'Profil::updateProfil/$1');
$routes->get('/password', 'Profil::ubahPassword');
$routes->post('/password/(:num)', 'Profil::updatePassword/$1');

//Point Of Sales Penjualan
$routes->get('jual', 'Penjualan::index');
$routes->get('load-cart-jual', 'Penjualan::show_cart');
$routes->post('add-cart-jual', 'Penjualan::add_cart');
$routes->post('update-cart-jual/(:any)', 'Penjualan::update_cart/$1');
$routes->delete('delete-cart-jual/(:any)', 'Penjualan::delete_cart/$1');
$routes->get('load-total-jual', 'Penjualan::getTotal');
$routes->post('pembayaran', 'Penjualan::pembayaran');
$routes->get('laporan', 'Penjualan::laporan');
$routes->post('laporan/filter', 'Penjualan::filter');
$routes->get('laporan/detail/(:any)', 'Penjualan::detail/$1');
$routes->get('export-excel', 'Penjualan::exportExcel');
$routes->get('export-excel/(:any)/(:any)', 'Penjualan::exportExcel/$1/$2');
$routes->get('export-pdf/(:any)/(:any)', 'Penjualan::exportPDF/$1/$2');
$routes->get('export-detail-laporan/(:any)', 'Penjualan::exportDetailPDF/$1');


$routes->post('chart-transaksi', 'Home::showChartTransaksi');
$routes->post('chart-customer', 'Home::showChartCustomer');
/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
