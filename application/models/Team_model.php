<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Team_Model extends CI_Model {

	private $pokemon_table = 'pokemon';
	private $pokedex_table = 'pokedex';
	private $pokemon_capacity_table = 'pokemon_capacity';
	private $capacity_table = 'capacity';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_pokemon($id) {
		return $this->db->select('*')
						->from($this->pokemon_table.' a')
						->join($this->pokedex_table.' b', 'a.id_pokedex = b.id')
						->join($this->pokemon_capacity_table.' c', 'a.id = c.id_pokemon')
						->join($this->capacity_table.' d', 'c.id_capacity = d.id')
						->where('a.id_trainer', $id)
						->get()
						->result_array();
	}


}
