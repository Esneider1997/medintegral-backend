<?php

namespace App\Models;

use CodeIgniter\Model;

class EmpleadosModel extends Model
{

    //protected $db;

    protected $table      = 'conf_Empleados';
    protected $primaryKey = 'Id';

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';

    /* protected $useSoftDeletes = false;  */

    protected $allowedFields = [
        'primer_nombre', 
        'segundo_nombre', 
        'apellido_paterno', 
        'apellido_materno', 
        'idtipoDocumento', 
        'identificacion', 
        'fecha_expedicion', 
        'fecha_nacimiento', 
        'CiudadNacimiento', 
        'direccion', 
        'email', 
        'id_sexo', 
        'idEstadoCivil', 
        'idCargo', 
        'idCentroCosto', 
        'ruta_foto', 
        'usuario', 
        'contrasena', 
        'idRol'
    ];

    protected $useTimestamps = false;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    /* protected $deletedField  = 'deleted_at'; */

    protected $validationRules    = [
        'nombre' => 'required|alpha_space|min_length[3]|max_length[50]',
        // 'correo' => 'permit_empty|valid_email'
    ];
    protected $validationMessages = [
        'nombre' => [
            'required' => 'Debe llenar el campo nombre'
        ]
    ];
    
    protected $skipValidation     = false;
}
