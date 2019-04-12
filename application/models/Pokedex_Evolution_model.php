<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_Evolution_model extends CI_Model {

	private $table = 'pokedex_evolution';

	public function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->library('session');
	}

	public function have_evolution($id_from) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id_from)
						 ->count_all_results();

		if ($id_from == 133)	// Evoli
			return false;		// on decide de ne rien afficher

		return $data > 0 ? true : false;
	}

	public function get_evolution($id_from) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_from', $id_from)
						->get()
						->result_array()[0];
	}
}