<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_model extends CI_Model {

	private $pokedex_table = 'pokedex';
	private $pokemon_table = 'pokemon';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_pokedex() {
		return $this->db->select('*')
						->from($this->pokedex_table)
						->get()
						->result_array();
	}

	public function get_pokedex_trainer($id) {
		return $this->db->select('id_pokedex')
						->from($this->pokemon_table)
						->where('id_trainer', $id)
						->get()
						->result_array();
	}

	public function get_pokemon_like($like) {
		return $this->db->select('name')
						->from($this->pokedex_table)
						->where('name LIKE', $like.'%')
						->get()
						->result_array();
	}

	public function get_pokedex_pokemon($name) {
		return $this->db->select('*')
						->from($this->pokedex_table)
						->where('name', $name)
						->get()
						->result_array()[0];
	}

	public function pokemon_exists($name) {
		return $this->db->select('*')
						->from($this->pokedex_table)
						->where('name', $name)
						->get()
						->result();
	}
}
