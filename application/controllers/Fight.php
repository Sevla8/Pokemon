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
		$data = ['online' =>  $this->member_model->get_online(), 
				 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];
		if ($this->challenge_model->exists_challenge($this->session->userdata('id')))
			$data['challenge_from'] = $this->challenge_model->get_all_challenge($this->session->userdata('id'));
		$this->layout->view('header', $data)
					 ->link_css('header')
					 ->view('Fight/challenges')
					 ->view('footer')
					 ->link_css('footer')
					 ->set_title('Challenge')
					 ->print();
	}

	public function send_challenge($id_to) {
		// control on $id_to !!!
		if (!$this->challenge_model->challenge_already_send($this->session->userdata('id'), $id_to))
			$this->challenge_model->send_challenge($this->session->userdata('id'), $id_to);
		redirect('fight/');
	}

	public function accept_challenge($id_from) {
		$this->session->set_userdata('id_from', $id_from);
		redirect('fight/fight/');
	}

	public function exists_new_challenge() {	// ajax
		if ($this->challenge_model->exists_new_challenge($this->session->userdata('id'))) {
			$id_from = $this->challenge_model->get_new_challenge($this->session->userdata('id'));
			$this->challenge_model->check($id_from, $this->session->userdata('id'));
			echo $this->trainer_model->get_trainer($id_from)['name'];
		}
	}

	public function fight() {
		if ($this->session->userdata('id_from') === null)
			show_404();
		else {
			$data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id')),
					 'enemy_trainer' => $this->trainer_model->get_trainer($this->session->userdata('id_from')),
					 'team' => $this->pokemon_model->get_in_team($this->session->userdata('id')),
					 'enemy_team' => $this->pokemon_model->get_in_team($this->session->userdata('id_from'))];

			$i;
			for ($i = 0; $i < 6; $i += 1) {
				if (isset($data['team'][$i]) && $data['team'][$i]['%_hp'] > 0) {
					$data['in_fight'] = $i;
					break;
				}
			}
			if ($i == 6)
				echo "no more healthy pokemon noob";

			for ($i = 0; $i < 6; $i += 1) {
				if (isset($data['enemy_team'][$i]) && $data['enemy_team'][$i]['%_hp'] > 0) {
					$data['enemy_in_fight'] = $i;
					break;
				}
			}
			if ($i == 6)
				echo "no more healthy pokemon noob";

			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('Fight/fight')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title('Fight')
						 ->print();
		}
	}
	
}
