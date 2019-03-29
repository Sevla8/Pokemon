<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Hunt extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->library('session');
		$this->load->model('Hunt_model', 'hunt_model');
		$this->load->model('User_model', 'user_model');
	}

	public function index() {
		if ($this->user_model->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
				echo "string";
		}
		else {
			show_404();
		}
	}

	public function hunt() {
		$rand_id_pokedex = random_int(1, 9);
		$rand_level = random_int(1, 30);
		// $data = $this->hunt_model->get_wild_pokemon($rand_id_pokedex, $rand_level);
		// $this->load->view('wildPokemonAppears', $data);
		// $this->hunt->model->
	}
}