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

		for ($i = 0; $i < sizeof($data); $i += 1) {

			$data[$i]['caught'] = $this->pokemon_model->caught($data[$i]['id'], $this->session->userdata('id'));

			if ($this->pokedex_evolution_model->have_evolution($data[$i]['id']))
				$data[$i]['evolution'] = $this->get_pokemon_by_id($this->pokedex_evolution_model->get_evolution($data[$i]['id'])['id_to'])['name'];
			else 
				$data[$i]['evolution'] = null;

			$types = array();
			$types = $this->pokedex_type_model->get_pokedex_type($data[$i]['id']);
			foreach ($types as $type)
				$data[$i]['type'][] = $this->type_model->get_type($type['id_type']);
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
}
