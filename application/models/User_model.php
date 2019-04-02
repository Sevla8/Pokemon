<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class User_model extends CI_Model {

	private $member_table = 'member';
	private $trainer_table = 'trainer';
	private $pokemon_table = 'pokemon';
	private $pokedex_capacity_table = 'pokedex_capacity';
	private $capacity_table = 'capacity';
	private $pokemon_capacity_table = 'pokemon_capacity';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function add_member($pseudo, $email, $password, $pokemon, $key) {
		$this->db->set('pseudo', $pseudo, true)
				 ->set('email', $email, true)
				 ->set('password', sha1($password))
				 ->set('email_validation_key', $key)
				 ->insert($this->member_table);


		$id_member = $this->db->select('id')
							  ->from($this->member_table)
							  ->where('pseudo', $pseudo)
							  ->get()
							  ->result_array()[0]['id'];

		$this->db->set('id', $id_member)
				 ->set('name', $pseudo, true)
				 ->insert($this->trainer_table);

		$id_pokedex;
		switch ($pokemon) {
			case 'bulbizarre':
				$id_pokedex = 1;
				break;
			case 'salameche':
				$id_pokedex = 4;
				break;
			case 'carapuce':
				$id_pokedex = 7;
				break;
		}

		$this->db->set('level', 1)
				 ->set('xp', 0)
				 ->set('%_hp', 100)
				 ->set('id_trainer', $id_member)
				 ->set('id_pokedex', $id_pokedex)
				 ->set('in_team', 1)
				 ->insert($this->pokemon_table);

		$id = $this->db->select('id')
					   ->from($this->pokemon_table)
					   ->where('id_trainer', $id_member)
					   ->where('id_pokedex', $id_pokedex)
					   ->get()
					   ->result_array()[0]['id'];

		$id_capacity = $this->db->select('id_capacity')
								->from($this->pokedex_capacity_table)
								->where('id_pokedex', $id_pokedex)
								->where('level <=', 1)
								->get()
								->result_array();

		$id_capacity_1 = $id_capacity[0]['id_capacity'];
		$id_capacity_2;
		if ($pokemon == 'salameche')
			$id_capacity_2 = $id_capacity[1]['id_capacity'];

		$pp_1 = $this->db->select('pp')
						 ->from($this->capacity_table)
						 ->where('id', $id_capacity_1)
						 ->get()
						 ->result_array()[0]['pp'];

		$pp_2;
		if ($pokemon == 'salameche') {
			$pp_2 = $this->db->select('pp')
							 ->from($this->capacity_table)
							 ->where('id', $id_capacity_2)
							 ->get()
							 ->result_array()[0]['pp'];
		}

		$this->db->set('id_pokemon', $id)
				 ->set('id_capacity', $id_capacity_1)
				 ->set('pp', $pp_1)
				 ->insert($this->pokemon_capacity_table);

		if ($pokemon == 'salameche') {
			$this->db->set('id_pokemon', $id)
					 ->set('id_capacity', $id_capacity_2)
					 ->set('pp', $pp_2)
					 ->insert($this->pokemon_capacity_table);
		}

	}

	public function pseudo_exists($pseudo) {
		return $this->db->select('*')
						->from($this->member_table)
						->where('pseudo', $pseudo)
						->get()
						->result();
	}

	public function email_exists($email) {
		return $this->db->select('*')
						->from($this->member_table)
						->where('email', $email)
						->get()
						->result();
	}

	public function member_exists_0($pseudo, $key) {
		return $this->db->select('*')
						->from($this->member_table)
						->where('pseudo', $pseudo)
						->where('email_validation_key', $key)
						->get()
						->result();
	}

	public function member_exists($pseudo, $password) {
		return $this->db->select('*')
						->from($this->member_table)
						->where('pseudo', $pseudo)
						->where('password', $password)
						->get()
						->result();
	}

	public function member_active_0($pseudo, $key) {
		return $this->db->select('*')
						->from($this->member_table)
						->where('pseudo', $pseudo)
						->where('email_validation_key', $key)
						->where('active', 1)
						->get()
						->result();
	}
	
	public function member_active($pseudo, $password) {
		return $this->db->select('*')
						->from($this->member_table)
						->where('pseudo', $pseudo)
						->where('password', $password)
						->where('active', 1)
						->get()
						->result();
	}

	public function active_member($pseudo, $key) {
		return $this->db->set('active', 1)
						->where('pseudo', $pseudo)
						->where('email_validation_key', $key)
						->update($this->member_table);
	}

	public function get_id($pseudo) {
		return $this->db->select('id')
						->from($this->member_table)
						->where('pseudo', $pseudo)
						->get()
						->result_array()[0]['id'];
	}

	public function get_day($id) {
		return $this->db->select('DATE_FORMAT(last_activity, "%Y-%m-%d")')
						->from($this->member_table)
						->where('id', $id)
						->get()
						->result_array()[0]['DATE_FORMAT(last_activity, "%Y-%m-%d")'];
	}

	public function new_day($id) {
		$data = $this->db->select('*')
						 ->from($this->trainer_table)
						 ->where('id', $id)
						 ->get()
						 ->result_array()[0];

		$this->db->set('pokedollar', $data['pokedollar'] + 50)
				 ->set('pokeball', $data['pokeball'] + 5)
				 ->where('id', $id)
				 ->update($this->trainer_table);

		$this->db->set('%_hp', 100)
				 ->where('id_trainer', $id)
				 ->update($this->pokemon_table);
	}

	public function set_last_activity($id) {
		$this->db->set('last_activity', date('Y-m-d G:i:s'))
				 ->where('id', $id)
				 ->update($this->member_table);
	}
}
