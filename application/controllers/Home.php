<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Home extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('Home_model', 'home_modele');
	}

	public function index() {
		redirect('user/home/');
	}

	public function hunt() {
		$rand = ramdom_int(1, 9);
		$data['wild'] = $this->home_model->pickRandomWildPokemon($rand);
		$this->load->view('wildPokemonAppears', $data);
	}

}