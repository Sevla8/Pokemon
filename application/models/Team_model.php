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

	public function get_pc($id) {
		return $this->db->select('a.level, a.xp, a.%_hp, a.in_team, b.name AS name_pokemon, b.id AS id_pokemon, b.hp, b.attack, b.defense, 						  b.sp_attack, b.sp_defense, b.speed, b.description, c.pp, d.name AS capacity_name, d.class, d.puis, 							  d.prec, d.pp AS pp_max, d.eff_sec, d.id AS id_capacity, f.name AS name_type')
						->from($this->pokemon_table.' a')
						->join($this->pokedex_table.' b', 'a.id_pokedex = b.id')
						->join($this->pokemon_capacity_table.' c', 'a.id = c.id_pokemon')
						->join($this->capacity_table.' d', 'c.id_capacity = d.id')
						->join($this->pokedex_type_table.' e', 'b.id = e.id_pokedex')
						->join($this->type_table.' f', 'e.id_type = f.id')
						->where('a.id_trainer', $id)
						->get()
						->result_array();
	}


}
