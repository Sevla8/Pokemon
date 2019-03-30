<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Pokedex extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Pokedex_model', 'pokedex_model');
		$this->load->model('User_model', 'user_model');
		if (!$this->user_model->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
				redirect('user/connection/');
		}
	}

	public function index() {
		$data = $this->pokedex_model->get_pokedex();
		for ($i = 0; $i < sizeof($data); $i += 1) {
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
		$this->load->view('Pokedex/pokedex', $dataX);
	}

}
