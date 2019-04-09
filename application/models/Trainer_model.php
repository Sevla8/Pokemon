<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Trainer_Model extends CI_Model {

	private $table = 'trainer';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_trainer($id) {
		return $this->db->select('*')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0];
	}

	public function set_trainer($name, $pokedollar, $pokeball, $potion) {

	}
}
