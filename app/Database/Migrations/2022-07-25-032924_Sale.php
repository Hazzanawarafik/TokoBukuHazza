<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

use function PHPSTORM_META\type;

class Sale extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'sale_id'   =>  [
                'type'          => 'VARCHAR',
                'constraint'    => 15,

            ],
            'user_id'   =>  [
                'type'          =>  'int',
                'constraint'    =>  '11'
            ],
            'customer_id'   =>  [
                'type'          => 'int',
                'constraint'    =>  '11',
                'null'          =>  true,
            ],
            'created_at'    =>  [
                'type'  =>  'datetime'
            ],
            'updated_at'    =>  [
                'type'  =>  'datetime',
            ]
        ]);
        $this->forge->addKey('sale_id', true);
        $this->forge->createTable('sale');
    }

    public function down()
    {
        $this->forge->dropTable('sale');
    }
}
