<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Shop extends CI_Controller {

	private $potion = 0;
	private $pokeball = 0;

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->library('session');
		$this->load->model('Shop_model', 'shop_model');
		$this->load->model('User_model', 'user_model');
		if (!$this->user_model->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
				redirect('user/connection/');
		}
	}

	public function index() {
		$data['pseudo'] = $this->session->userdata('pseudo');
		$this->load->view('Shop/shop', $data);
	}

	public function ajax() {
		if (isset($_POST['potion']) && isset($_POST['pokeball'])) {
			$_POST['potion'] = filter_var($_POST['potion'], FILTER_SANITIZE_NUMBER_INT);
			$_POST['pokeball'] = filter_var($_POST['pokeball'], FILTER_SANITIZE_NUMBER_INT);
			$result = $_POST['potion'] * 10 + $_POST['pokeball'] * 25;
			echo $result;
		}
	}
}
