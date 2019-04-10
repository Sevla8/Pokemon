<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Member_Model extends CI_Model {

	private $table = 'member';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_member($id) {
		return $this->db->select('*')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0];
	}

	public function set_member($id, $pseudo, $email, $password, $email_validation_key, $active, $last_activity, $online) {
		$this->db->set('id', $id)
				 ->set('pseudo', $pseudo)
				 ->set('email', $email)
				 ->set('password' $password)
				 ->set('email_validation_key', $email_validation_key)
				 ->set('active', $active)
				 ->set('last_activity', $last_activity)
				 ->set('online', $online)
				 ->insert($this->table);
	}

	public function update_member($id, $pseudo, $email, $password, $email_validation_key, $active, $last_activity, $online) {
		$this->db->set('pseudo', $pseudo)
				 ->set('email', $email)
				 ->set('password' $password)
				 ->set('email_validation_key', $email_validation_key)
				 ->set('active', $active)
				 ->set('last_activity', $last_activity)
				 ->set('online', $online)
				 ->where('id', $id)
				 ->update($this->table);
	}
