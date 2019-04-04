<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Shop_model extends CI_Model {

	private $trainer_table = 'trainer';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_pokedollar($id) {
		return $this->db->select('pokedollar')
						->from($this->trainer_table)
						->where('id', $id)
						->get()
						->result_array()[0]['pokedollar'];
	}

	public function get_pokeball($id) {
		return $this->db->select('pokeball')
						->from($this->trainer_table)
						->where('id', $id)
						->get()
						->result_array()[0]['pokeball'];
	}

	public function get_potion($id) {
		return $this->db->select('potion')
						->from($this->trainer_table)
						->where('id', $id)
						->get()
						->result_array()[0]['potion'];
	}

	public function debit($id, $pokedollar, $potion, $pokeball) {
		$old_pokedollar = $this->get_pokedollar($id);
		$old_pokeball = $this->get_pokeball($id);
		$old_potion = $this->get_potion($id);
		$this->db->set('pokedollar', $old_pokedollar - $pokedollar)
				 ->set('pokeball', $old_pokeball + $pokeball)
				 ->set('potion', $old_potion + $potion)
				 ->where('id', $id)
				 ->update($this->trainer_table);
	}
}
