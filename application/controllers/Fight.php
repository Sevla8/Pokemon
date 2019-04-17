<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Fight extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Member_model', 'member_model');
		$this->load->model('Trainer_model', 'trainer_model');
		$this->load->model('Challenge_model', 'challenge_model');
		if (!$this->session->has_userdata('id'))
			redirect('user/connection');
	}

	public function index() {
		$data = ['online' =>  $this->member_model->get_online()];
		if ($this->challenge_model->exists_challenge($this->session->userdata('id')))
			$data['challenge_from'] = $this->challenge_model->get_all_challenge($this->session->userdata('id'));
		$this->load->view('Fight/challenges', $data);
	}

	public function send_challenge($id_to) {
		// control on $id_to !!!
		if (!$this->challenge_model->challenge_already_send($this->session->userdata('id'), $id_to))
			$this->challenge_model->send_challenge($this->session->userdata('id'), $id_to);
		redirect('fight/');
	}

	public function accept_challenge($id_from) {
		echo "string";
	}

	public function exists_challenge() {
		if ($this->challenge_model->exists_challenge($this->session->userdata('id'))) {
			$data = $this->challenge_model->get_challenge($this->session->userdata('id'));
			$this->challenge_model->check($data, $this->session->userdata('id'));
			echo $this->trainer_model->get_trainer($data)['name'];
		}
	}

	
}
