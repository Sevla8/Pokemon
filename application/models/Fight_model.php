<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Fight_model extends CI_Model {

	private $pokemon_table = 'pokemon';
	private $pokedex_table = 'pokedex';
	private $trainer_table = 'trainer';
	private $member_table = 'member';
	private $challenge_table = 'challenge';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_online() {
		return $this->db->select('id, pseudo')
						->from($this->member_table)
						->where('online', 1)
						->get()
						->result_array();
	}

	public function challenge_already_send($id_from, $id_to) {
		return $this->db->select('*')
						->from($this->challenge_table)
						->where('id_from', $id_from)
						->where('id_to', $id_to)
						->get()
						->result();
	}

	public function send_challenge($id_from, $id_to) {
		$this->db->set('id_from', $id_from)
				 ->set('id_to', $id_to)
				 ->insert($this->challenge_table);
	}

	public function delete_challenge($id_from, $id_to) {
		$this->db->where('id_from', $id_from)
				 ->where('id_to', $id_to)
				 ->delete($this->challenge_table);
	}

	public function stop_challenge($id_from) {
		$this->db->where('id_from', $id_from)
				 ->delete($this->challenge_table);
	}
}
