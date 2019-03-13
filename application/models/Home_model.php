<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Home_model extends CI_Model {

	private $table = '';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function pickRandomWildPokemon($rand) {
		return $this->db->select('*')
						->from('pokedex')
						->where('id' = $rand)
	}

}