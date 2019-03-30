<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokedex_model extends CI_Model {

	private $table_pokedex = 'pokedex';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_pokedex() {
		return $this->db->select('*')
						->from($this->table_pokedex)
						->get()
						->result_array();
	}

}
