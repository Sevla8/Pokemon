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
		$array = array();
		$pokemon = $this->pokedex_model->get_power();
		$i = 0;
		foreach ($pokemon as $key => $poke) {
			for ($j = 0; $j < 700-$poke['power']; $j += 1) {
				$array[$i] = $poke['id'];
				$i += 1;
			}
		}
		shuffle($array);
		$rand_id_pokedex = $array[0];
		$rand_level = random_int(1, 30);
		$data = ['wild' => $this->pokedex_model->wild_pokemon_appears($rand_id_pokedex, $rand_level),
				 'team' => $this->pokemon_model->get_in_team($this->session->userdata('id')),
				 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];

		$this->layout->view('header', $data)
					 ->link_css('header')
					 ->view('Hunt/wild_pokemon_appears')
					 ->view('footer')
					 ->link_css('footer')
					 ->set_title('Hunt')
					 ->print();
	}

	public function pokedex($id) {
		
	}

	public function pokeball($d, $prct_hp) {

	}

	public function run() {
		
	}
}
