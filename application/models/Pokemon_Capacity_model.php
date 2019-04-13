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

	public function set_capacity($id_pokemon, $id_pokedex, $level) {
		$data = $this->pokedex_capacity_model->get_capacity($id_pokedex);

		foreach ($data as $key => $capacity) {
			if ($capacity['level'] <= $level) {
				$this->db->set('id_pokemon', $id_pokemon)
						 ->set('id_capacity', $capacity['id_capacity'])
						 ->set('pp', $this->capacity_model->get_capacity($capacity['id_capacity'])['pp'])
						 ->insert($this->table);
			}
		}
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