<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Challenge_model extends CI_Model {

	private $table = 'challenge';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function set_checked($id_from, $id_to) {
		$this->db->set('checked', 1)
				 ->where('id_from', $id_from)
				 ->where('id_to', $id_to)
				 ->update($this->table);
	}

	public function exists_new_challenge($id_to) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_to', $id_to)
						 ->where('checked', 0)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function exists_challenge($id_to) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_to', $id_to)
						 ->where('closed', 0)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function get_all_challenge($id_to) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_to', $id_to)
							 ->where('closed', 0)
							 ->where('accepted', 0)
							 ->order_by('timestamp', 'DESC')
							 ->get()
							 ->result_array();

			$result;
			for ($i = 0; $i < sizeof($data); $i += 1) {
				$result[$data[$i]['id_from']] = $data[$i];
			}

			return $result;
	}

	public function get_new_challenge($id_to) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_to', $id_to)
						->where('checked', 0)
						->where('accepted', 0)
						->order_by('timestamp', 'DESC')
						->get()
						->result_array()[0]['id_from'];
	}

	public function challenge_already_send($id_from, $id_to) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id_from)
						 ->where('id_to', $id_to)
						 ->where('closed', 0)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function set_challenge($id_from, $id_to) {
		$this->db->set('id_from', $id_from)
				 ->set('id_to', $id_to)
				// ->set('timestamp', time()) ?? (ne fonctionne pas) pas grave -> default
				 ->set('checked', 0)
				 ->set('accepted', 0)
				 ->set('refresh', 0)
				 ->set('closed', 0)
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

	public function accept_challenge($id_from, $id_to) {
		$this->db->set('accepted', 1)
				 ->where('id_from', $id_from)
				 ->where('id_to', $id_to)
				 ->update($this->table);
	}

	public function exists_fight($id) {
		$data_1 = $this->db->select('*')
						   ->from($this->table)
						   ->where('id_from', $id)
						   ->where('accepted', 1)
						   ->where('closed', 0)
						   ->count_all_results();

		$data_2 = $this->db->select('*')
						   ->from($this->table)
						   ->where('id_to', $id)
						   ->where('accepted', 1)
						   ->where('closed', 0)
						   ->count_all_results();

		return $data_1 > 0 || $data_2 > 0 ? true : false;
	}

	public function get_current_fight($id) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_from', $id)
						->where('accepted', 1)
						->where('closed', 0)
						->count_all_results() > 0 ? $this->db->select('*')
															 ->from($this->table)
															 ->where('id_from', $id)
															 ->where('accepted', 1)
															 ->where('closed', 0)
															 ->get()
															 ->result_array()[0] : $this->db->select('*')
																							->from($this->table)
																							->where('id_to', $id)
																							->where('accepted', 1)
																							->where('closed', 0)
																							->get()
																							->result_array()[0];
	}

	public function is_ready($id_from, $id_to, $id) {
		if ($id == $id_from) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_from', $id_from)
							 ->where('id_to', $id_to)
							 ->where('ready_from', 1)
							 ->count_all_results();
			return $data > 0 ? true : false;
		}
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id_from)
						 ->where('id_to', $id_to)
						 ->where('ready_to', 1)
						 ->count_all_results();
		return $data > 0 ? true : false;
	}

	public function set_ready($id_from, $id_to, $id) {
		if ($id == $id_from) {
			$this->db->set('ready_from', 1)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id_to)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
		else {
			$this->db->set('ready_to', 1)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
	}

	public function enemy_has_played($id_from, $id_to, $id) {
		if ($id == $id_from) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_from', $id_from)
							 ->where('id_to', $id_to)
							 ->where('played_to', 1)
							 ->count_all_results();
			return $data > 0 ? true : false;
		}
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id_from)
						 ->where('id_to', $id_to)
						 ->where('played_from', 1)
						 ->count_all_results();
		return $data > 0 ? true : false;
	}

	public function set_played($id_from, $id_to, $id) {
		if ($id == $id_from) {
			$this->db->set('played_from', 1)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id_to)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
		else {
			$this->db->set('played_to', 1)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
	}

	public function set_refresh($id_from, $id_to, $id) {
		if ($id == $id_from) {
			$this->db->set('refresh_from', 1)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id_to)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
		else {
			$this->db->set('refresh_to', 1)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
	}

	public function completed($id_from, $id_to, $id) {
		if ($id_from == $id) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_from', $id_from)
							 ->where('id_to', $id_to)
							 ->where('ready_from', 1)
							 ->where('played_from', 1)
							 ->where('accepted', 1)
							 ->where('closed', 0)
							 ->count_all_results();
			return $data > 0 ? true : false;
		}
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id_from)
						 ->where('id_to', $id_to)
						 ->where('ready_to', 1)
						 ->where('played_to', 1)
						 ->where('accepted', 1)
						 ->where('closed', 0)
						 ->count_all_results();
		return $data > 0 ? true : false;
	}

	public function new_turn($id_from, $id_to, $id) {
		if ($id_from == $id) {
			$this->db->set('ready_from', 0)
					 ->set('played_from', 0)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id_to)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->where('ready_from', 1)
					 ->where('played_from', 1)
					 ->update($this->table);
		}
		else {
			$this->db->set('ready_to', 0)
					 ->set('played_to', 0)
					 ->where('id_from', $id_from)
					 ->where('id_to', $id_to)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->where('ready_to', 1)
					 ->where('played_to', 1)
					 ->update($this->table);
		}
	}





	public function get_turn($id) {
		$data = $this->db->select('turn')
						 ->from($this->table)
						 ->where('id_from', $id)
						 ->where('accepted', 1)
						 ->where('closed', 0)
						 ->count_all_results();
		if ($data > 0) {
			return $this->db->select('turn')
							->from($this->table)
							->where('id_from', $id)
							->where('accepted', 1)
							->where('closed', 0)
							->get()
							->result_array()[0]['turn'];
		}
		return $this->db->select('turn')
							->from($this->table)
							->where('id_to', $id)
							->where('accepted', 1)
							->where('closed', 0)
							->get()
							->result_array()[0]['turn'];
	}

	public function turn_over($id) {
		$count = $this->db->select('*')
						  ->from($this->table)
						  ->where('id_from', $id)
						  ->where('accepted', 1)
						  ->where('closed', 0)
						  ->count_all_results();

		if ($count > 0) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_from', $id)
							 ->where('accepted', 1)
							 ->where('closed', 0)
							 ->get()
							 ->result_array();

			$turn = $this->get_turn($id) == $data[0]['id_from'] ? $data[0]['id_to'] : $data[0]['id_from'];
			
			$this->db->set('turn', $turn)
					 ->set('refresh', 1)
					 ->where('id_from', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
		else {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_to', $id)
							 ->where('accepted', 1)
							 ->where('closed', 0)
							 ->get()
							 ->result_array();

			$turn = $this->get_turn($id) == $data[0]['id_from'] ? $data[0]['id_to'] : $data[0]['id_from'];
			
			$this->db->set('turn', $turn)
					 ->set('refresh', 1)
					 ->where('id_to', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);	
		}
	}

	public function update_refresh($id) {
		$count = $this->db->select('*')
						  ->from($this->table)
						  ->where('id_from', $id)
						  ->where('accepted', 1)
						  ->where('closed', 0)
						  ->where('refresh', 1)
						  ->count_all_results();

		if ($count > 0) {
			$this->db->set('refresh', 0)
					 ->where('id_from', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->where('turn', $id)
					 ->update($this->table);
		}
		else {
			$this->db->set('refresh', 0)
					 ->where('id_to', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->where('turn', $id)
					 ->update($this->table);	
		}
	}

	public function have_to_refresh($id) {
		$count = $this->db->select('*')
						  ->from($this->table)
						  ->where('id_from', $id)
						  ->where('accepted', 1)
						  ->where('closed', 0)
						  ->count_all_results();

		if ($count > 0) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_from', $id)
							 ->where('accepted', 1)
							 ->where('closed', 0)
							 ->where('refresh', 1)
							 ->count_all_results();

			return $data > 0 ? true : false;
		}

		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_to', $id)
						 ->where('accepted', 1)
						 ->where('closed', 0)
						 ->where('refresh', 1)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	

	public function enemy_ready($id) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id)
						 ->where('accepted', 1)
						 ->where('closed', 0)
						 ->count_all_results();

		if ($data > 0) {
			$count = $this->db->select('*')
							  ->from($this->table)
							  ->where('id_from', $id)
							  ->where('accepted', 1)
							  ->where('closed', 0)
							  ->where('ready_to', 1)
							  ->count_all_results();

			return $count > 0 ? true : false;
		}

		$count = $this->db->select('*')
						  ->from($this->table)
						  ->where('id_to', $id)
						  ->where('accepted', 1)
						  ->where('closed', 0)
						  ->where('ready_from', 1)
						  ->count_all_results();

		return $count > 0 ? true : false;
	}

	public function ready_off($id) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_from', $id)
						 ->where('accepted', 1)
						 ->where('closed', 0)
						 ->count_all_results();

		if ($data > 0) {
			$this->db->set('ready_to', 0)
					 ->where('id_from', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
		else {
			$this->db->set('ready_from', 0)
					 ->where('id_to', $id)
					 ->where('accepted', 1)
					 ->where('closed', 0)
					 ->update($this->table);
		}
	}
}
