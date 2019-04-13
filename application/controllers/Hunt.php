<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Hunt extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Pokedex_model', 'pokedex_model');
		// control
	}

	public function index() {
		$this->hunt();
	}

	public function hunt() {
		$rand_id_pokedex = random_int(1, 9);
		$rand_level = random_int(1, 30);
		echo "string";
		$data = $this->pokedex_model->wild_pokemon_appears($rand_id_pokedex, $rand_level);
		print_r($data);
		$this->load->view('Hunt/wild_pokemon_appears', $data);
		$this->output->enable_profiler(true);
	}

	public function pokedex($id) {
		
	}

	public function pokeball($d, $prct_hp) {

	}

	public function run() {
		
	}
}
