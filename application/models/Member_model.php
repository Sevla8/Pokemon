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

	public function set_member($email, $password, $email_validation_key, $active, $last_activity, $online) {
		$this->db->set('email', $email)
				 ->set('password', $password)
				 ->set('email_validation_key', $email_validation_key)
				 ->set('active', $active)
				 ->set('last_activity', $last_activity)
				 ->set('online', $online)
				 ->insert($this->table);
	}

	public function update_member($id, $email, $password, $email_validation_key, $active, $last_activity, $online) {
		$this->db->set('pseudo', $pseudo)
				 ->set('email', $email)
				 ->set('password', $password)
				 ->set('email_validation_key', $email_validation_key)
				 ->set('active', $active)
				 ->set('last_activity', $last_activity)
				 ->set('online', $online)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function get_online() {
		return $this->db->select('*')
						->from($this->table.' m')
						->join('trainer t', 't.id = m.id')
						->where('online', 1)
						->get()
						->result_array();
	}

	public function set_online($id) {
		$this->db->set('online', 1)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function set_offline($id) {
		$this->db->set('online', 0)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function set_last_activity($id) {
		$this->db->set('last_activity', date('Y-m-d G:i:s'))
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function get_last_activity($id) {
		return $this->db->select('DATE_FORMAT(last_activity, "%Y-%m-%d")')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0]['DATE_FORMAT(last_activity, "%Y-%m-%d")'];
	}

	public function email_exists($email) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('email', $email)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function active_member($email, $key) {
		$this->db->set('active', 1)
				 ->where('email', $email)
				 ->where('email_validation_key', $key)
				 ->update($this->table);
	}

	public function member_exists_by_email_key($email, $key) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('email', $email)
						 ->where('email_validation_key', $key)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function member_active_by_email_key($email, $key) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('email', $email)
						 ->where('email_validation_key', $key)
						 ->where('active', 1)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function member_exists($email, $password) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('email', $email)
						 ->where('password', $password)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function member_active($email, $password) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('email', $email)
						 ->where('password', $password)
						 ->where('active', 1)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function get_id($email) {
		return $this->db->select('id')
						->from($this->table)
						->where('email', $email)
						->get()
						->result_array()[0]['id'];
	}
}
