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
	}

	public function index() {
		redirect('team/team/');
	}

	public function team() {

	}

	public function pc() {
		$data = ['pokemon' => $this->team_model->get_pc($this->session->userdata('id'))];
		$this->load->view('Team/pc', $data);
		$this->output->enable_profiler(true);
	}
}
