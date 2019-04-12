<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Team extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Trainer_model', 'trainer_model');
		$this->load->model('Pokemon_model', 'pokemon_model');
		$this->load->model('Capacity_model', 'capacity_model');
	}

	public function index() {
		$data = ['pseudo' => $this->session->userdata('pseudo')];
		$this->load->view('Team/team_pc', $data);
	}

	public function team() {
		$data = ['pokemon' => $this->pokemon_model->get_in_team($this->session->userdata('id'))];
		$this->load->view('Team/team', $data);
		$this->output->enable_profiler(true);
	}

	public function pc() {
		$data = ['pokemon' => $this->pokemon_model->get_pc($this->session->userdata('id'))];
		$this->load->view('Team/pc', $data);
		$this->output->enable_profiler(true);
	}

	public function potion($id) {
		if (!$this->pokemon_model->full_hp($id)) {
			$this->pokemon_model->potion($id);
			$this->trainer_model->potion($this->session->userdata('id'), -1);
			redirect('team/team');
		}
		else {
			$this->load->view('Team/pokemon_full_hp');
			$this->team();
		}
	}

	public function move_up($id) {
		if ($this->pokemon_model->correct_move($id, $this->session->userdata('id'), 'up')) {
			$this->pokemon_model->move_up($id, $this->session->userdata('id'));
			redirect('team/team');
		}
		else 
			show_404();
	}

	public function move_down($id) {
		if ($this->pokemon_model->correct_move($id, $this->session->userdata('id'), 'down')) {
			$this->pokemon_model->move_down($id, $this->session->userdata('id'));
			redirect('team/team');
		}
		else 
			show_404();
	}
}
