<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Fight extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Fight_model', 'fight_model');
		$this->load->model('User_model', 'user_model');
		if (!$this->user_model->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
				redirect('user/connection/');
		}
	}

	public function index() {
		$data = ['online' => $this->fight_model->get_online()];
		$this->load->view('Fight/online', $data);
	}

	public function send_challenge($id_to) {
		if (!$this->fight_model->challenge_already_send($this->session->userdata('id'), $id_to))
			$this->fight_model->send_challenge($this->session->userdata('id'), $id_to);
		redirect('fight/');
	}
}
