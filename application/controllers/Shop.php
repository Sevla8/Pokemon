<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class Shop extends CI_Controller {

	private $potion_price = 10;
	private $pokeball_price = 25;

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
			$result = $_POST['potion'] * $this->potion_price + $_POST['pokeball'] * $this->pokeball_price;
			echo $result;
		}
	}

	public function basket() {
		if (isset($_POST['potion']) && isset($_POST['pokeball']) && $_POST['potion'] != 0 && $_POST['pokeball'] != 0) {
			$_POST['potion'] = filter_var($_POST['potion'], FILTER_SANITIZE_NUMBER_INT);
			$_POST['pokeball'] = filter_var($_POST['pokeball'], FILTER_SANITIZE_NUMBER_INT);
			$total = $_POST['potion'] * $this->potion_price + $_POST['pokeball'] * $this->pokeball_price;
			$data = [ 'pseudo' => $this->session->userdata('pseudo')];
			if ($this->shop_model->get_pokedollar($this->session->userdata('id')) >= $total) {
				$this->shop_model->debit($this->session->userdata('id'), $total, $_POST['potion'], $_POST['pokeball']);
				$this->load->view('Shop/thank_you', $data);
			}
			else {
				$this->load->view('Shop/shop', $data);
				$this->load->view('Shop/lack_money', $data);
			}
		}
	}
}
