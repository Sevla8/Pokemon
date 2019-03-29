<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Team extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->library('session');
		$this->load->model('Team_model', 'team_model');
	}

	public function index() {
		$this->pc();
	}

	public function pc() {
		$data = $this->team_model->get_pokemon($this->session->userdata('id'));
		echo "string";
	}
}