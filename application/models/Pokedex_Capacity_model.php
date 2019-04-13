<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_Capacity_Model extends CI_Model {

	private $table = 'pokedex_capacity';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_capacity($id_pokedex) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_pokedex', $id_pokedex)
						->get()
						->result_array();
	}
}
