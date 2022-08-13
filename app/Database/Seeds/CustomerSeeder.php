<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use CodeIgniter\I18n\Time;

class CustomerSeeder extends Seeder
{
    public function run()
    {
        // use the factory to create a Faker\Generator instance
        $faker = \Faker\Factory::create('id_ID');
        for ($i = 0; $i < 100; $i++) {
            $data   =   [

                'name'          =>  $faker->name,
                'no_customer'   =>  $faker->nik,
                'gender'        =>  $faker->title == 'Ms' || $faker->title == 'Miss' ? 'P' : 'L',
                'address'       =>  $faker->address,
                'email'         =>  $faker->email,
                'phone'         =>  $faker->phoneNumber,
                'created_at'    =>  Time::createFromTimestamp($faker->unixTime),
                'updated_at'    =>  Time::createFromTimestamp($faker->unixTime),

                // [
                //     'name'          =>  'Hazza Khairugdfgsdgllah',
                //     'no_customer'   =>  '5165464300000',
                //     'gender'        =>  'L',
                //     'address'       =>  'Jalanfaksdmflasdf',
                //     'email'         =>  'fa;smdflamsdf',
                //     'phone'         =>  '32146613',
                //     'created_at'    =>  Time::now(),
                //     'updated_at'    =>  Time::now(),
                // ]
            ];
            $this->db->table('customer')->insert($data);
        }

        // Simple Queries
        // $this->db->query('INSERT INTO customer (name, no_customer) VALUES(:name:, :no_customer:)', $data);

        // Using Query Builder
        // $this->db->table('customer')->insert($data); biasa
        $this->db->table('customer')->insertBatch($data); // untuk aray
    }
}
