<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Team_Model extends CI_Model {

	private $pokemon_table = 'pokemon';
	private $pokedex_table = 'pokedex';
	private $pokemon_capacity_table = 'pokemon_capacity';
	private $capacity_table = 'capacity';
	private $pokedex_type_table = 'pokedex_type';
	private $type_table = 'type';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_pokemon($id) {
		return $this->db->select('*')
						->from($this->pokemon_table.' AS a')
						->join($this->pokedex_table.' AS b', 'a.id_pokedex = b.id')
						->join($this->pokemon_capacity_table.' AS c', 'a.id = c.id_pokemon')
						->join($this->capacity_table.' AS d', 'c.id_capacity = d.id')
						->join($this->pokedex_type_table.' AS e', 'b.id = e.id_pokedex')
						->join($this->type_table.' AS f', 'e.id_type = f.id')
						->where('a.id_trainer', $id)
						->get()
						->result_array();
	}


}
