<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_Capacity_Model extends CI_Model {

	private $table = 'pokedex_capacity';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_capacity($id_pokedex, $level) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_pokedex', $id_pokedex)
						->where('level <=', $level)
						->where('level <>', -1)
						->order_by('level', 'DESC')
						->limit(4, 0)
						->get()
						->result_array();
	}
}
