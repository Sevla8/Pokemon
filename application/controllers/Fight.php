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
		$this->load->model('Challenge_model', 'challenge_model');
		// control
	}

	public function index() {
		$data = ['online' => $this->member_model->get_online()];
		$this->load->view('Fight/online', $data);
	}

	public function send_challenge($id_to) {
		// control on $id_to !!!
		if (!$this->challenge_model->challenge_already_send($this->session->userdata('id'), $id_to))
			$this->challenge_model->send_challenge($this->session->userdata('id'), $id_to);
		redirect('fight/');
	}
}
