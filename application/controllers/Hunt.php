<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Hunt extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Hunt_model', 'hunt_model');
		$this->load->model('User_model', 'user_model');
		if (!$this->user_model->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
				redirect('user/connection/');
		}
	}

	public function index() {
		$this->hunt();
	}

	public function hunt() {
		$rand_id_pokedex = random_int(1, 9);
		$rand_level = random_int(1, 30);
		echo "string";
		$data = $this->hunt_model->wild_pokemon_appears($rand_id_pokedex, $rand_level);
		print_r($data);
		$this->output->enable_profiler(true);
		$this->load->view('Hunt/wild_pokemon_appears', $data);
	}

	public function pokedex($id) {
		$data = $this->hunt_model->get_pokedex($id);
		$this->load->view('Hunt/pokedex', $data);
	}

	public function pokeball($d, $prct_hp) {

	}
}
