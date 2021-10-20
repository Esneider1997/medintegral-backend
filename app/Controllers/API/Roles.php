<?php

namespace App\Controllers\API;

use CodeIgniter\RESTful\ResourceController;
use App\Models\RolModel;

class Roles extends ResourceController
{

	public function __construct()
	{	
		helper('MultiConnection');
		$model = $this->setModel(new RolModel($db));
	}
	/**
	 * Return an array of resource objects, themselves in array format
	 *
	 * @return mixed
	 */
	public function index()
	{
		setdb('medic_desarrollo');
		$roles = $this->model->findAll();
		return $this->respond($roles);
	}

	/**
	 * Return the properties of a resource object
	 *
	 * @return mixed
	 */
	public function show($id = null)
	{
		
	}

	/**
	 * Return a new resource object, with default properties
	 *
	 * @return mixed
	 */
	public function new()
	{
		
	}

	/**
	 * Create a new resource object, from "posted" parameters
	 *
	 * @return mixed
	 */
	public function create()
	{
		try{
			$rol = $this->request->getJSON();
			if($this->model->insert($rol)):
				$rol->id = $this->model->insertID();
				return $this->respondCreated($rol);
			else:
				return $this->failValidationErrors($this->model->validation->listErrors());
			endif;
		}catch(\Exception $e){
			return $this->failServerError('Ha ocurrido un error en el servidor '.$e);
		}
	}

	/**
	 * Return the editable properties of a resource object
	 *
	 * @return mixed
	 */
	public function edit($id = null)
	{
		try{
			if( $id == null )
				return $this->failValidationErrors('No se ha encontrado un id valido');
			$rol = $this->model->find($id);
			if( $rol == null )
				return $this->failNotFound('No se ha encontrado un rol con el id '.$id);

			return $this->respond($rol);
		}catch(\Exception $e){
			return $this->failValidationErrors('Ha encontrado un error en el servidor '.$e);
		}
	}

	/**
	 * Add or update a model resource, from "posted" properties
	 *
	 * @return mixed
	 */
	public function update($id = null)
	{
		try {
			if( $id == null )
				return $this->failValidationErrors('No se ha encontrado un id valido');

			$rolVerificado = $this->model->find($id);
			if( $rolVerificado == null )
				return $this->failNotFound('No se ha encontrado un rol con el id '.$id);
			
			$rol = $this->request->getJSON();

			if ($this->model->update($id, $rol)):
				$rol->id = $id;
				return $this->respondUpdated($rol);
			else:
				return $this->failServerError($this->model->validation->listErrors());
			endif;
		} catch (\Exception $e) {
			return $this->failServerError('Ha ocurrido un error en el servidor '.$e);
		}
	}

	/**
	 * Delete the designated resource object from the model
	 *
	 * @return mixed
	 */
	public function delete($id = null)
	{
		try {
			
			if ($id == null )
				return $this->failValidationErrors('No se ha encontrado un id valido');
			
			$rol = $this->model->find($id);
			if ($rol == null) 
				return $this->failNotFound('No se ha encontrado un rol con el id '.$id);
			
			if ( $this->model->delete($id) ) {
				return $this->respondDeleted($rol);
			}else{
				return $this->failServerError('No se pudo eliminar registro de la base de datos');
			}
		} catch (\Exception $e) {
			return $this->failServerError('ha ocurrido un error en el servidor'.$e);
		}
	}
}
