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

	public function get_pokedollar($id) {
		return $this->db->select('pokedollar')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0]['pokedollar'];
	}

	public function get_pokeball($id) {
		return $this->db->select('pokeball')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0]['pokeball'];
	}

	public function get_potion($id) {
		return $this->db->select('potion')
						->from($this->table)
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
				 ->update($this->table);
	}

	public function new_day($id) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id', $id)
						 ->get()
						 ->result_array()[0];

		$this->db->set('pokedollar', $data['pokedollar'] + 50)
				 ->set('pokeball', $data['pokeball'] + 5)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function pseudo_exists($pseudo) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('name', $pseudo)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}
}
