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

	public function set_trainer($id, $name, $pokedollar, $pokeball, $potion) {
		$this->db->set('id', $id)
				 ->set('name', $name)
				 ->set('pokedollar', $pokedollar)
				 ->set('pokeball', $pokeball)
				 ->set('potion', $potion)
				 ->insert($this->table);
	}

	public function update_trainer($id, $name, $pokedollar, $pokeball, $potion) {
		$this->db->set('name', $name)
				 ->set('pokedollar', $pokedollar)
				 ->set('pokeball', $pokeball)
				 ->set('potion', $potion)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function potion($id_trainer, $amount) {
		$potion = $this->db->select('potion')
						   ->from($this->table)
						   ->where('id', $id_trainer)
						   ->get()
						   ->result_array()[0]['potion'];

		$this->db->set('potion', $potion + $amount)
				 ->where('id', $id_trainer)
				 ->update($this->table);
	}
}
