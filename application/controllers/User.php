<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('link');
		$this->load->helper('cookie');
		$this->load->library('layout');
		$this->load->library('session');
		$this->load->library('encryption');
		$this->load->library('form_validation');
		$this->load->model('Member_model', 'member_model');
		$this->load->model('Trainer_model', 'trainer_model');
		$this->load->model('Pokemon_model', 'pokemon_model');
		$this->load->model('Challenge_model', 'challenge_model');
		$this->load->model('Pokemon_Capacity_model', 'pokemon_capacity_model');
	}

	public function index() {
		redirect('user/home/');
	}

	public function home() {
		// control session
		if ($this->session->has_userdata('id')) {
			$data = ['trainer' => $this->trainer_model->get_trainer($this->session->userdata('id'))];
			$this->layout->view('header', $data)
						 ->link_css('header')
						 ->view('User/home')
						 ->link_js('challenge')
						 ->link_js('time_to_fight')
						 ->view('footer')
						 ->link_css('footer')
						 ->set_title('Home')
						 ->print();
			// new day
			if ($this->member_model->get_last_activity($this->session->userdata('id')) != date('Y-m-d')) {
				$this->trainer_model->new_day($this->session->userdata('id'));
				$this->pokemon_model->new_day($this->session->userdata('id'));
				$this->pokemon_capacity_model->new_day($this->session->userdata('id'));
			}
			// update last_activity
			$this->member_model->set_last_activity($this->session->userdata('id'));
		}
		else
			redirect('user/connection/');
	}

	private function sendmail($email, $key) {
		$recipient = $this->input->post('email');
		$topic = 'Account activation';
		$header = array('From' => 'inscription@pokemon-wim.com');
		$message = 'Welcome to Pokemon-WIM,'."\n\n".'To activate your account, please click on the link below or copy / paste it in your internet browser.'."\n".site_url(array('user', 'activation', urlencode($email), $key))."\n\n".'---------------'."\n".'This is an automatic email, Thank you to do not answer.';
		mail($recipient, $topic, $message, $header);
	}

	public function inscription() {
		// control form
		$this->form_validation->set_rules('pseudo', 'Pseudonym', 'trim|required|min_length[3]|max_length[21]|alpha_dash|encode_php_tags')
							  ->set_rules('emailConfirmation', 'E-mail Confirmation', 'required')
							  ->set_rules('email', 'E-mail', 'trim|required|valid_email|encode_php_tags|matches[emailConfirmation]')
							  ->set_rules('passwordConfirmation', 'Password Confirmation', 'required')
							  ->set_rules('password', 'Password', 'required|min_length[5]|max_length[50]|encode_php_tags|matches[passwordConfirmation]')
							  ->set_rules('pokemon', 'Starting Pokemon', 'required|in_list[bulbizarre,salameche,carapuce]')
							  ->set_rules('avatar', 'Avatar', 'required|in_list[1,2,3,4,5,6,7,8,9,10,11,12,13]');

		if ($this->form_validation->run() && 	// form ok
			!$this->trainer_model->pseudo_exists($this->input->post('pseudo')) && 
			!$this->member_model->email_exists($this->input->post('email'))) {
			
			$key = sha1(time()); // generate random key
			//	add member
			$this->member_model->set_member($this->input->post('email'),
											sha1($this->input->post('password')),
											$key,
											0,
											date('Y-m-d G:i:s'),
											0);
			//	add trainer
			$this->trainer_model->set_trainer($this->member_model->get_id($this->input->post('email')),
											  $this->input->post('pseudo'),
											  $this->input->post('avatar'),
											  100,
											  5,
											  1);
			//	add pokemon
			$id_pokedex;
			switch ($this->input->post('pokemon')) {
				case 'bulbizarre':
					$id_pokedex = 1;
					break;
				case 'salameche':
					$id_pokedex = 4;
					break;
				case 'carapuce':
					$id_pokedex = 7;
					break;
			}
			$this->pokemon_model->set_pokemon(0,
											  0,
											  100,
											  $this->member_model->get_id($this->input->post('email')),
											  $id_pokedex,
											  1);
			//	add capacities
			$id_starter = $this->pokemon_model->get_starter($this->member_model->get_id($this->input->post('email')));
			$capa = $this->pokedex_capacity_model->get_capacity($id_pokedex, 0);
			foreach ($capa as $capacity) {
				$this->pokemon_capacity_model->set_capacity($id_starter,
															$capacity['id_capacity'],
															$this->capacity_model->get_capacity($capacity['id_capacity'])['pp']);
			}
			

			$this->sendmail($this->input->post('email'), $key);

			$data = ['pseudo' => ($this->trainer_model->get_trainer($this->member_model->get_id($this->input->post('email'))))['name']];

			$this->load->view('User/account_created', $data);
		}
		else {	// form ko
			$this->load->view('User/form_inscription');	// basic form
			if ($this->trainer_model->pseudo_exists($this->input->post('pseudo')))
				$this->load->view('User/pseudo_exists');	// error psuedo
			if ($this->member_model->email_exists($this->input->post('email')))
				$this->load->view('User/email_exists');	// error email
		}
	}

	public function activation($email = null, $key = null) {
		$email = urldecode($email);
		if ($this->member_model->member_exists_by_email_key($email, $key)) {
			$data = ['pseudo' => $this->trainer_model->get_trainer($this->member_model->get_id($email))['name']];
			if ($this->member_model->member_active_by_email_key($email, $key))
				$this->load->view('User/member_already_active', $data);
			else {
				$this->member_model->active_member($email, $key);
				$this->load->view('User/member_activated', $data);
			}
		}
		else
			show_404();
	}

	public function connection() {
		// control form
		$this->form_validation->set_rules('email', 'E-mail', 'required|valid_email|encode_php_tags');
		$this->form_validation->set_rules('password', 'Password', 'required|encode_php_tags');

		if ($this->form_validation->run() && 	// form ok
			$this->member_model->member_exists($this->input->post('email'), sha1($this->input->post('password'))) &&
			$this->member_model->member_active($this->input->post('email'), sha1($this->input->post('password')))) {
			// create cookie for email
			$cookie = array('name' => 'email',
							'value' => $this->input->post('email'),
							'expire' => '604800');
			$this->input->set_cookie($cookie, true);
			// save email & password & id & pseudo in session 
			$this->session->set_userdata('email', $this->input->post('email'));
			$this->session->set_userdata('password', sha1($this->input->post('password')));
			$this->session->set_userdata('id', $this->member_model->get_id($this->session->userdata('email')));
			$this->session->set_userdata('pseudo', $this->trainer_model->get_trainer($this->session->userdata('id'))['name']);
			// db member.online update
			$this->member_model->set_online($this->session->userdata('id'));
			redirect('user/home/');
		}
		else {	// form ko
			$this->load->view('User/form_connection');
			// member do not exists error
			if ($this->input->post('email') != null &&
				$this->input->post('password') != null &&
				!$this->member_model->member_exists($this->input->post('email'), sha1($this->input->post('password')))) {
				$this->load->view('User/member_not_exists');
			}
			// member not active error
			if ($this->input->post('email') != null &&
				$this->input->post('password') != null &&
				$this->member_model->member_exists($this->input->post('email'), sha1($this->input->post('password'))) &&
				!$this->member_model->member_active($this->input->post('email'), sha1($this->input->post('password')))) {
				$this->load->view('User/member_not_active');
			}
		}
	}

	public function disconnection() {
		$this->challenge_model->stop_challenge($this->session->userdata('id'));
		$this->member_model->set_offline($this->session->userdata('id'));
		$this->session->sess_destroy();
		redirect('user/connection/');
	}

	// public function profil() {

	// }

	// public function _remap($method) {

	// }

	// public function _output($output) {

	// }
}
