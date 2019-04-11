<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokemon_Model extends CI_Model {

	private $table = 'pokemon';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function caught($id_pokedex, $id_trainer) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_pokedex', $id_pokedex)
						 ->where('id_trainer', $id_trainer)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

}