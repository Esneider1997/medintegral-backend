<?php 

namespace App\Controllers\API;

use App\Models\EmpleadosModel;
use CodeIgniter\RESTful\ResourceController;
use Firebase\JWT\JWT;
use App\Controllers\Auth;

class Empleados extends ResourceController
{
    
    public function __construct(){
        helper('MultiConnection');
        helper('HashPassword');
        $this->model = $this->setModel(new EmpleadosModel($db));
    }

	public function index()
	{
        setdb('medic_desarrllo');
        $empleados = $this->model->findAll();
        return $this->respond($empleados);

		/*$userModel = new UserModel($db);
		$user = $userModel->find('1');
		var_dump($user);
		return view('welcome_message');*/
        
	}

    public function Empleados()
	{
        $empleados = $this->model->findAll();
        return $this->setResponseFormat('json')->respond($empleados);
	}

    // Crear unn nuevo empleado - POST
    public function create(){
        try {
           $empleados = $this->request->getJSON(); // recibo la data enviada desde el cliente
           if($this->model->insert( $empleados)): // ejecuto la función insert para guardar el json almacenado en la variable "$empleado"
                $empleados->Id = $this->model->insertID();
                return $this->setResponseFormat('json')->respondCreated($empleados); // enviamos respuesta de que se inserto al cliente
           else:
                return $this->failValidationErrors($this->model->validation->listErrors()); // se muestran los errores 
           endif;
        } catch (\Exception $th) {
            return $this->failServerError('Error en el servidor');
        }
    }

    // Consultar la información por id - GET
    public function edit($id = null){
        try {
            if($id == null)
                return $this->failValidationErrors('No se ha pasado un id valido');

            $empleado = $this->model->find($id);
            if($empleado == null)
                return $this->failNotFound('No se encontro en el sistema un cliente con identificación: '.$id);

            return $this->respond($empleado) ;


        } catch (\Exception $th) {
            return $this->failServerError('Ha ocurrido un un error en el servidor');
        }
    }

    // Actualizar la información - PUT
    public function update($id = null){
        try {
            if($id == null)
                return $this->failValidationErrors('No se ha pasado un id valido');

            $empleadoVer = $this->model->find($id);
            if($empleadoVer == null)
                return $this->failNotFound('No se encontro en el sistema un cliente con identificación: '.$id);
           
            $empleado =  $this->request->getJSON();
            if($this->model->update($id, $empleado)): // ejecuto la función update para actualizar la información en la base de datos
                $empleado->Id = $id;
                return $this->respondUpdated($empleado); // enviamos respuesta de que se inserto al cliente
           else:
                return $this->failValidationErrors($this->model->validation->listErrors()); // se muestran los errores 
            endif;

        } catch (\Exception $th) {
            return $this->failServerError('Ha ocurrido un un error en el servidor');
        }
    }

    // Eliminar un empleado de la base de datos - DELETE
    public function delete($id = null){
        try {
            if($id == null)
                return $this->failValidationErrors('No se ha pasado un id valido');

            $empleadoVer = $this->model->find($id);
            if($empleadoVer == null)
                return $this->failNotFound('No se encontro en el sistema un cliente con identificación: '.$id);
           
           
            if($this->model->delete($id)): // ejecuto la función delete para eliminar la información en la base de datos
                return $this->respondDeleted($empleadoVer); // enviamos respuesta de que se elimino al cliente
           else:
                return $this->failServerError('No se pudo eliminar registro de la base de datos');
            endif;

        } catch (\Exception $th) {
            return $this->failServerError('Ha ocurrido un un error en el servidor');
        }
    }

    public function validarLogin(){

                
        $usuario = $this->request->getJSON();
        $user = $usuario->usuario;
        $pass = $usuario->contrasena;
        $datosUsuario = $this->model->where('user', $user)->first();
        
        if($datosUsuario != null){
            if($datosUsuario['estado_usuario']=="1"){
                return "1";
            }else{

                if(verifyPassword($pass,$datosUsuario['password'])){
                   
                    //return $this->respond($jwt);
                    //$token =  $this->respond($jwt);
                    /*$datosSesion = [
                        'id' => $datosUsuario['id_usuario'],
                        'nombre' => $datosUsuario['nombre'],
                        'tipo_usuario' => $datosUsuario['tipo_usuario'],
                        'estado_usuario' => $datosUsuario['estado_usuario'],
                        'login' => TRUE,
                        //'token' => $token,
                    ];*/
                    
                    //$session = session();
                   //$session = $this->session->set($datosSesion); 
                   $jwt = $this->generateJWT($datosUsuario);
                   //return $this->respond($jwt);
                  
                  
                   $datosUsuario['token'] = $jwt;
                  
                   return $this->respond($datosUsuario);
                   // return redirect()->to(base_url().'/principal');
                   // echo view('inicio/principal',$session );    
                }else{
                    //$data = "El password no coincide";
                    return "2";
                    //echo view('inicio/login',$data);
                }
            }   
        }else{
            //$data = "EL usuario no existe";
            return "3";
            //echo view('inicio/login',$data);
        }

  
}



    /*
     public function conectar(){
		//$dbconect = $this->request->getPost('db');
		//$conexio = new Conexion();
		//$db = $conexio->conectar($dbconect);
		$dbconect = $this->request->getPost('db');
		$db = \Config\Database::connect();
		$db->setDatabase($dbconect);
		$db->reconnect();

		
		$clientes= $this->model->findAll();
		return $this->respond($clientes);
		/*
		$db = $this->conexio->conectar($dbconect);
		$this->model=$this->setModel(new clientemodel($db));
		$clientes= $this->model->findAll();
		return $this->respond($clientes);
	
     */


    public function uploadImage()
	{
		$file = $this->request->getFile('image');

		$profile_image = $file->getName();

		// Renaming file before upload
		$temp = explode(".",$profile_image);
		$newfilename = round(microtime(true)) . '.' . end($temp);

		if ($file->move("images", $newfilename)) {

			/* $fileModel = new FileModel(); */

			$data = [
				"file_name" => $newfilename,
				"file_path" => "/images/" . $newfilename
			];

			if ($this->model->insert($data)) {

				$response = [
					'status' => 200,
					'error' => false,
					'message' => 'File uploaded successfully',
					'data' => []
				];
			} else {

				$response = [
					'status' => 500,
					'error' => true,
					'message' => 'Failed to save image',
					'data' => []
				];
			}
		} else {

			$response = [
				'status' => 500,
				'error' => true,
				'message' => 'Failed to upload image',
				'data' => []
			];
		}

		return $this->respondCreated($response);
	}
}