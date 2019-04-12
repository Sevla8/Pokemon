<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokemon_Capacity_Model extends CI_Model {

	private $table = 'pokemon_capacity';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_capacity($id_pokemon) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_pokemon', $id_pokemon)
						->get()
						->result_array();
	}

	public function get_pp($id_capacity, $id_pokemon) {
		return $this->db->select('pp')
						->from($this->table)
						->where('id_capacity', $id_capacity)
						->where('id_pokemon', $id_pokemon)
						->get()
						->result_array()[0]['pp'];
	}
}