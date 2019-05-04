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
		$this->load->model('Pokemon_Capacity_model', 'pokemon_capacity_model');
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

		$team = $this->pokemon_model->get_in_team($this->session->userdata('id'));

		$i;
		for ($i = 0; $i < 6; $i += 1) {
			if (isset($team[$i]) && $team[$i]['%_hp'] > 0) {
				$this->session->set_userdata('in_fight', $i);
				break;
			}
		}
		if ($i == 6)
			redirect('team/team/');
		
		$rand_level = random_int($team[$this->session->userdata('in_fight')]['level'] - 10, $team[$this->session->userdata('in_fight')]['level'] + 10);
		if ($rand_level < 0)
			$rand_level = 0;

		$this->session->set_userdata('wild', $this->pokedex_model->wild_pokemon_appears($rand_id_pokedex, $rand_level, 100));

		redirect('hunt/hunt');

	}

	public function hunt() {
		$data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id')),
				 'team' => $this->pokemon_model->get_in_team($this->session->userdata('id')),
				 'wild' => $this->session->userdata('wild'),
				 'in_fight' => $this->session->userdata('in_fight')];

		$this->layout->view('header', $data)
					 ->link_css('header')
					 ->view('Hunt/wild_pokemon_appears')
					 ->view('footer')
					 ->link_css('footer')
					 ->set_title('Hunt')
					 ->print();
	}

	public function pokedex() {
		$data = ['pokemon' => $this->pokedex_model->get_pokemon_by_name($this->session->userdata('wild')['name']),
				 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];

		$this->layout->view('header', $data)
					 ->link_css('header')
					 ->view('Hunt/pokedex')
					 ->view('footer')
					 ->link_css('footer')
					 ->set_title('Hunt-Pokedex')
					 ->print();
	}

	public function pokeball() {
		if ($this->session->userdata('wild')['%_hp'] <= 10) {
			$luck = random_int(0, 1);
			if ($luck == 1) {
				$this->pokemon_model->set_pokemon($this->session->userdata('wild')['level'],
												  0,
												  $this->session->userdata('wild')['%_hp'],
												  $this->session->userdata('id'),
												  $this->pokedex_model->get_pokemon_by_name($this->session->userdata('wild')['name'])['id'],
												  0);

				$caught = $this->pokemon_model->get_last_caught($this->session->userdata('id'));
				foreach ($this->session->userdata('wild')['capacity'] as $key => $capa) {
					$this->pokemon_capacity_model->set_capacity($caught['id'], $capa['id'], $capa['pp']);
				}

				redirect('team/pc/');
			}
		}
		$this->trainer_model->pokeball($this->session->userdata('id'), -1);

		redirect('hunt/hunt');
	}

	public function potion() {
		if ($this->pokemon_model->pokemon_exists($this->pokemon_model->get_in_team($this->session->userdata('id'))[$this->session->userdata('in_fight')]['id'])) {
			if (!$this->pokemon_model->full_hp($this->pokemon_model->get_in_team($this->session->userdata('id'))[$this->session->userdata('in_fight')]['id'])) {
				$this->pokemon_model->potion($this->pokemon_model->get_in_team($this->session->userdata('id'))[$this->session->userdata('in_fight')]['id']);
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

			$team = $this->pokemon_model->get_in_team($this->session->userdata('id'));
			if (isset($team[$this->session->userdata('in_fight')]['capacity'][$id_capa]) && $team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['nb_pp'] > 0) {

				$this->pokemon_capacity_model->update_capacity($team[$this->session->userdata('in_fight')]['id'],
															   $team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['id'],
					$this->pokemon_capacity_model->get_pp($team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['id'],
													$team[$this->session->userdata('in_fight')]['id']) - 1);

				if (isset($team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['puis'])) {
					$damage = $this->get_damage($team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['puis'],
												$team[$this->session->userdata('in_fight')]['level'],
											    $this->session->userdata('wild')['defense'],
											    $this->session->userdata('wild')['level']);

					$wild = $this->session->userdata('wild');
					$wild['%_hp'] = $wild['%_hp'] - $damage;
					$this->session->set_userdata('wild', $wild);

					if ($wild['%_hp'] <= 0)
						redirect('hunt/');

					$this->robot();
				}
				$this->robot();
			}
			else 
				redirect('hunt/hunt');
		}
	}

	private function robot() {
		$rand = random_int(0, 3);
		while (!isset($this->session->userdata('wild')['capacity'][$rand])) {
			$rand = random_int(0, 3);
		}
		$capa = $this->session->userdata('wild')['capacity'][$rand];
		if (isset($this->session->userdata('wild')['capacity'][$rand]['puis'])) {

			 if ($this->pokemon_model->pokemon_exists($this->pokemon_model->get_in_team($this->session->userdata('id'))[$this->session->userdata('in_fight')]['id'])) {

			 	$poke = $this->pokemon_model->get_in_team($this->session->userdata('id'))[$this->session->userdata('in_fight')];

				$damage = $this->get_damage($this->session->userdata('wild')['capacity'][$rand]['puis'],
											$this->session->userdata('wild')['level'],
											$poke['defense'],
											$poke['level']);
				
				$hp = $poke['%_hp'] - $damage;
				if ($hp < 0)
					$hp = 0;

				$this->pokemon_model->update_pokemon($poke['id'],
													 $poke['level'],
													 $poke['xp'],
													 $hp,
													 $poke['id_trainer'],
													 $poke['id_pokedex'],
													 $poke['in_team']);

				if ($hp == 0) {
					redirect('user/home/');
				}

			}

			redirect('hunt/hunt');
		}
		redirect('hunt/hunt');
	}

	private function get_damage($puis_att, $level_att, $def_def, $level_def) {
		return $puis_att * ($level_att+1) / $def_def / ($level_def+1) * 10;
	}
}
