<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Challenge_model extends CI_Model {

	private $table = 'challenge';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function challenge_already_send($id_from, $id_to) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id_from)
						 ->where('id_to', $id_to)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function send_challenge($id_from, $id_to) {
		$this->db->set('id_from', $id_from)
				 ->set('id_to', $id_to)
				 ->insert($this->table);
	}

	public function delete_challenge($id_from, $id_to) {
		$this->db->where('id_from', $id_from)
				 ->where('id_to', $id_to)
				 ->delete($this->table);
	}

	public function stop_challenge($id_from) {
		$this->db->where('id_from', $id_from)
				 ->delete($this->table);
	}
}