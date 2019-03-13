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
		if ($this->home->model->sizeTeam() < 6) {
			$randId_pokedex = ramdom_int(1, 9);
			$randLevel = ramdom_int(1, 30);
			$randXp = 0;
			$id_trainer = $this->home_model->selectTrainer(); ///!!!
			$data['wild'] = $this->home_model->pickRandomWildPokemon($randId_pokedex, $randLevel, $randXp, $id_trainer);
			$this->load->view('wildPokemonAppears', $data);
		}
		else {
			$this->load->view('teamAlreadyFull');
		}
	}
}