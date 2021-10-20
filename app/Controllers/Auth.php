<?php

namespace App\Controllers;

use App\Models\EmpleadosModel;
use App\Models\LoginModel;
use CodeIgniter\API\ResponseTrait;
use CodeIgniter\Controller;
use Config\Services;
use \Firebase\JWT\JWT;

class Auth extends BaseController
{
    use ResponseTrait;
    function __construct()
    {
        helper('HashPassword');
    }

	/* public function login()
	{
		try {
            $user     = $this->request->getPost('usuario');
            $password = $this->request->getPost('password');
            $usuarioModel = new LoginModel();

            $usuario = $usuarioModel->where('usuario', $user)->first();

            if($usuario == null)
                return $this->failNotFound('Usuario no encontrado');

            if(verifyPassword($password,$usuario['password'])):
                

                $jwt = $this->generarJWT($usuario);
                return $this->respond(['TOKEN' => $jwt], 201);

            else:
                return $this->failValidationErrors('Usuario no encontrado');
            endif;

            
        } catch (\Throwable $th) {
            return $this->failServerError('Ha ocurrido un un error en el servidor  '. $th);
        }
	} */

    public function validarLogin(){
        
        /* $username = $this->request->getPost('usuario');
        $password = $this->request->getPost('password'); */

        $usuario = $this->request->getJSON();
        $user = $usuario->usuario;
        $pass = $usuario->contrasena;
        
        $empleado = new EmpleadosModel();
        $empleado = $this->model->where('usuario', $user)->first();

        echo $empleado->username;

        //var_dump($datosUsuario);
        if( $empleado != null ){
            if( $empleado['estado'] == "1" ){
                //$data['error'] = "Usuario invalido";
                return "1";
            }else{

                if(verifyPassword( $pass, $empleado['contrasena'] ) ){
                   
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
                   $jwt = $this->generarJWT($empleado);
                   //return $this->respond($jwt);
                  
                  
                   $datosUsuario['token'] = $jwt;
                  
                   return $this->respond($datosUsuario);
                   // return redirect()->to(base_url().'/principal');  
                }else{
                    return "2";

                }
            }   
        } else {
            return "3";
        }
    }

    protected function generarJWT($usuario){
        $key = Services::getSecretKey();
        $time = time();
        $payLoad = [
            'aud' => base_url(),
            'iat' => (int)$time,// definir tiempo como valor entero
            'exp' => (int)$time + 600, //tiempo de expiración
            'data' => [
                'nombre' => $usuario['usuario']
                
            ]
        ];

        $jwt = JWT::encode($payLoad, $key);
        return $jwt;
    }

    public function validacionToken($token){
        try {
            $key = Services::getSecretKey();
            return JWT::decode($token, $key, array('HS256'));
        } catch (\Exception $th) {
           return false;
        }
    }

    public function verifyToken(){
        $key = Services::getSecretKey();
        $token = $this->request->getPost('TOKEN');
        if($this->validacionToken($token) == false){
            return $this->respond(['mensaje'=>'Token invalido'], 401);
        }else{
            $data =  JWT::decode($token, $key, array('HS256'));
            return $this->respond(['data'=>$data], 200);
        }
    }


    
}
