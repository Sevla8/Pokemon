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
		$this->load->library('form_validation');
		$this->load->model('User_model', 'user_model');
		$this->load->model('Fight_model', 'fight_model');
	}

	public function index() {
		redirect('user/home/');
	}

	public function home() {
		// control session
		if ($this->user_model->member_exists($this->session->userdata('pseudo'), $this->session->userdata('password'))) {
			$this->load->view('User/home');
			// new day
			if ($this->user_model->get_day($this->session->userdata('id')) != date('Y-m-d')) {
				$this->user_model->new_day($this->session->userdata('id'));
			}
			// update last_activity
			$this->user_model->set_last_activity($this->session->userdata('id'));

			$this->output->enable_profiler(true);
		}
		else
			redirect('user/connection/');
	}

	private function sendmail($pseudo, $key) {
		$recipient = $_POST['email'];
		$topic = 'Account activation';
		$header = array('From' => 'inscription@pokemon-wim.com');
		$message = 'Welcome to Pokemon-WIM,'."\n\n".'To activate your account, please click on the link below or copy / paste it in your internet browser.'."\n".site_url(array('user', 'activation', $pseudo, $key))."\n\n".'---------------'."\n".'This is an automatic email, Thank you to do not answer.';
		mail($recipient, $topic, $message, $header);
	}

	public function inscription() {
		// control form
		$this->form_validation->set_rules('pseudo', 'Pseudonym', 'trim|required|min_length[3]|max_length[21]|alpha_dash|encode_php_tags');
		$this->form_validation->set_rules('emailConfirmation', 'E-mail Confirmation', 'required');
		$this->form_validation->set_rules('email', 'E-mail', 'trim|required|valid_email|encode_php_tags|matches[emailConfirmation]');
		$this->form_validation->set_rules('passwordConfirmation', 'Password Confirmation', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]|max_length[50]|encode_php_tags|matches[passwordConfirmation]');
		$this->form_validation->set_rules('pokemon', 'Starting Pokemon', 'required|in_list[bulbizarre,salameche,carapuce]');

		if ($this->form_validation->run() && 	// form ok
			!$this->user_model->pseudo_exists($this->input->post('pseudo')) && 
			!$this->user_model->email_exists($this->input->post('email'))) {
			
			$key = sha1(time()); // generate random key

			$this->user_model->add_member($this->input->post('pseudo'),
										$this->input->post('email'),
										$this->input->post('password'),
										$this->input->post('pokemon'),
										$key);

			$this->sendmail($this->input->post('pseudo'),
							$key);

			$data['pseudo'] = $this->input->post('pseudo');

			$this->load->view('User/account_created', $data);
		}
		else {	// form ko
			$this->load->view('User/form_inscription');	// basic form
			if ($this->user_model->pseudo_exists($this->input->post('pseudo')))
				$this->load->view('User/pseudo_exists');	// error psuedo
			if ($this->user_model->email_exists($this->input->post('email')))
				$this->load->view('User/email_exists');	// error email
		}
	}

	public function activation($pseudo = null, $key = null) {
		if ($this->user_model->member_exists_0($pseudo, $key)) {
			$data['pseudo'] = $pseudo;
			if ($this->user_model->member_active_0($pseudo, $key))
				$this->load->view('User/member_already_active', $data);
			else {
				$this->user_model->active_member($pseudo, $key);
				$this->load->view('User/member_activated', $data);
			}
		}
		else
			show_404();
	}

	public function connection() {
		// control form
		$this->form_validation->set_rules('pseudo', 'Pseudonym', 'required|encode_php_tags');
		$this->form_validation->set_rules('password', 'Password', 'required|encode_php_tags');

		if ($this->form_validation->run() && 	// form ok
			$this->user_model->member_exists($this->input->post('pseudo'), sha1($this->input->post('password'))) &&
			$this->user_model->member_active($this->input->post('pseudo'), sha1($this->input->post('password')))) {
			// create cookie for pseudo
			$cookie = array('name' => 'pseudo',
							'value' => $this->input->post('pseudo'),
							'expire' => '604800');
			$this->input->set_cookie($cookie, true);
			// save pseudo & password & id in session 
			$this->session->set_userdata('pseudo', $this->input->post('pseudo'));
			$this->session->set_userdata('password', sha1($this->input->post('password')));
			$this->session->set_userdata('id', $this->user_model->get_id($this->session->userdata('pseudo')));
			// db member.online update
			$this->user_model->online($this->session->userdata('id'));
			redirect('user/home/');
		}
		else {	// form ko
			$this->load->view('User/form_connection');
			// member do not exists error
			if ($this->input->post('pseudo') != null &&
				$this->input->post('password') != null &&
				!$this->user_model->member_exists($this->input->post('pseudo'), sha1($this->input->post('password')))) {
				$this->load->view('User/member_not_exists');
			}
			// member not active error
			if ($this->input->post('pseudo') != null &&
				$this->input->post('password') != null &&
				$this->user_model->member_exists($this->input->post('pseudo'), sha1($this->input->post('password'))) &&
				!$this->user_model->member_active($this->input->post('pseudo'), sha1($this->input->post('password')))) {
				$this->load->view('User/member_not_active');
			}
		}
	}

	public function disconnection() {
		$this->fight_model->stop_challenge($this->session->userdata('id'));
		$this->user_model->offline($this->session->userdata('id'));
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
