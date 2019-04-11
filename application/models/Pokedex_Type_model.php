<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_Type_model extends CI_Model {

	private $table = 'pokedex_type';

	public function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->model('Type_model', 'type_model');
	}

	public function get_pokedex_type($id_pokedex) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_pokedex', $id_pokedex)
						->get()
						->result_array();
	}
}
