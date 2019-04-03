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
		echo $data['id'];
		print_r("data is :");
		($data);
		$this->output->enable_profiler(true);
		/*for ($i = 0; $i < sizeof($data); $i += 1) {
			$dataX['id'][$i] = $data[$i]['id'];
			$dataX['name'][$i] = $data[$i]['name'];
			$dataX['hp'][$i] = $data[$i]['hp'];
			$dataX['attack'][$i] = $data[$i]['attack'];
			$dataX['defense'][$i] = $data[$i]['defense'];
			$dataX['sp_attack'][$i] = $data[$i]['sp_attack'];
			$dataX['sp_defense'][$i] = $data[$i]['sp_defense'];
			$dataX['speed'][$i] = $data[$i]['speed'];
			$dataX['description'][$i] = $data[$i]['description'];
		}
		$this->load->view('Team/team', $dataX);*/
	}
}
