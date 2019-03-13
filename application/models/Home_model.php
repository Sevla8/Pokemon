<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Home_model extends CI_Model {

	private $table = '';

	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	public function selectTrainer() {
		//retourn le trainer connecté
	}

	public function sizeTeam() {
		//retourne le nb de pokemon dans la team d'un trainer
	}

	public function pickRandomWildPokemon($randId_pokedex, $randLevel, $randXp, $id_trainer) {
		$this->db->set('id_pokedex', $randId_pokedex)
					->set('level', $randLevel)
					->set('xp', $randXp)
					->set('id_trainer', $id_trainer)
					->insert('pokemon');
	}
}