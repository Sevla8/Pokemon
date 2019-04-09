<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Type_Model extends CI_Model {

	private $table = 'type';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function get_type($id) {
		return $this->db->select('*')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0];
	}
}
