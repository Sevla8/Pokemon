<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_Model extends CI_Model {

	private $table = 'pokedex';

	public function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->model('Type_model', 'type_model');
	}

	public function get_pokedex($id){
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id', $id)
						 ->get()
						 ->result_array()[0];
		$data['type'] = $this->type_model->get_type()
	}
}