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
		$this->db->set('pseudo', $pseudo, true);
		$this->db->set('email', $email, true);
		$this->db->set('password', sha1($password));
		$this->db->set('email_validation_key', $key);
		$this->db->insert($this->table);

		switch ($pokemon) {
			case 'bulbizarre':
				$this->db->set('id_poke', 1);
				break;
			case 'salameche':
				$this->db->set('id_poke', 4);
				break;
			case 'carapuce':
				$this->db->set('id_poke', 7);
				break;
		}
		$this->db->insert('trainer');
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
}