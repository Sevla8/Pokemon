<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Capacity_Model extends CI_Model {

	private $table = 'capacity';

	public function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->model('Type_model', 'type_model');
	}

	public function get_capacity($id) {
		return $this->db->select('c.*, t.name AS type')
						->from($this->table.' c')
						->join('type t', 'c.id_type = t.id')
						->where('c.id', $id)
						->get()
						->result_array()[0];
	}
}
