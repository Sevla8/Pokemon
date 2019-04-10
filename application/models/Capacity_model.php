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
		$data = $this->db->select('c.id AS id, c.name AS name, c.id_type AS id_type, c.class AS class, c.puis AS puis, c.prec AS prec, c.pp AS pp, c.eff_sec AS eff_sec, t.name AS type_name')
						 ->from($this->table.' c')
						 ->join('type t', 't.id = c.id_type')
						 ->where('c.id', $id)
						 ->get()
						 ->result_array()[0];
		return $data;
	}
}