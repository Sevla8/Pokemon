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

		$update = array('pokedollar' => $data['pokedollar'] + 50, 
						'pokeball' => $data['pokeball'] + 5);

		$this->db->update('trainer', $update)
				 ->where('id', $id);
	}
}
