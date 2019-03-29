<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class User_model extends CI_Model {

	private $table = 'member';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function add_member($pseudo, $email, $password, $pokemon, $key) {
		$this->db->set('pseudo', $pseudo, true)
				 ->set('email', $email, true)
				 ->set('password', sha1($password))
				 ->set('email_validation_key', $key)
				 ->insert($this->table);


		$id_member = $this->db->select('id')
							  ->from('member')
							  ->where('pseudo', $pseudo)
							  ->get()
							  ->result_array()[0]['id'];

		$this->db->set('id', $id_member)
				 ->set('name', $pseudo, true)
				 ->insert('trainer');

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
				 ->set('id_trainer', $id_member)
				 ->set('id_pokedex', $id_pokedex)
				 ->insert('pokemon');

		$id = $this->db->select('id')
					   ->from('pokemon')
					   ->where('id_trainer', $id_member)
					   ->where('id_pokedex', $id_pokedex)
					   ->get()
					   ->result_array()[0]['id'];

		$this->db->set('id_pokemon', $id)
				 ->insert('pokemon_status');

		$id_capacity = $this->db->select('id_capacity')
								->from('pokedex_capacity')
								->where('id_pokedex', $id_pokedex)
								->where('level <=', 1)
								->get()
								->result_array();

		$id_capacity_1 = $id_capacity[0]['id_capacity'];
		$id_capacity_2;
		if ($pokemon == 'salameche')
			$id_capacity_2 = $id_capacity[1]['id_capacity'];

		$pp_1 = $this->db->select('pp')
						 ->from('capacity')
						 ->where('id', $id_capacity_1)
						 ->get()
						 ->result_array()[0]['pp'];

		$pp_2;
		if ($pokemon == 'salameche') {
			$pp_2 = $this->db->select('pp')
							 ->from('capacity')
							 ->where('id', $id_capacity_2)
							 ->get()
							 ->result_array()[0]['pp'];
		}

		$this->db->set('id_pokemon', $id)
				 ->set('id_capacity', $id_capacity_1)
				 ->set('pp', $pp_1)
				 ->insert('pokemon_capacity');

		if ($pokemon == 'salameche') {
			$this->db->set('id_pokemon', $id)
					 ->set('id_capacity', $id_capacity_2)
					 ->set('pp', $pp_2)
					 ->insert('pokemon_capacity');
		}

	}

	public function pseudo_exists($pseudo) {
		return $this->db->select('*')
						->from($this->table)
						->where('pseudo', $pseudo)
						->get()
						->result();
	}

	public function email_exists($email) {
		return $this->db->select('*')
						->from($this->table)
						->where('email', $email)
						->get()
						->result();
	}

	public function member_exists_0($pseudo, $key) {
		return $this->db->select('*')
						->from($this->table)
						->where('pseudo', $pseudo)
						->where('email_validation_key', $key)
						->get()
						->result();
	}

	public function member_exists($pseudo, $password) {
		return $this->db->select('*')
						->from($this->table)
						->where('pseudo', $pseudo)
						->where('password', $password)
						->get()
						->result();
	}

	public function member_active_0($pseudo, $key) {
		return $this->db->select('*')
						->from($this->table)
						->where('pseudo', $pseudo)
						->where('email_validation_key', $key)
						->where('active', 1)
						->get()
						->result();
	}
	
	public function member_active($pseudo, $password) {
		return $this->db->select('*')
						->from($this->table)
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
						->update($this->table);
	}

	public function get_id($pseudo) {
		return $this->db->select('id')
						->from('member')
						->where('pseudo', $pseudo)
						->get()
						->result_array()[0]['id'];
	}

	public function get_day($id) {
		return $this->db->select('DAY(last_activity)')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0]['DAY(last_activity)'];
	}

	public function new_day($id) {
		$data = $this->db->select('*')
						 ->from('trainer')
						 ->where('id', $id)
						 ->get()
						 ->result_array()[0];

		$this->db->set('pokedollar', $data['pokedollar'] + 50)
				 ->set('pokeball', $data['pokeball'] + 5)
				 ->where('id', $id)
				 ->update('trainer');

		$data = $this->db->select('id')
						 ->from('pokemon')
						 ->where('id_trainer', $id)
						 ->get()
						 ->result_array();

		foreach ($data as $poke) {
			$this->db->set('hp', 100)
					 ->where('id_pokemon', $poke['id'])
					 ->update('pokemon_status');
		}
	}

	public function set_last_activity($id) {
		$this->db->set('last_activity', date('Y-m-d G:i:s'))
				 ->where('id', $id)
				 ->update('member');
	}
}
