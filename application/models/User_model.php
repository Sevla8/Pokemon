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

		$this->db->set('name', $pseudo, true)
				 ->set('id_member', $id_member)
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

		$id_trainer = $this->db->select('id')
							   ->from('trainer')
							   ->where('name', $pseudo)
							   ->get()
							   ->result_array()[0]['id'];

		$this->db->set('level', 1)
				 ->set('xp', 0)
				 ->set('id_trainer', $id_trainer)
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

	public function save_data($pseudo) {
		return $this->db->select('*')
					->from('member')
					->join('trainer', 'member.id = trainer.id_member');
	}

	// public function new_day() {
	// 	$this->db->set('')
	// }
}
