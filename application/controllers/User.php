<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('cookie');
		$this->load->library('session');
		$this->load->library('form_validation');
		$this->load->model('User_model', 'user_modele');
	}

	public function index() {
		redirect('user/home/');
	}

	public function home() {
		if ($this->user_modele->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
			$this->load->view('home');
			$this->output->enable_profiler(true);
		}
		else {
			show_404();
		}
	}

	private function sendmail($pseudo, $key) {
		$recipient = $_POST['email'];
		$topic = 'Account activation';
		$header = array('From' => 'inscription@pokemon-wim.com');
		$message = 'Welcome to Pokemon-WIM,'."\n\n".'To activate your account, please click on the link below or copy / paste it in your internet browser.'."\n".site_url(array('user', 'activation', $pseudo, $key))."\n\n".'---------------'."\n".'This is an automatic email, Thank you to do not answer.';
		mail($recipient, $topic, $message, $header);
	}

	public function inscription() {
		$this->form_validation->set_rules('pseudo', 'Pseudonym', 'trim|required|min_length[3]|max_length[21]|alpha_dash|encode_php_tags');
		$this->form_validation->set_rules('emailConfirmation', 'E-mail Confirmation', 'required');
		$this->form_validation->set_rules('email', 'E-mail', 'trim|required|valid_email|encode_php_tags|matches[emailConfirmation]');
		$this->form_validation->set_rules('passwordConfirmation', 'Password Confirmation', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]|max_length[50]|encode_php_tags|matches[passwordConfirmation]');
		$this->form_validation->set_rules('pokemon', 'Starting Pokemon', 'required|in_list[bulbizarre,salameche,carapuce]');

		if ($this->form_validation->run() && 
			!$this->user_modele->pseudo_exists($this->input->post('pseudo')) && 
			!$this->user_modele->email_exists($this->input->post('email'))) {
			
			$key = sha1(time());

			$this->user_modele->add_member($this->input->post('pseudo'),
										$this->input->post('email'),
										$this->input->post('password'),
										$this->input->post('pokemon'),
										$key);

			$this->sendmail($this->input->post('pseudo'),
							$key);

			$data['pseudo'] = $this->input->post('pseudo');

			$this->load->view('accountCreated', $data);
		}
		else {
			$this->load->view('formInscription');
			if ($this->user_modele->pseudo_exists($this->input->post('pseudo')))
				$this->load->view('pseudoExists');
			if ($this->user_modele->email_exists($this->input->post('email')))
				$this->load->view('emailExists');
		}
	}

	public function activation($pseudo = null, $key = null) {
		if ($this->user_modele->member_exists_0($pseudo, $key)) {
			$data['pseudo'] = $pseudo;
			if ($this->user_modele->member_active_0($pseudo, $key))
				$this->load->view('memberAlreadyActive', $data);
			else {
				$this->user_modele->active_member($pseudo, $key);
				$this->load->view('memberActivated', $data);
			}
		}
		else
			show_404();
	}

	public function connection() {
		$this->form_validation->set_rules('pseudo', 'Pseudonym', 'required|encode_php_tags');
		$this->form_validation->set_rules('password', 'Password', 'required|encode_php_tags');

		if ($this->form_validation->run() && 
			$this->user_modele->member_exists($this->input->post('pseudo'), sha1($this->input->post('password'))) &&
			$this->user_modele->member_active($this->input->post('pseudo'), sha1($this->input->post('password')))) {

			$cookie = array('name' => 'pseudo',
							'value' => $this->input->post('pseudo'),
							'expire' => '604800');
			$this->input->set_cookie($cookie, true);
			$this->session->set_userdata('pseudo', $this->input->post('pseudo'));
			$this->session->set_userdata('password', sha1($this->input->post('password')));
			redirect('user/home/');
		}
		else {
			$this->load->view('formConnection');

			if ($this->input->post('pseudo') != null &&
				$this->input->post('password') != null &&
				!$this->user_modele->member_exists($this->input->post('pseudo'), sha1($this->input->post('password')))) {
				$this->load->view('memberNotExists');
			}
			if ($this->input->post('pseudo') != null &&
				$this->input->post('password') != null &&
				$this->user_modele->member_exists($this->input->post('pseudo'), sha1($this->input->post('password'))) &&
				!$this->user_modele->member_active($this->input->post('pseudo'), sha1($this->input->post('password')))) {
				$this->load->view('memberNotActive');
			}
		}
	}

	public function disconnection() {
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
