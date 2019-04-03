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
		$data = ["pokemons" => $this->pokedex_model->get_pokedex(),
					"title" => "Votre liste de pokemon"];
	
		$this->load->view('Pokedex/pokedex', $data);
	}

	public function ajax() {
		if (isset($_POST['like'])) {
			$_POST['like'] = htmlspecialchars($_POST['like']);
			$result = $this->pokedex_model->get_pokemon_like($_POST['like']);
			foreach ($result as $pokemon) 
				echo $pokemon['name'].'|';
		}
	}

	public function get_pokedex_pokemon() {
		if (isset($_POST['name']) && isset($_POST['submit'])) {
			$_POST['name'] = htmlspecialchars($_POST['name']);
			$data = ['pokemon' => $this->pokedex_model->get_pokedex_pokemon($_POST['name'])];
			$this->load->view('Pokedex/pokemon', $data);
		}
	}

}
