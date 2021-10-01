<?php

namespace App\Models;

use CodeIgniter\Model;

class RolModel extends Model
{
	
	protected $table                = 'conf_rolEmpleado';
	protected $primaryKey           = 'Id';
	/* protected $useAutoIncrement     = true;
	protected $insertID             = 0; */
	protected $returnType           = 'array';
/* 	protected $useSoftDeletes       = false;
	protected $protectFields        = true; */
	protected $allowedFields        = ['nombre', 'sigla'];

	// Dates
	protected $useTimestamps        = false;
	protected $dateFormat           = 'datetime';
	protected $createdField         = 'created_at';
	protected $updatedField         = 'updated_at';
	/* protected $deletedField         = 'deleted_at'; */

	// Validation
	protected $validationRules      = [
		'nombre'	=>		'required|alpha_space|min_length[3]|max_length[30]',
		'sigla'		=>	 	'required|alpha_space|min_length[2]|max_length[15]',
	];
	
	protected $validationMessages   = [];
	protected $skipValidation       = false;
	protected $cleanValidationRules = true;

	// Callbacks
	protected $allowCallbacks       = true;
	/* protected $beforeInsert         = [];
	protected $afterInsert          = [];
	protected $beforeUpdate         = [];
	protected $afterUpdate          = [];
	protected $beforeFind           = [];
	protected $afterFind            = [];
	protected $beforeDelete         = [];
	protected $afterDelete          = []; */
}
