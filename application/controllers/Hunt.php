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
		$pokemon = $this->pokedex_model->get_pokedex(151, 0);
		$i = 0;
		foreach ($pokemon as $key => $poke) {
			switch ($poke['rarity']) {
				case 1:
					for ($j = 0; $j < 10000; $j += 1) {
						$array[$i] = $poke['id'];
						$i += 1;
					}
					break;
				case 2:
					for ($j = 0; $j < 1000; $j += 1) {
						$array[$i] = $poke['id'];
						$i += 1;
					}
					break;
				case 3:
					for ($j = 0; $j < 100; $j += 1) {
						$array[$i] = $poke['id'];
						$i += 1;
					}
					break;
				case 4:
					for ($j = 0; $j < 10; $j += 1) {
						$array[$i] = $poke['id'];
						$i += 1;
					}
					break;
					case 5:
						for ($j = 0; $j < 1; $j += 1) {
						$array[$i] = $poke['id'];
						$i += 1;
					}
						break;
				default:
					break;
			}
		}
		shuffle($array);
		$rand_id_pokedex = $array[0];
		$rand_level = random_int(1, 30);
		$data = ['wild' => $this->pokedex_model->wild_pokemon_appears($rand_id_pokedex, $rand_level, 100),
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
