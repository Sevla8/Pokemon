<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokemon_Capacity_Model extends CI_Model {

	private $table = 'pokemon_capacity';

	public function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->model('Capacity_model', 'capacity_model');
		$this->load->model('Pokedex_Capacity_model', 'pokedex_capacity_model');
	}

	public function get_capacity($id_pokemon) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_pokemon', $id_pokemon)
						->get()
						->result_array();
	}

	public function set_capacity($id_pokemon, $id_capacity, $pp) {
		$this->db->set('id_pokemon', $id_pokemon)
				 ->set('id_capacity', $id_capacity)
				 ->set('pp', $pp)
				 ->insert($this->table);
	}

	public function update_capacity($id_pokemon, $id_capacity, $pp) {
		$this->db->set('pp', $pp)
				 ->where('id_pokemon', $id_pokemon)
				 ->where('id_capacity', $id_capacity)
				 ->update($this->table);
	}

	public function get_pp($id_capacity, $id_pokemon) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_capacity', $id_capacity)
						->where('id_pokemon', $id_pokemon)
						->get()
						->result_array()[0]['pp'];
	}

	public function new_day($id_trainer) {
		$pokemon = $this->pokemon_model->get_pokemon($id_trainer);
		foreach ($pokemon as $poke) {
			$capacity = $this->get_capacity($poke['id']);
			foreach ($capacity as $capa) {
				$this->update_capacity($poke['id'], 
									   $capa['id_capacity'],
									   $this->capacity_model->get_capacity($capa['id_capacity'])['pp']);
			}
		}
	}
}
