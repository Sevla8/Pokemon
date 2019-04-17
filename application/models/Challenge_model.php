<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Challenge_model extends CI_Model {

	private $table = 'challenge';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function check($id_from, $id_to) {
		$this->db->set('checked', 1)
				 ->where('id_from', $id_from)
				 ->where('id_to', $id_to)
				 ->update($this->table);
	}

	public function exists_challenge($id_to) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_to', $id_to)
						 ->where('checked', 0)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function get_all_challenge($id_to) {
		if ($this->exists_challenge($id_to)) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_to', $id_to)
							 ->order_by('timestamp', 'DESC')
							 ->get()
							 ->result_array();

			$result;
			for ($i = 0; $i < sizeof($data); $i += 1) {
				$result[$data[$i]['id_from']] = $data[$i];
			}

			return $result;
		}
	}

	public function get_challenge($id_to) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_to', $id_to)
						->where('checked', 0)
						->order_by('timestamp', 'DESC')
						->get()
						->result_array()[0]['id_from'];
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
				 ->set('checked', 0)
				 ->set('timestamp', 'NOW()')
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