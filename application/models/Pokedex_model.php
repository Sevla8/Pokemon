<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_model extends CI_Model {

	private $table = 'pokedex';

	public function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->library('session');
		$this->load->model('Type_model', 'type_model');
		$this->load->model('Pokedex_Type_model', 'pokedex_type_model');
		$this->load->model('Pokemon_model', 'pokemon_model');
		$this->load->model('Pokedex_Evolution_model', 'pokedex_evolution_model');
	}

	public function count_pokedex() {
		return $this->db->count_all($this->table);
	}

	public function get_pokedex($nb, $start) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->limit($nb, $start)
						 ->get()
						 ->result_array();

		foreach ($data as &$pokemon) {

			$pokemon['caught'] = $this->pokemon_model->caught($pokemon['id'], $this->session->userdata('id'));

			if ($this->pokedex_evolution_model->have_evolution($pokemon['id']))
				$pokemon['evolution'] = $this->get_pokemon_by_id($this->pokedex_evolution_model->get_evolution($pokemon['id'])['id_to'])['name'];
			else 
				$pokemon['evolution'] = null;

			$types = array();
			$types = $this->pokedex_type_model->get_pokedex_type($pokemon['id']);
			foreach ($types as $type)
				$pokemon['type'][] = $this->type_model->get_type($type['id_type']);
		}
		
		/*foreach ($data as $pokemon) { 	// why ?
			$types = array();
			$types = $this->pokedex_type_model->get_pokedex_type($pokemon['id']);
			foreach ($types as $type)
				$pokemon['type'][] = $this->type_model->get_type($type['id_type']);
		}*/

		return $data;
	}

	public function get_pokemon_like($like) {
		return $this->db->select('name')
						->from($this->table)
						->where('name LIKE', $like.'%')
						->limit(10, 0)
						->order_by('name')
						->get()
						->result_array();
	}

	public function get_pokemon_by_id($id){
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id', $id)
						 ->get()
						 ->result_array()[0];

		$data['caught'] = $this->pokemon_model->caught($data['id'], $this->session->userdata('id'));

		$types = array();
		$types = $this->pokedex_type_model->get_pokedex_type($data['id']);
		foreach ($types as $type)
			$data['type'][] = $this->type_model->get_type($type['id_type']);

		return $data;
	}

	public function get_pokemon_by_name($name) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('name', $name)
						 ->get()
						 ->result_array()[0];

		$data['caught'] = $this->pokemon_model->caught($data['id'], $this->session->userdata('id'));

		if ($this->pokedex_evolution_model->have_evolution($data['id']))
			$data['evolution'] = $this->get_pokemon_by_id($this->pokedex_evolution_model->get_evolution($data['id'])['id_to'])['name'];
		else 
			$data['evolution'] = null;

		$types = array();
		$types = $this->pokedex_type_model->get_pokedex_type($data['id']);
		foreach ($types as $type)
			$data['type'][] = $this->type_model->get_type($type['id_type']);

		return $data;
	}

	public function pokemon_exists($name) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('name', $name)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function wild_pokemon_appears($rand_id_pokedex, $rand_level, $prct_hp) {
		$data = $this->get_pokemon_by_id($rand_id_pokedex);
		$data['level'] = $rand_level;
		$data['%_hp'] = $prct_hp;

		return $data;
	}
}
