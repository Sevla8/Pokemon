<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Hunt extends CI_Controller {

	private $pokedex_length = 151;

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('layout');
		$this->load->library('session');
		$this->load->model('Trainer_model', 'trainer_model');
		$this->load->model('Pokedex_model', 'pokedex_model');
		$this->load->model('Pokemon_model', 'pokemon_model');
		if (!$this->session->has_userdata('id'))
			redirect('user/connection');
	}

	public function index() {
		$rand_id_pokedex = random_int(1, $this->pokedex_length);
		$rand_level = random_int(1, 30);
		$data = ['wild' => $this->pokedex_model->wild_pokemon_appears($rand_id_pokedex, $rand_level),
				 'team' => $this->pokemon_model->get_in_team($this->session->userdata('id'))];
		$trainer_data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];
		print_r($data);

		$this->layout->add('header', $trainer_data)
						 ->add('Hunt/wild_pokemon_appears', $data)
						 ->add('footer')
						 ->view();
	}

	public function pokedex($id) {
		
	}

	public function pokeball($d, $prct_hp) {

	}

	public function run() {
		
	}
}
