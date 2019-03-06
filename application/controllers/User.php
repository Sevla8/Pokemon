<?php 
if (!defined('BASEPATH')) 
	exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('User_model', 'user_modele');
	}

	// public function index() {
	// 	$this->home();
	// }

	// public function home() {

	// }

	private function sendmail($pseudo, $key) {
		$recipient = $_POST['email'];
		$topic = 'Account activation';
		$header = array('From' => 'inscription@pokemon-wim.com');
		$message = 'Welcome to Pokemon-WIM,'."\n\n".'To activate your account, please click on the link below or copy / paste it in your internet browser.'."\n".'http://localhost/Pokemon/activation.php?pseudo='.urlencode($pseudo).'&key='.urlencode($key)."\n\n".'---------------'."\n".'This is an automatic email, Thank you to do not answer.';
		mail($recipient, $topic, $message, $header);
	}

	public function inscription() {
		$this->load->library('form_validation');

		$this->form_validation->set_rules('pseudo', 'Pseudo', 'trim|required|min_length[3]|max_length[21]|alpha_dash|encode_php_tags');
		$this->form_validation->set_rules('emailConfirmation', 'E-mail Confirmation', 'required');
		$this->form_validation->set_rules('email', 'E-mail', 'trim|required|valid_email|encode_php_tags|matches[emailConfirmation]');
		$this->form_validation->set_rules('passwordConfirmation', 'Password Confirmation', 'required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[8]|max_length[50]|encode_php_tags|matches[passwordConfirmation]');
		$this->form_validation->set_rules('pokemon', 'Starting Pokemon', 'required|in_list[bulbizarre,salameche,carapuce]');

		if ($this->form_validation->run()) {
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
		}
	}

	public function activation($pseudo, $key) {
		if ($this->user_modele->member_exists($pseudo, $key)) {
			if ($this->user_modele->member_active($pseudo, $key))
				$this->load->view('memberAlreadyActive');
			else {
				$this->user_modele->active_member($pseudo, $key);
				$this->load->view('memberActivated');
			}
		}
		else {
			show_404();
		}
	}

	// public function connection() {

	// }

	// public function disconnection() {

	// }

	// public function profil() {

	// }

	// public function _remap($method) {

	// }

	// public function _output($output) {

	// }
}
