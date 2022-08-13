<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class AuthgroupsSeeder extends Seeder
{
    public function run()
    {
        $data = [
            [
                'id' => '',
                'name' => 'Admin',
                'description' => ''
            ],
            [
                'id' => '',
                'name' => 'Karyawan',
                'description' => ''
            ],
        ];

        // Simple Queries
        // $this->db->query('INSERT INTO users (username, email) VALUES(:username:, :email:)', $data);

        // Using Query Builder
        $this->db->table('auth_groups')->insert($data);
    }
}
