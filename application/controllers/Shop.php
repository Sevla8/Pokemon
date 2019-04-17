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
		$this->load->library('layout');
		$this->load->library('session');
		$this->load->library('form_validation');
		$this->load->model('Trainer_model', 'trainer_model');
		if (!$this->session->has_userdata('id'))
			redirect('user/connection');
	}

	public function index() {	// main function
		// control form
		$this->form_validation->set_rules('potion', 'Potion', 'trim|required|is_natural')
							  ->set_rules('pokeball', 'Pokeball', 'trim|required|is_natural');

		$data = ['pseudo' => $this->session->userdata('pseudo'),
				 'potion_price' => $this->potion_price, 
				 'pokeball_price' => $this->pokeball_price,
				 'trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];

		if ($this->form_validation->run() && !($this->input->post('potion') == 0 && $this->input->post('pokeball') == 0)) {

			$total = $this->input->post('potion') * $this->potion_price + 
					 $this->input->post('pokeball') * $this->pokeball_price;

			if ($this->trainer_model->get_pokedollar($this->session->userdata('id')) >= $total) {
				$this->trainer_model->debit($this->session->userdata('id'), 
											$total, 
											$this->input->post('potion'), 
											$this->input->post('pokeball'));

				$this->layout->view('header', $data)
							 ->link_css('header')
							 ->view('Shop/shop')
							 ->link_js('shop')
							 ->view('Shop/thank_you')
							 ->view('footer')
							 ->link_css('footer')
							 ->set_title('Shop')
							 ->print();
			}
			else {
				$this->layout->view('header', $data)
							 ->link_css('header')
							 ->view('Shop/shop')
							 ->link_js('shop')
							 ->view('Shop/lack_money')
							 ->view('footer')
							 ->link_css('footer')
							 ->set_title('Shop')
							 ->print();
			}
		}
		else
			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('Shop/shop', $data)
						 ->link_js('shop')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title('Shop')
						 ->print();
	}

	public function total() {	// ajax
		if (isset($_POST['potion']) && isset($_POST['pokeball'])) {
			$_POST['potion'] = intval(filter_var($_POST['potion'], FILTER_SANITIZE_NUMBER_INT));
			$_POST['pokeball'] = intval(filter_var($_POST['pokeball'], FILTER_SANITIZE_NUMBER_INT));
			$result = $_POST['potion'] * $this->potion_price + $_POST['pokeball'] * $this->pokeball_price;
			echo $result;
		}
		else
			show_404();
	}
}
