<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Pokedex extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->library('form_validation');
		$this->load->model('Pokedex_model', 'pokedex_model');
		$this->load->model('User_model', 'user_model');
		if (!$this->user_model->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
				redirect('user/connection/');
		}
	}

	public function index() {
		redirect('pokedex/pokedex');
	}

	public function pokedex() {	// main function
		// control form
		$this->form_validation->set_rules('name', 'Pokemon', 'trim|required|alpha');

		if ($this->form_validation->run() && $this->pokedex_model->pokemon_exists($this->input->post('name'))) {
			$data = ['pokemon' => $this->pokedex_model->get_pokedex_pokemon($this->input->post('name')),
					 'caught' => $this->pokedex_model->get_pokedex_trainer($this->session->userdata('id'))];
			$this->load->view('Pokedex/pokemon', $data);
		}
		else {
			$data = ['pokemon' => $this->pokedex_model->get_pokedex(),
					 'caught' => $this->pokedex_model->get_pokedex_trainer($this->session->userdata('id'))];
			$this->load->view('Pokedex/pokedex', $data);
		}
	}

	public function autocomplete_pokedex() {	// ajax
		if (isset($_POST['like'])) {
			$_POST['like'] = htmlspecialchars($_POST['like']);
			$result = $this->pokedex_model->get_pokemon_like($_POST['like']);
			foreach ($result as $pokemon) 
				echo $pokemon['name'].'|';
		}
		else 
			show_404();
	}
}
