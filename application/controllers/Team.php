<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Team extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Team_model', 'team_model');
		$this->load->model('Capacity_model', 'capacity_model');
	}

	public function index() {
		$data = ['pseudo' => $this->session->userdata('pseudo')];
		$this->load->view('Team/team_pc', $data);
	}

	public function team() {
		// $data = ['pokemon' => $this->team_model->get_team($this->session->userdata('id'))];
		// $this->load->view('Team/team', $data);
		$data = ['capacity' => $this->capacity_model->get_capacity(5)];
		$this->load->view('Team/team', $data);
		$this->output->enable_profiler(true);
	}

	public function pc() {
		$data = ['pokemon' => $this->team_model->get_pc($this->session->userdata('id'))];
		$this->load->view('Team/pc', $data);
		$this->output->enable_profiler(true);
	}

	public function potion($id) {
		if (!$this->team_model->full_hp($id)) {
			$this->team_model->potion($id, $this->session->userdata('id'));
			redirect('team/team');
		}
		else {
			$this->load->view('Team/pokemon_full_hp');
			$this->team();
		}
	}

	public function move_up($id) {
		$this->team_model->move_up($id, $this->session->userdata('id'));
		redirect('team/team');
	}

	public function move_down($id) {
		$this->team_model->move_down($id, $this->session->userdata('id'));
		redirect('team/team');
	}
}
