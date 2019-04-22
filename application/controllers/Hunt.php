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
		$pokemon = $this->pokedex_model->get_pokedex($this->pokedex_length, 0);
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
		$rand = random_int(0, $i-1);
		$rand_id_pokedex = $array[$rand];
		$rand_level = random_int(1, 70);

		$this->session->set_userdata('wild', $this->pokedex_model->wild_pokemon_appears($rand_id_pokedex, $rand_level, 100));
		$this->session->set_userdata('team', $this->pokemon_model->get_in_team($this->session->userdata('id')));
		$this->session->set_userdata('trainer', $this->trainer_model->get_trainer($this->session->userdata('id')));
		for ($i = 0; $i < 6; $i += 1) {
			if (isset($this->session->userdata('team')[$i])) {
				$this->session->set_userdata('in_fight', $i);
				break;
			}
		}

		redirect('hunt/hunt');
	}

	public function hunt() {
		$this->session->set_userdata('trainer', $this->trainer_model->get_trainer($this->session->userdata('id')));
		$this->session->set_userdata('team', $this->pokemon_model->get_in_team($this->session->userdata('id')));

		$data = ['trainer' => $this->session->userdata('trainer'),
				 'team' => $this->session->userdata('team'),
				 'wild' => $this->session->userdata('wild'),
				 'in_fight' => $this->session->userdata('in_fight')];

		$this->layout->view('header', $data)
					 ->link_css('header')
					 ->view('Hunt/wild_pokemon_appears')
					 ->view('footer')
					 ->link_css('footer')
					 ->set_title('Hunt')
					 ->print();

		$this->output->enable_profiler(true);
	}

	public function pokedex() {
		$data = ['pokemon' => $this->pokedex_model->get_pokemon_by_name($this->session->userdata('wild')['name']),
				 'trainer' => $this->session->userdata('trainer')];

		$this->layout->view('header', $data)
					 ->link_css('header')
					 ->view('Hunt/pokedex')
					 ->view('footer')
					 ->link_css('footer')
					 ->set_title('Hunt-Pokedex')
					 ->print();
	}

	public function pokeball() {
		if ($this->session->userdata('wild')['%_hp'] < 10) {
			$luck = randam_int(0, 1);
			if ($luck == 1) {
				$this->pokemon_model->set_pokemon($this->session->userdata('wild')['level'],
												  0,
												  $this->session->userdata('wild')['%_hp'],
												  $$this->session->userdata('trainer')['%id'],
												  $this->pokedex_model->get_pokemon_by_name($this->session->userdata('wild')['name']),
												  0);

				$data = $this->get_trainer($this->session->userdata('trainer')['id']);
				$data['pokeball'] -= 1;
				$this->trainer_model->update_trainer($data);

				redirect('hunt/hunt');
			}
			else 
				redirect('hunt/hunt');
		}
		else 
			redirect('hunt/hunt');
	}

	public function potion() {
		if ($this->pokemon_model->pokemon_exists($this->session->userdata('team')[$this->session->userdata('in_fight')]['id'])) {
			if (!$this->pokemon_model->full_hp($this->session->userdata('team')[$this->session->userdata('in_fight')]['id'])) {
				$this->pokemon_model->potion($this->session->userdata('team')[$this->session->userdata('in_fight')]['id']);
				$this->trainer_model->potion($this->session->userdata('id'), -1);

				redirect('hunt/hunt');
			}
			else 
				redirect('hunt/hunt');
		}
		else 
			redirect('hunt/hunt');
	}

	public function attack($id_capa) {
		if ($id_capa < 0 || $id_capa > 3)
			show_404();
		else {
			if (isset($this->session->userdata('team')[0]['capacity'][$id_capa]) && $this->session->userdata('team')[0]['capacity'][$id_capa]['nb_pp'] > 0) {
				echo $this->session->userdata('team')[0]['capacity'][$id_capa]['nb_pp'];
			}
			else {
				redirect('hunt/hunt');
			}
		}
	}
}
