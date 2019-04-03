<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_model extends CI_Model {

	private $pokedex_table = 'pokedex';

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

}
