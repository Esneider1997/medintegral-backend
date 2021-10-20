<?php

namespace App\Models;

use CodeIgniter\Database\MySQLi\Builder;
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
        'id_tipo_documento', 
        'identificacion', 
        'fecha_expedicion', 
        'fecha_nacimiento', 
        'ciudad_nacimiento', 
        'direccion', 
        'email', 
        'id_sexo', 
        'id_estado_civil', 
        'id_cargo', 
        'id_centro_costo',
        'usuario', 
        'contrasena', 
        'id_rol',
        'nombre_img',
        'ruta_img',
        'estado'
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


    //-- verificar validacion del usuario
    /* public function validar_usuario()
    {            
        $builder = $this->db->table($this->table);
        $builder = $this->select('*');
        $builder = $this->from('usuario'); 
        $builder = $this->where('contrasena');
        $builder = $this->limit(1);
        $builder = $this->get();   
        
        if($builder->num_rows() == 1){                 
           return $builder->result();
        }
        else{
            return false;
        }
    } */

}
