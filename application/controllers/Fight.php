<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Fight extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->library('layout');
		$this->load->model('Member_model', 'member_model');
		$this->load->model('Trainer_model', 'trainer_model');
		$this->load->model('Challenge_model', 'challenge_model');
		$this->load->model('Pokemon_model', 'pokemon_model');
		if (!$this->session->has_userdata('id'))
			redirect('user/connection');
	}

	public function index() {
		if (!$this->challenge_model->exists_fight($this->session->userdata('id')))
			redirect('fight/challenge/');
		else
			redirect('fight/fight/');
	}

	public function fight() {
		if (!$this->challenge_model->exists_fight($this->session->userdata('id')))
			redirect('fight/challenge/');
		else {
			$chall = $this->challenge_model->get_current_fight($this->session->userdata('id'));
			$enemy = $this->session->userdata('id') == $chall['id_from'] ? $chall['id_to'] : $chall['id_from'];

			$this->session->set_userdata('id_from', $chall['id_from']);
			$this->session->set_userdata('id_to', $chall['id_to']);

			$data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id')),
					 'enemy_trainer' => $this->trainer_model->get_trainer($enemy),
					 'team' => $this->pokemon_model->get_in_team($this->session->userdata('id')),
					 'enemy_team' => $this->pokemon_model->get_in_team($enemy)];

			$i;
			for ($i = 0; $i < 6; $i += 1) {
				if (isset($data['team'][$i]) && $data['team'][$i]['%_hp'] > 0) {
					$data['in_fight'] = $i;
					break;
				}
			}
			if ($i == 6)
				redirect('fight/lose');

			for ($i = 0; $i < 6; $i += 1) {
				if (isset($data['enemy_team'][$i]) && $data['enemy_team'][$i]['%_hp'] > 0) {
					$data['enemy_in_fight'] = $i;
					break;
				}
			}
			if ($i == 6)
				redirect('fight/win');

			$this->session->set_userdata('in_fight', $data['in_fight']);
			$this->session->set_userdata('enemy_in_fight', $data['enemy_in_fight']);

			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('Fight/fight')
						 ->link_js('ready')
						 ->link_js('refresh')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title('Fight')
						 ->print();

			$this->output->enable_profiler(true); 
		}
	}

	public function team() {
		if (!$this->challenge_model->exists_fight($this->session->userdata('id')))
			redirect('fight/challenge/');
		if ($this->challenge_model->is_ready($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id')))
			redirect('fight/fight/');
		
		$data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id')),
				 'pokemon' => $this->pokemon_model->get_in_team($this->session->userdata('id'))];

		$this->layout->view('header', $data)
					 ->link_css('header')
					 ->view('Fight/team')
					 ->view('footer')
					 ->link_css('footer')
					 ->set_title('Fight-Team')
					 ->print();
	}

	public function move_up($id) {
		if ($this->pokemon_model->pokemon_exists($id)) {
			if ($this->pokemon_model->correct_move($id, $this->session->userdata('id'), 'up')) {
				$this->pokemon_model->move_up($id, $this->session->userdata('id'));
				redirect('fight/team');
			}
			else 
				show_404();
		}
		else 
			redirect('fight/team');
	}

	public function move_down($id) {
		if ($this->pokemon_model->pokemon_exists($id)) {
			if ($this->pokemon_model->correct_move($id, $this->session->userdata('id'), 'down')) {
				$this->pokemon_model->move_down($id, $this->session->userdata('id'));
				redirect('fight/team');
			}
			else 
				show_404();
		}
		else 
			redirect('fight/team');
	}

	public function challenge() {
		if ($this->challenge_model->exists_fight($this->session->userdata('id')))
			redirect('fight/');
		else {
			$data = ['online' =>  $this->member_model->get_online(), 
					 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];
			if ($this->challenge_model->exists_challenge($this->session->userdata('id')))
				$data['challenge_from'] = $this->challenge_model->get_all_challenge($this->session->userdata('id'));
			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('Fight/challenges')
						 ->link_js('time_to_fight')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title('Challenge')
						 ->print();
		}
	}

	public function send_challenge($id_to) {
		// control on $id_to !!!
		if (!$this->challenge_model->challenge_already_send($this->session->userdata('id'), $id_to))
			$this->challenge_model->set_challenge($this->session->userdata('id'), $id_to);
		redirect('fight/');
	}

	public function accept_challenge($id_from) {
		$this->challenge_model->accept_challenge($id_from, $this->session->userdata('id'));
		redirect('fight/');
	}

	public function exists_new_challenge() {	// ajax
		if ($this->challenge_model->exists_new_challenge($this->session->userdata('id'))) {
			$id_from = $this->challenge_model->get_new_challenge($this->session->userdata('id'));
			$this->challenge_model->set_checked($id_from, $this->session->userdata('id'));
			echo $this->trainer_model->get_trainer($id_from)['name'];
		}
	}

	public function time_to_fight() {	// ajax
		if ($this->challenge_model->exists_fight($this->session->userdata('id')))
			echo 'do_it';
	}
	
	public function pokedex($name) {
		if (!$this->pokedex_model->pokemon_exists($name))
			show_404();
		else {
			$data = ['pokemon' => $this->pokedex_model->get_pokemon_by_name($name),
					 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];

			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('Fight/pokedex')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title('Fight-Pokedex')
						 ->print();
		}
	}

	public function potion($id) {
		if ($this->session->userdata('id') == $this->challenge_model->get_turn($this->session->userdata('id'))) {
			if ($this->pokemon_model->pokemon_exists($id)) {
				if (!$this->pokemon_model->full_hp($id)) {
					$this->pokemon_model->potion($id);
					$this->trainer_model->potion($this->session->userdata('id'), -1);
					
					$this->turn_over();
					redirect('fight/fight');
				}
				else 
					redirect('fight/fight');
			}
			else 
				redirect('fight/fight');
		}
		else
			redirect('fight/fight');
	}

	public function temp($id_capa) {
		if (!$this->challenge_model->exists_fight($this->session->userdata('id')))
			redirect('fight/challenge/');
		if ($this->challenge_model->is_ready($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id')))
			redirect('fight/fight/');
		$team = $this->pokemon_model->get_in_team($this->session->userdata('id'));
		if (!isset($team[$this->session->userdata('in_fight')]['capacity'][$id_capa]) || $team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['nb_pp'] <= 0) 
			redirect('fight/fight/');
		$this->session->set_userdata('id_capa', $id_capa);
		$this->challenge_model->set_ready($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id'));
		redirect('fight/fight/');
	}

	public function make_attack() { 	// ajax
		if ($this->challenge_model->is_ready($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id_from')) &&
			$this->challenge_model->is_ready($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id_to'))) {
			if ($this->session->userdata('id') == $this->session->userdata('id_from')) {
				$team = $this->pokemon_model->get_in_team($this->session->userdata('id_from'));
				$enemy_team = $this->pokemon_model->get_in_team($this->session->userdata('id_to'));
			}
			else {
				$team = $this->pokemon_model->get_in_team($this->session->userdata('id_to'));
				$enemy_team = $this->pokemon_model->get_in_team($this->session->userdata('id_from'));
			}
			$poke = $team[$this->session->userdata('in_fight')];
			$enemy_poke = $enemy_team[$this->session->userdata('enemy_in_fight')];

			if ($poke['speed']*(1+$poke['level']/100) > $enemy_poke['speed']*(1+$enemy_poke['level']/100)) {
				$this->attack($this->session->userdata('id_capa'));
				$this->challenge_model->set_played($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id'));
			}

			else if ($this->challenge_model->enemy_has_played($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id'))) {
				if ($poke['%_hp'] > 0)
					$this->attack($this->session->userdata('id_capa'));
				$this->challenge_model->set_played($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id'));
			}
		}
	}

	public function attack($id_capa) {

		$team = $this->pokemon_model->get_in_team($this->session->userdata('id'));

		$poke = $team[$this->session->userdata('in_fight')];

		$this->pokemon_capacity_model->update_capacity($poke['id'],
													   $poke['capacity'][$id_capa]['id'],
													   $this->pokemon_capacity_model->get_pp($poke['capacity'][$id_capa]['id'], $poke['id']) - 1);

		if (isset($poke['capacity'][$id_capa]['puis'])) {

			$enemy = $this->session->userdata('id') == $this->session->userdata('id_from') ? $this->session->userdata('id_to') : $this->session->userdata('id_from');
			$enemy_team = $this->pokemon_model->get_in_team($enemy);

			$damage = $this->get_damage($team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['puis'],
										$team[$this->session->userdata('in_fight')]['level'],
										$team[$this->session->userdata('in_fight')]['type'],
										$team[$this->session->userdata('in_fight')]['capacity'][$id_capa]['id_type'],
									    $enemy_team[$this->session->userdata('enemy_in_fight')]['defense'],
									    $enemy_team[$this->session->userdata('enemy_in_fight')]['level']);

			$hp = $enemy_team[$this->session->userdata('enemy_in_fight')]['%_hp'] - $damage;
			if ($hp < 0)
				$hp = 0;

			$this->pokemon_model->update_pokemon($enemy_team[$this->session->userdata('enemy_in_fight')]['id'],
												 $enemy_team[$this->session->userdata('enemy_in_fight')]['level'],
												 $enemy_team[$this->session->userdata('enemy_in_fight')]['xp'],
												 $hp,
												 $enemy,
												 $enemy_team[$this->session->userdata('enemy_in_fight')]['id_pokedex'],
												 $enemy_team[$this->session->userdata('enemy_in_fight')]['in_team']);
		}
	}

	private function get_damage($puis_att, $level_att, $type_att, $type_capa_att, $def_def, $level_def) {
		foreach ($type_att as $type) {
			if ($type['id'] == $type_capa_att)
				return 2 * $puis_att * ($level_att+1) / $def_def / ($level_def+1) * 10;
		}
		return $puis_att * ($level_att+1) / ($def_def * ($level_def+1)) * 10;
	}

	public function refresh() {
		if ($this->challenge_model->completed($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id'))) {
			$this->challenge_model->new_turn($this->session->userdata('id_from'), $this->session->userdata('id_to'), $this->session->userdata('id'));
			echo "do_it";
		}
	}

	public function ready() { 	// ajax
		if ($this->challenge_model->enemy_ready($this->session->userdata('id'))) {
			$this->challenge_model->ready_off($this->session->userdata('id'));
			echo "do_it";
		}
	}

	public function set_ready() {
		$this->challenge_model->sey_ready($this->session->userdata('id'));
		$this->turn_over();
		redirect('fight/fight');
	}

	public function win() {
		echo "win";
	}

	public function lose() {
		echo "lose";
	}
}
