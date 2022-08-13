<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class SaleDetail extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'sale_id' => [
                'type'           => 'varchar',
                'constraint'     => 15,
            ],
            'book_id' => [
                'type'       => 'int',
                'constraint' => 11,
            ],
            'amount' => [
                'type'          => 'int',
                'constraint'    =>  11,
            ],
            'price' =>  [
                'type'  =>  'float',
            ],
            'discount'  =>  [
                'type'  =>  'float'
            ],
            'total_price'   =>  [
                'type'  =>  'float'
            ]
        ]);
        $this->forge->addKey('sale_id', true);
        $this->forge->createTable('sale_detail');
    }

    public function down()
    {
        //
    }
}
