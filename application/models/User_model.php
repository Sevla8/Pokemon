<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class User_model extends CI_Model {

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function add_member($pseudo, $email, $password, $pokemon, $key) {
		$this->db->set('pseudo', $pseudo, true);
		$this->db->set('email', $email, true);
		$this->db->set('password', sha1($pseudo));
		$this->db->set('email_validation_key', $key);
		$this->db->insert('member');

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

	public function member_exists($pseudo, $key) {

	}

	public function member_active($pseudo, $key) {

	}

	public function active_member($pseudo, $key) {
		
	}
}