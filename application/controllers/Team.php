<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Team extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->library('layout');
		$this->load->model('Trainer_model', 'trainer_model');
		$this->load->model('Pokemon_model', 'pokemon_model');
		$this->load->model('Capacity_model', 'capacity_model');
		if (!$this->session->has_userdata('id'))
			redirect('user/connection');
	}

	public function index() {
		$data = ['pseudo' => $this->session->userdata('pseudo')];
		$trainer_data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];
		$this->layout->add('header', $trainer_data)
					 ->add('Team/team_pc', $data)
					 ->add('footer')
					 ->view();
	}

	public function team() {
		$data = ['pokemon' => $this->pokemon_model->get_in_team($this->session->userdata('id'))];
		$trainer_data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];
		$this->layout->add('header', $trainer_data)
					 ->add('Team/team', $data)
					 ->add('footer')
					 ->view();
	}

	public function pc() {
		$data = ['pokemon_pc' => $this->pokemon_model->get_pc($this->session->userdata('id')),
				 'pokemon_team' => $this->pokemon_model->get_in_team($this->session->userdata('id'))];
		$trainer_data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];
		$this->layout->add('header', $trainer_data)
					 ->add('Team/pc', $data)
					 ->add('footer')
					 ->view();
	}

	public function load($id) {
		if ($this->pokemon_model->pokemon_exists($id)) {
			if (!$this->pokemon_model->full_team($this->session->userdata('id'))) {
				$this->pokemon_model->load($id, $this->session->userdata('id'));
				redirect('team/pc');
			}
			else {
				$this->load->view('Team/full_team');
				$this->pc();
			}
		}
		else
			redirect('team/pc');
	}

	public function store($id) {
		if ($this->pokemon_model->pokemon_exists($id)) {
			$this->pokemon_model->store($id);
			redirect('team/pc');
		}
		else
			redirect('team/pc');
	}

	public function potion($id) {
		if ($this->pokemon_model->pokemon_exists($id)) {
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
		else 
			redirect('team/team');
	}

	public function move_up($id) {
		if ($this->pokemon_model->pokemon_exists($id)) {
			if ($this->pokemon_model->correct_move($id, $this->session->userdata('id'), 'up')) {
				$this->pokemon_model->move_up($id, $this->session->userdata('id'));
				redirect('team/team');
			}
			else 
				show_404();
		}
		else 
			redirect('team/team');
	}

	public function move_down($id) {
		if ($this->pokemon_model->pokemon_exists($id)) {
			if ($this->pokemon_model->correct_move($id, $this->session->userdata('id'), 'down')) {
				$this->pokemon_model->move_down($id, $this->session->userdata('id'));
				redirect('team/team');
			}
			else 
				show_404();
		}
		else 
			redirect('team/team');
	}
}
