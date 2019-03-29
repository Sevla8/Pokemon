<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Team_Model extends CI_Model {

	private $table_pokemon = 'pokemon';
	private $table_pokemon_capacity = 'pokemon_capacity';
	private $table_pokemon_status = 'pokemon_status';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_pokemon($id) {
		return $this->db->select('*')
						->from($this->table_pokemon)
						->join($this->table_pokemon, $this->table_pokemon.'.id = '.$this->table_pokemon_capacity.'.id_pokemon')
						->join($this->table_pokemon, $this->table_pokemon.'.id = '.$this->table_pokemon_status.'.id_pokemon')
						->where('id_trainer', $id)
						->get()
						->result_array();
	}


}