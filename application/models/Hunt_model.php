<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Hunt_model extends CI_Model {

	private $table_pokemon = 'pokemon';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_team_size($id) {
		return $this->db->select('COUNT(*)')
						->from($this->table_pokemon)
						->where('id_trainer', $id)
						->get()
						->result_array()[0]['COUNT(*)'];
	}

	public function get_wild_pokemon($rand_id_pokedex, $rand_level) {
		$this->db->set('id_pokedex', $randId_pokedex)
					->set('level', $randLevel)
					->set('xp', $randXp)
					->set('id_trainer', $id_trainer)
					->insert('pokemon');
	}
}