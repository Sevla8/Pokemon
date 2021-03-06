<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Pokedex extends CI_Controller {

	private $per_page = 9;

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('layout');
		$this->load->library('session');
		$this->load->library('pagination');
		$this->load->library('form_validation');
		$this->load->model('Pokedex_model', 'pokedex_model');
		$this->load->model('Trainer_model', 'trainer_model');
		if (!$this->session->has_userdata('id'))
			redirect('user/connection');
	}

	public function index($start_index = 0) {	// main function
		// control form
		$this->form_validation->set_rules('name', 'Pokemon', 'trim|required|alpha');

		if ($this->form_validation->run() && $this->pokedex_model->pokemon_exists($this->input->post('name'))) {

			$data = ['pokemon' => $this->pokedex_model->get_pokemon_by_name($this->input->post('name')),
					 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];

			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('Pokedex/pokemon')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title($this->input->post('name'))
						 ->print();
		}
		else {

			$start_index = intval($start_index);

			if ($start_index < 0 || $start_index >= $this->pokedex_model->count_pokedex())
				redirect('pokedex/');

			$config['base_url'] = site_url('pokedex/index/');
			$config['total_rows'] = $this->pokedex_model->count_pokedex();
			$config['per_page'] = $this->per_page;

			$this->pagination->initialize($config);

			$data = ['pagination' => $this->pagination->create_links(),
					 'pokemon' => $this->pokedex_model->get_pokedex($this->per_page, $start_index),
					 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];

			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('Pokedex/pokedex')
						 ->link_js('pokedex')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title('Pokedex')
						 ->print();
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
