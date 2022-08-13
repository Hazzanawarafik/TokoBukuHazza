<?php

namespace App\Models;

use CodeIgniter\Model;

class UsersModel extends Model
{
    // protected $DBGroup          = 'default';
    protected $table            = 'users';
    // protected $primaryKey       = 'id';
    // protected $useAutoIncrement = true;
    // protected $insertID         = 0;
    // protected $returnType       = 'array';
    protected $useSoftDeletes   = true;
    // protected $protectFields    = true;
    protected $allowedFields    = ['firstname', 'lastname', 'username', 'email', 'password_hash', 'active'];

    // Dates
    protected $useTimestamps = true;
    // protected $dateFormat    = 'datetime';
    // protected $createdField  = 'created_at';
    // protected $updatedField  = 'updated_at';
    // protected $deletedField  = 'deleted_at';

    // Validation
    // protected $validationRules      = [];
    // protected $validationMessages   = [];
    // protected $skipValidation       = false;
    // protected $cleanValidationRules = true;

    // Callbacks
    // protected $allowCallbacks = true;
    // protected $beforeInsert   = [];
    // protected $afterInsert    = [];
    // protected $beforeUpdate   = [];
    // protected $afterUpdate    = [];
    // protected $beforeFind     = [];
    // protected $afterFind      = [];
    // protected $beforeDelete   = [];
    // protected $afterDelete    = [];

    public function getUsers($id = false)
    {
        if ($id === false) {
            return $this->select('users.id,firstname,lastname,username,email,gs.group_id,g.name group_name')
                ->join('auth_groups_users gs', 'users.id = gs.user_id')
                ->join('auth_groups g', 'g.id = gs.group_id')
                ->findAll();
        } else {
            return $this->where(['id' => $id])->first();
        }
    }
}
