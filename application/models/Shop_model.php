<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Shop_model extends CI_Model {

	private $table_pokemon = 'pokemon';
	private $table_pokedex = 'pokedex';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

}