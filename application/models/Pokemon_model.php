<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokemon_Model extends CI_Model {

	private $table = 'pokemon';

	public function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->model('Pokedex_model', 'pokedex_model');
		$this->load->model('Capacity_model', 'capacity_model');
		$this->load->model('Pokemon_Capacity_model', 'pokemon_capacity_model');
	}

	public function get_pokemon($id_trainer) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_trainer', $id_trainer)
						->get()
						->result_array();
	}

	public function get_last_caught($id_trainer) {
		return $this->db->select('*')
						->from($this->table)
						->where('id_trainer', $id_trainer)
						->order_by('id', 'DESC')
						->get()
						->result_array()[0];
	}

	public function set_pokemon($level, $xp, $prct_hp, $id_trainer, $id_pokedex, $in_team) {
		$this->db->set('level', $level)
				 ->set('xp', $xp)
				 ->set('%_hp', $prct_hp)
				 ->set('id_trainer', $id_trainer)
				 ->set('id_pokedex', $id_pokedex)
				 ->set('in_team', $in_team)
				 ->insert($this->table);
	}

	public function update_pokemon($id, $level, $xp, $prct_hp, $id_trainer, $id_pokedex, $in_team) {
		$this->db->set('level', $level)
				 ->set('xp', $xp)
				 ->set('%_hp', $prct_hp)
				 ->set('id_trainer', $id_trainer)
				 ->set('id_pokedex', $id_pokedex)
				 ->set('in_team', $in_team)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function get_starter($id_trainer) {
		return $this->db->select('id')
						->from($this->table)
						->where('id_trainer', $id_trainer)
						->get()
						->result_array()[0]['id'];
	}

	public function caught($id_pokedex, $id_trainer) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_pokedex', $id_pokedex)
						 ->where('id_trainer', $id_trainer)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function get_in_team($id_trainer) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_trainer', $id_trainer)
						 ->where('in_team <>', 0)
						 ->limit(6, 0)
						 ->order_by('in_team', 'ASC')
						 ->get()
						 ->result_array();

		for ($i = 0; $i < sizeof($data); $i += 1) {

			$temp = $this->pokedex_model->get_pokemon_by_id($data[$i]['id_pokedex']);
			$id_tmp = $data[$i]['id'];
			foreach ($temp as $key => $value) {
				$data[$i][''.$key] = $value;
			}
			$data[$i]['id'] = $id_tmp;	// 'id' de pokedex ecrase 'id' de pokemon

			$capacities = $this->pokemon_capacity_model->get_capacity($data[$i]['id']);
			for ($j = 0; $j < sizeof($capacities); $j += 1) {
				foreach ($capacities[$j] as $key => $value) {
					$data[$i]['capacity'][$j] = $this->capacity_model->get_capacity($capacities[$j]['id_capacity']);
					$data[$i]['capacity'][$j]['nb_pp'] = $this->pokemon_capacity_model->get_pp($capacities[$j]['id_capacity'], $data[$i]['id']);
				}
			}
		}

		return $data;
	}

	public function get_pc($id_trainer) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_trainer', $id_trainer)
						 ->where('in_team', 0)
						 ->order_by('id_pokedex', 'ASC')
						 ->get()
						 ->result_array();

		for ($i = 0; $i < sizeof($data); $i += 1) {

			$temp = $this->pokedex_model->get_pokemon_by_id($data[$i]['id_pokedex']);
			$id_tmp = $data[$i]['id'];
			foreach ($temp as $key => $value) {
				$data[$i][''.$key] = $value;
			}
			$data[$i]['id'] = $id_tmp;	// 'id' de pokedex ecrase 'id' de pokemon
		}

		return $data;
	}

	public function full_hp($id) {
		$hp = $this->db->select('%_hp')
					   ->from($this->table)
					   ->where('id', $id)
					   ->get()
					   ->result_array()[0]['%_hp'];

		if ($hp == 100)
			return true;
		return false;
	}

	public function potion($id) {
		$this->db->set('%_hp', 100)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function move_up($id, $id_trainer) {
		$position = $this->db->select('in_team')
							 ->from($this->table)
							 ->where('id', $id)
							 ->where('id_trainer', $id_trainer)
							 ->get()
							 ->result_array()[0]['in_team'];

		$id_position_minus_1 = $this->db->select('id')
										->from($this->table)
										->where('id_trainer', $id_trainer)
										->where('in_team', $position - 1)
										->get()
										->result_array()[0]['id'];

		$this->db->set('in_team', $position - 1)
				 ->where('id', $id)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->table);

		$this->db->set('in_team', $position)
				 ->where('id', $id_position_minus_1)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->table);		
	}

	public function move_down($id, $id_trainer) {
		$position = $this->db->select('in_team')
							 ->from($this->table)
							 ->where('id', $id)
							 ->where('id_trainer', $id_trainer)
							 ->get()
							 ->result_array()[0]['in_team'];

		$id_position_plus_1 = $this->db->select('id')
										->from($this->table)
										->where('id_trainer', $id_trainer)
										->where('in_team', $position + 1)
										->get()
										->result_array()[0]['id'];

		$this->db->set('in_team', $position + 1)
				 ->where('id', $id)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->table);

		$this->db->set('in_team', $position)
				 ->where('id', $id_position_plus_1)
				 ->where('id_trainer', $id_trainer)
				 ->update($this->table);		
	}

	public function correct_move($id, $id_trainer, $where) {
		$data = $this->db->select('in_team')
						 ->from($this->table)
						 ->where('id', $id)
						 ->where('id_trainer', $id_trainer)
						 ->get()
						 ->result_array()[0]['in_team'];

		if ($data == 1 && $where == 'up')
			return false;
		if ($data == 6 && $where == 'down')
			return false;
		if ($data < 1 || $data > 6)
			return false;
		return true;
	}

	public function pokemon_exists($id) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id', $id)
						 ->count_all_results();

		return $data > 0 ? true : false;
	}

	public function store($id) {
		$this->db->set('in_team', 0)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function load($id, $id_trainer) {
		for ($i = 1; $i <= 6; $i += 1) {
			$data = $this->db->select('*')
							 ->from($this->table)
							 ->where('id_trainer', $id_trainer)
							 ->where('in_team', $i)
							 ->count_all_results();
			if ($data == 0) {
				$this->db->set('in_team', $i)
						 ->where('id', $id)
						 ->update($this->table);
				break;
			}
		}
	}

	public function full_team($id_trainer) {
		$data = $this->db->select('*')
						 ->from($this->table)
						 ->where('id_trainer', $id_trainer)
						 ->where('in_team <>', 0)
						 ->count_all_results();

		return $data == 6 ? true : false;
	}

	public function new_day($id) {
		$this->db->set('%_hp', 100)
				 ->where('id_trainer', $id)
				 ->update($this->table);
	}

	public function get_xp($id) {
		return $this->db->select('xp')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0]['xp'];
	}

	public function xp_up($id, $xp) {
		$this->db->set('xp', $this->get_xp($id) + $xp)
				 ->where('id', $id)
				 ->update($this->table);
	}

	public function get_level($id) {
		return $this->db->select('level')
						->from($this->table)
						->where('id', $id)
						->get()
						->result_array()[0]['level'];
	}

	public function level_up($id, $level) {
		$this->db->set('level', $this->get_level($id) + $level)
				 ->set('xp', 0)
				 ->where('id', $id)
				 ->update($this->table);
	}
}