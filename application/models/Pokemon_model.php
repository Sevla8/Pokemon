<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Pokemon_Model extends CI_Model {

	private $table = 'pokemon';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}



}