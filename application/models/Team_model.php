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
	private $trainer_table = 'trainer';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_team($id) {
		return $this->db->select('a.id AS id_pokemon, a.level, a.xp, a.%_hp, a.in_team, b.name AS name_pokemon, b.id AS id_pokedex, b.hp, b.attack, b.defense, b.sp_attack, b.sp_defense, b.speed, b.description, c.pp, d.name AS capacity_name, d.class, d.puis, d.prec, d.pp AS pp_max, d.eff_sec, d.id AS id_capacity, f.name AS name_type')
						->from($this->pokemon_table.' a')
						->join($this->pokedex_table.' b', 'a.id_pokedex = b.id')
						->join($this->pokemon_capacity_table.' c', 'a.id = c.id_pokemon')
						->join($this->capacity_table.' d', 'c.id_capacity = d.id')
						->join($this->pokedex_type_table.' e', 'b.id = e.id_pokedex')
						->join($this->type_table.' f', 'e.id_type = f.id')
						->where('a.id_trainer', $id)
						->where('a.in_team <>', 0)
						->order_by('a.in_team', 'ASC')
						->get()
						->result_array();
	}

	public function get_pc($id) {
		return $this->db->select('a.id AS id_pokemon, a.level, a.xp, a.%_hp, a.in_team, b.name AS name_pokemon, b.id AS id_pokedex, b.hp, b.attack, b.defense, b.sp_attack, b.sp_defense, b.speed, b.description, c.pp, d.name AS capacity_name, d.class, d.puis, d.prec, d.pp AS pp_max, d.eff_sec, d.id AS id_capacity, f.name AS name_type')
						->from($this->pokemon_table.' a')
						->join($this->pokedex_table.' b', 'a.id_pokedex = b.id')
						->join($this->pokemon_capacity_table.' c', 'a.id = c.id_pokemon')
						->join($this->capacity_table.' d', 'c.id_capacity = d.id')
						->join($this->pokedex_type_table.' e', 'b.id = e.id_pokedex')
						->join($this->type_table.' f', 'e.id_type = f.id')
						->where('a.id_trainer', $id)
						->where('a.in_team', 0)
						->get()
						->result_array();
	}

	public function potion($id, $id_trainer) {
		$this->db->set('%_hp', 100)
				 ->where('id', $id)
				 ->update($this->pokemon_table);

		$potion = $this->db->select('potion')
							 ->from($this->trainer_table)
							 ->where('id', $id_trainer)
							 ->get()
							 ->result_array()[0]['potion'];

		$this->db->set('potion', $potion - 1)
				 ->where('id', $id_trainer)
				 ->update($this->trainer_table);
	}

	public function full_hp($id) {
		$hp = $this->db->select('%_hp')
					   ->from($this->pokemon_table)
					   ->where('id', $id)
					   ->get()
					   ->result_array()[0]['%_hp'];

		if ($hp == 100)
			return true;
		return false;
	}

	public function move_up($id, $id_trainer) {
		$position = $this->db->select('in_team')
							 ->from($this->pokemon_table)
							 ->where('id', $id)
							 ->where('id_trainer', $id_trainer)
							 ->get()
							 ->result_array()[0]['in_team'];

		$id_position_plus_1 = $this->db->select('id')
									   ->from($this->pokemon_table)
									   ->where('id_trainer', $id_trainer)
									   ->where('in_team', $position + 1)
									   ->get()
									   ->result_array()[0]['id'];

		$this->db->set('in_team', $position + 1)
				 ->where('id', $id)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->pokemon_table);

		$this->db->set('in_team', $position)
				 ->where('id', $id_position_plus_1)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->pokemon_table);		
	}

	public function move_down($id, $id_trainer) {
		$position = $this->db->select('in_team')
							 ->from($this->pokemon_table)
							 ->where('id', $id)
							 ->where('id_trainer', $id_trainer)
							 ->get()
							 ->result_array()[0]['in_team'];

		$id_position_minus_1 = $this->db->select('id')
										->from($this->pokemon_table)
										->where('id_trainer', $id_trainer)
										->where('in_team', $position - 1)
										->get()
										->result_array()[0]['id'];

		$this->db->set('in_team', $position - 1)
				 ->where('id', $id)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->pokemon_table);

		$this->db->set('in_team', $position)
				 ->where('id', $id_position_minus_1)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->pokemon_table);		
	}
}
