DROP TABLE IF EXISTS type, capacite;

CREATE TABLE type (
	id_type int NOT NULL,
	name_type varchar(10) NOT NULL,
	PRIMARY KEY(id_type)
);

INSERT INTO type(id_type, name_type) VALUES
	(1, 'fight'),
	(2, 'dragon'),
	(3, 'water'),
	(4, 'electric'),
	(5, 'fire'),
	(6, 'ice'),
	(7, 'insect'),
	(8, 'normal'),
	(9, 'grass'),
	(10, 'poison'),
	(11, 'psychic'),
	(12, 'rock'),
	(13, 'ground'),
	(14, 'ghost'),
	(15, 'fly');

CREATE TABLE capacity (
	id_capa int NOT NULL,
	name_capa varchar(25) NOT NULL,
	type_capa int NOT NULL,
	class_capa enum('physical', 'special'),
	puis_capa int,
	prec_capa int,
	pp_capa int NOT NULL,
	eff_sec_capa varchar(255),
	PRIMARY KEY(id_capa),
	FOREIGN KEY(type_capa) REFERENCES type(id_type)
);

INSERT INTO capacity VALUES 
	(1, 'Riposte', 1, 'physical', null, 100, 20, "Inflige le double des dégâts subis par une attaque de type Normal ou Combat durant le tour, échoue sinon"),
	(2, 'Frappe Atlas', 1, 'physical', null, 100, 20, "Inflige des dégâts égaux au niveau du lanceur"),
	(3, 'Double Pied', 1, 'physical', 30, 100, 30, "Frappe deux fois"),
	(4, 'Balayage', 1, 'physical', 50, 100, 20, "Peut apeurer la cible - Taux de Coups Critiques élevé"),
	(5, 'Mawashi Geri', 1, 'physical', 60, 85, 15, "Peut apeurer la cible"),
	(6, 'Pied Sauté', 1, 'physical', 70, 95, 25, "Enlève 1 PV si l'attaque échoue"),
	(7, 'Sacrifice', 1, 'physical', 80, 80, 25, "Blesse le lanceur"),
	(8, 'Pied Voltige', 1, 'physical', 85, 90, 20, "Enlève 1 PV si l'attaque échoue"),
	(9, 'Draco-Rage', 2, 'special', null, 100, 10, "Inflige toujours 40 PV de dégâts"),
	(10, 'Repli', 3, null, null, 100, 40, "Augmente la défense du lanceur"),
	(11, 'Écume', 3, "special", 20, 100, 30, "Peut baisser la vitesse de la cible"),
	(12, 'Claquoir', 3, 'special', 35, 75, 10, "Attaque continue sur deux à cinq tours"),
	(13, 'Pistolet à O', 3, 'special', 40, 100, 25, null),
	(14, "Bulles d'O", 3, 'special', 65, 100, 20, 'Peut baisser la vitesse de la cible'),
	(15, 'Cascade', 3, 'special', 80, 100, 15, null),
	(16, 'Pince-Masse', 3, 'special', 90, 85, 10, 'Taux de Coups Critiques élevé'),
	(17, 'Surf', 3, 'special', 95, 100, 15, null),
	(18, 'Hydrocanon', 3, 'special', 120, 80, 5, null),
	(19, 'Cage-Éclair', 4, null, null, null, 100, 20, 'Paralyse la cible'),
	(20, 'Éclair', 4, 'special', 40, 100, 30, 'Peut paralyser la cible'),
	(21, 'Poing-Éclair', 4, 'special', 75, 100, 15, 'Peut paralyser la cible'),
	(22, 'Tonnerre', 4, 'special', 95, 100, 15, 'Peut paralyser la cible'),
	(23, 'Fatal-Foudre', 4, 'special', 120, 70, 5, 'Peut paralyser la cible'),
	(24, 'DanseFlamme' , 5, 'special', 15, 70, 15, "Attaque continue sur deux à cinq tours"),
	(25, 'Flammèche', 5, 'special', 40, 100, 25, 'Peut brûler la cible'),
	(26, 'Poing de Feu', 5, 'special', 75, 100, 15, 'Peut brûler la cible'),
	(27, 'Lance-Flamme', 5, 'special', 95, 100, 15, 'Peut brûler la cible'),
	(28, 'Déflagration', 5, 'special', 120, 85, 5, 'Peut brûler la cible'),
	(29, 'Brume', 6, null, null, null, 30, "Empêche toute variation de stat provoquée par l'adversaire"),
	(30, 'Buée Noire', 6, null, null, null, 30, "Annule toute variation de stat, la confusion, les effets de Puissance, Vampigraine, Mur Lumière et Protection"),
	(31, 'Onde Boréale', 6, 'special', 65, 100, 20, "Peut baisser l'attaque la cible"),
	(32, 'Poing-Glace', 6, 'special', 75, 100, 15, "Peut geler la cible"),
	(33, 'Laser Glace', 6, 'special', 95, 100, 10, "Peut geler la cible"),
	(34, 'Blizzard', 6, 'special', 120, 90, 5, "Peut geler la cible"),
	(35, 'Sécrétion', 7, null, null, 95, 40, "Diminue la vitesse de la cible"),
	(36, 'Dard Nuée', 7, 'physical', 14, 85, 20, "Attaque deux à cinq fois"),
	(37, 'Vampirisme', 7, 'physical', 20, 100, 15, "Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible"),
	(38, 'Double-Dard', 7, 'physical', 25, 100, 20, "Attaque deux fois - Peut empoisoner"),
	(39, 'Adaptation', 8, null, null, null, 30, "Le lanceur devient du même type que l'adversaire"),
	(40, 'Affûtage', 8, null, null, null, 30, "Augmente l'attaque du lanceur"),
	(41, 'Armure', 8, null, null, null, 30, "Augmente la défense du lanceur"),
	(42, 'Berceuse', 8, null, null, 55, 15, "Endort la cible"),
	(43, "Boul'Armure", 8, null, null, null, 40, "Augmente la défense du lanceur"),
	(44, "Brouillard", 8, null, null, 100, 20, "Baisse la précision de la cible"), 
	(45, 'Clonage', 8, null, null, null, 10, "Crée un clone qui prend les dommages à la place du lanceur, enlève 25% des PV du lanceur"),
	(46, 'Copie', , 8, null, null, null, 10, "Apprend une des attaques de l'advresaire au hasard jusqu'à la fin du combat"), 
	(47, 'Croissance', , 8, null, null, null, 40, "Augmente le spécial du lanceur"), 
	(48, "Cyclone", 8, null, null, 100, 20, "Met fin au combat contre un Pokémon sauvage, échoue contre un dresseur"),
	(49, "Danse-Lames", 8, null, null, null, 30, "Augmente l'attaque du lanceur de deux niveaux"),
	(50, "E-Coque", 8, null, null, null, 10, "Restaure jusqu'à la moitié des PV du lanceur"), 
	(51, "Entrave", 8, null, null, 55, 20, "Supprime durant un à huit tour une attaque au hasard de la cible"), 
	(52, "Flash", 8, null, null, 70, 20, "Baisse la précision de la cible"), 
	(53, "Grincement", 8, null, null, 85, 40, "Baisse la défense de l'adversaire de deux niveaux"), 
	(54, "Grobisou"	, 8, null, null, 75, 10, "Endort la cible"), 
	(55, "Groz'Yeux", 8, null, null, 100, 30, "Baisse la défense de la cible"),
	(56, "Hurlement", 8, null, null, 100, 20, "Met fin au combat contre un Pokémon sauvage, échoue contre un dresseur"),
	(57, "Intimidation", 8, null, null, 75, 30, "Paralyse la cible"),
	(58, "Jet de Sable", 8, null, null, 100, 15, "Baisse la précision de la cible"),
	(59, "Lilliput", 8, null, null, null, 20, "Augmente l'esquive du lanceur"), 
	(60, "Métronome", 8, null, null, null, 10, "Exécute une attaque prise au hasard dans cette liste"), 
	(61, "Mimi-Queue", 8, null, null, 100, 30, "Baisse la défense de la cible"), 
	(62, "Morphing", 8, null, null, null, 10, "Transforme le lanceur en le Pokémon adverse"), 
	(63, "Puissance", 8, null, null, null, 30, "Augmente le taux de Coups Critiques du lanceur"), 
	(64, "Reflet", 8, null, null, null, 15, "Augmente l'esquive du lanceur"), 
	(65, "Rugissement", 8, null, null, null, 40, "Baisse l'attaque de la cible"), 
	(66, "Soin", 8, null, null, null, 20, "Restaure jusqu'à la moitié des PV du lanceur"), 
	(67, "Trempette", 8, null, null, null, 40, null),
	(68, "Ultrason", 8, null, null, 55	20, "Rend la cible confuse"), 
	(69, "Croc Fatal", 8, 'physical', null, 90, 10, "Enlève 50% des PV restants de la cible"),
	(70, "Patience", 8, 'physical', null, null, 10, "Immobilise le lanceur deux ou trois tours, puis inflige à l'adversaire le double des dégâts subis pendant cette période"), 
	(71, "Sonicboom", 8, 'physical', null, 90, 20, "Inflige toujours 20 PV de dégâts"), 
	(72, "Empal'Korne", 8, 'physical', null, 30, 5, "Met l'adversaire KO, échoue s'il a une vitesse supérieure à celle du lanceur"), 
	(73, "Guillotine", 8, 'physical', null, 30, 5, "Met l'adversaire KO, échoue s'il a une vitesse supérieure à celle du lanceur"), 
	(74, "Constriction", 8, 'physical',	10, 100, 35, "Peut baisser la vitesse de la cible"), 
	(75, "Étreinte", 8, 'physical',	15, 85, 20, "Attaque continue sur deux à cinq tours"), 
	(76, "Furie", 8, 'physical', 15, 85, 20, "Attaque deux à cinq fois"), 
	(77, "Ligotage", 8, 'physical', 15, 90, 20, "Attaque continue sur deux à cinq tours"), 
	(78, "Pilonnage", 8, 'physical', 15, 85, 20, "Attaque deux à cinq fois"), 
	(79, "Torgnoles", 8, 'physical', 15, 85, 10, "Attaque deux à cinq fois"), 
	(80, "Combo-Griffe", 8, 'physical',	18, 80, 15, "Attaque deux à cinq fois"), 
	(81, "Poing Comète", 8, 'physical',	18, 85, 15, "Attaque deux à cinq fois"), 
	(82, "Frénésie", 8, 'physical', 20, 100, 20, "Attaque sans fin, provoque l'augmentation de l'attaque du lanceur à chaque fois qu'il subit des dégâts"), 
	(83, "Picanon", 8, , 'physical', 20, 100, 15, "Attaque deux à cinq fois"), 
	(84, "Charge", 8, 'physical', 35, 95, 35, null),
	(85, "Tornade", 8, 'physical', 35, 100, 40, null),
	(86, "Écras'Face", 8, 'physical', 40, 100, 35, null),
	(87, "Griffe", 8, 'physical', 40, 100, 35, null),
	(88, "Jackpot", 8, 'physical', 40, 100, 20, "Fait gagner un peu d'argent à la fin des combats"), 
	(89, "Vive-Attaque", 8, 'physical',	40, 100, 30, "Attaque en premier"), 
	(90, "Coupe", 8, 'physical', 50, 95, 30, null), 
	(91, "Poing Karaté", 8, 'physical',	50, 100, 25, "Taux de Coups Critiques élevé"), 
	(92, "Lutte", 8, 'physical', 50, 100, null, "Blesse le lanceur"), 
	(93, "Force Poigne", 8, 'physical', 55, 100, 30, null), 
	(94, "Météores", 8, 'physical', 60, null, 20, "N'échoue jamais"), 
	(95, "Morsure", 8, 'physical', 60, 100, 25, "Peut apeurer la cible"), 
	(96, "Écrasement", 8, 'physical', 65, 100, 20, "Peut apeurer la cible"), 
	(97, "Koud'Korne", 8, 'physical', 65, 100, 25, null), 
	(98, "Coud'Boule", 8, 'physical', 70, 100, 15, "Peut apeurer la cible"), 
	(99, "Tranche", 8, 'physical', 70, 100, 20, "Taux de Coups Critiques élevé"), 
	(100, "Uppercut", 8, 'physical', 70, 100, 10, null), 
	(101, "Coupe-Vent", 8, 'physical', 80, 100, 10, "Attaque en deux tours, n'agit pas au premier"), 
	(102, "Croc de Mort", 8, 'physical', 80, 90, 15, "Peut apeurer la cible"), 
	(103, "Force", 8, 'physical', 80, 100, 15, null), 
	(104, "Souplesse", 8, 'physical', 80, 75, 20, null), 
	(105, "Triplattaque", 8, 'physical', 80, 100, 10, null), 
	(106, "Ultimapoing", 8, 'physical', 80, 85, 20, null), 
	(107, "Plaquage", 8, 'physical', 85, 100, 15, "Peut paralyser la cible"), 
	(108, "Bélier", 8, 'physical', 90, 85, 20, "Blesse le lanceur"), 
	(109, "Mania", 8, 'physical', 90, 100, 20, "Attaque continue sur deux ou trois tours, le lanceur devient confus par la suite"), 
	(110, "Bomb'Œuf", 8, 'physical', 100, 75, 16, null), 
	(111, "Coud'Krâne", 8, 'physical', 100, 100, 15, "Attaque en deux tours, n'agit pas au premier"), 
	(112, "Damoclès", 8, 'physical', 100, 100, 15, "Blesse le lanceur"), 
	(113, "Ultimawashi", 8, 'physical', 120, 75, 5, null), 
	(114, "Destruction", 8, 'physical', 130, 100, 5, "Lanceur KO après l'attaque, ne tient compte que de la moitié de la défense adverse, ce qui équivaut à une puissance réelle de 260"), 
	(115, "Ultralaser", 8, 'physical', 150, 90, 5, "Lanceur immobilisé au tour suivant"), 
	(116, "Explosion", 8, 'physical', 170, 100, 5, "Lanceur KO après l'attaque, ne tient compte que de la moitié dela défense adverse, ce qui équivaut à une puissance réelle de 340"), 
	(Para-Spore	Type plante 3G	- 	- 	75	30	Paralyse la cible
	(Poudre Dodo	Type plante 3G	- 	- 	75	15	Endort la cible
	(Spore	Type plante 3G	- 	- 	100	15	Endort la cible
	(Vampigraine	Type plante 3G	- 	- 	90	10	Draîne à chaque tour des PV de la cible vers le lanceur
	(Vol-Vie	Type plante 3G	, 'special',	20	100	20	Restaure un nombre de PV au lanceur égal
	(à la moitié des dégâts infligés à la cible
	(Fouet Lianes	Type plante 3G	, 'special',	35	100	10	null
	(Méga-Sangsue	Type plante 3G	, 'special',	40	100	10	Restaure un nombre de PV au lanceur égal
	(à la moitié des dégâts infligés à la cible
	(Tranch'Herbe	Type plante 3G	, 'special',	55	95	25	Taux de Coups Critiques élevé
	(Danse-Fleur	Type plante 3G	, 'special',	70	100	20	Attaque continue sur deux ou trois tour, le
	(lanceur devient confus par la suite
	(Lance-Soleil	Type plante 3G	, 'special',	120	100	10	Attaque en deux tours, n'agit pas au premier
	(Acidarmure	Type poison 3G	- 	- 	- 	40	Augmente la défense du lanceur de deux niveaux
	(Gaz Toxik	Type poison 3G	- 	- 	55	40	Empoisonne la cible
	(Poudre Toxik	Type poison 3G	- 	- 	75	35	Empoisonne la cible
	(Toxik	Type poison 3G	- 	- 	85	10	Empoisonne gravement la cible
	(Dard-Venin	Type poison 3G	, 'physical',	15	100	35	Peut empoisonner la cible
	(Purédpois	Type poison 3G	, 'physical',	20	70	20	Peut empoisonner la cible
	(Acide	Type poison 3G	, 'physical',	40	100	30	Peut baisser la défense de la cible
	(Détritus	Type poison 3G	, 'physical',	65	100	20	Peut empoisonner la cible
	(Amnésie	Type psy 3G	- 	- 	- 	20	Augmente le spécial du lanceur de deux niveaux
	(Bouclier	Type psy 3G	- 	- 	- 	30	Augmente la défense du lanceur de deux niveaux
	(Hâte	Type psy 3G	- 	- 	- 	30	Augmente la vitesse du lanceur de deux niveaux
	(Hypnose	Type psy 3G	- 	- 	60	20	Endort la cible
	(Mur Lumière	Type psy 3G	- 	- 	- 	30	Augmente la résistance du lanceur aux attaques , 'special',s
	(Protection	Type psy 3G	- 	- 	- 	20	Augmente la résistance du lanceur aux attaques , 'physical',s
	(Repos	Type psy 3G	- 	- 	- 	10	Restaure tous les PV du lanceur ainsi que son statut,
	(le lanceur est immobilisé pendant deux tours
	(Télékinésie	Type psy 3G	- 	- 	80	15	Baisse la précision de la cible
	(Téléport	Type psy 3G	- 	- 	- 	20	Met fin au combat contre un Pokémon sauvage,
	(échoue contre un dresseur
	(Yoga	Type psy 3G	- 	- 	- 	40	Augmente l'attaque du lanceur
	(Vague Psy	Type psy 3G	, 'special',	- 	80	15	Inflige des dégâts variables
	(Choc Mental	Type psy 3G	, 'special',	50	100	25	Peut rendre la cible confuse
	(Rafale Psy	Type psy 3G	, 'special',	65	100	20	Peut rendre la cible confuse
	(Psyko	Type psy 3G	, 'special',	90	100	10	Peut baisser le spécial de la cible
	(Dévorêve	Type psy 3G	, 'special',	100	100	15	Restaure un nombre de PV au lanceur égal à la moitié des dégâts
	(infligés à la cible, ne fonctionne que si la cible est endormie
	(Jet-Pierres	Type roche 3G	, 'physical',	50	65	15	null
	(Éboulement	Type roche 3G	, 'physical',	75	90	10	Peut apeurer la cible
	(Abîme	Type sol 3G	, 'physical',	- 	30	5	Met l'adversaire KO, échoue s'il a une vitesse
	(supérieure à celle du lanceur
	(Osmerang	Type sol 3G	, 'physical',	50	90	10	Attaque deux fois
	(Massd'Os	Type sol 3G	, 'physical',	65	85	10	Peut apeurer la cible
	(Séisme	Type sol 3G	, 'physical',	100	100	10	null
	(Tunnel	Type sol 3G	, 'physical',	100	100	10	Attaque en deux tours, le lanceur ne peut être atteint
	(que par Météores et Patience au premier tour
	(Onde Folie	Type spectre 3G	- 	- 	100	10	Rend la cible confuse
	(Ténèbres	Type spectre 3G	, 'physical',	- 	100	15	Inflige des dégâts égaux au niveau du lanceur
	(Léchouille	Type spectre 3G	, 'physical',	20	100	30	Peut paralyser la cible
	(Mimique	Type vol 3G	- 	- 	- 	20	Le lanceur utilise la dernière attaque lancée par l'adversaire
	(Cru-Aile	Type vol 3G	, 'physical',	35	100	35	null
	(Picpic	Type vol 3G	, 'physical',	35	100	35	null
	(Vol	Type vol 3G	, 'physical',	70	100	15	Attaque en deux tours, le lanceur ne peut être atteint
	(que par Météores et Patience au premier tour
	(Bec Vrille	Type vol 3G	, 'physical',	80	100	20	null
	(165, 'Piqué', 15, 'physical', 140, 90, 5, "Attaque en deux tours, n'agit pas au premier");


CREATE TABLE pokemon (
	id_pok int NOT NULL,
	nom_pok varchar(25) NOT NULL,
	id_type varchar(25) NOT NULL,
	PRIMARY KEY(id_pok),
	FOREIGN KEY(id_type) REFERENCES type(id_type)
);

-- Table evolueEn
-- Un pokémon peut évoluer en un autre pokémon à un certain niveau
-- lvl = -1 -> nécessite une pierre pour évoluer
-- lvl = -2 -> nécessite un échange pour évoluer
CREATE TABLE evolue_en (
	id_pok_base int NOT NULL,
	id_pok_evol int NOT NULL,
	lvl_evol_pok int NOT NULL,
	FOREIGN KEY(id_pok_base) REFERENCES pokemon(id_pok),
	FOREIGN KEY(id_pok_evol) REFERENCES pokemon(id_pok)
);

CREATE TABLE est_type (
	id_pok int NOT NULL,
	type_pok varchar(25) NOT NULL,
	FOREIGN KEY(id_pok) REFERENCES pokemon(id_pok)
);
	
-- Structure de la table dresseur
CREATE TABLE dresseur (
	id_dress int NOT NULL,
	nom_dress varchar(25) NOT NULL,
	PRIMARY KEY(id_dress)
);


-- Table détientPokémon
-- Un dresseur détient au maximum 6 pokémons
-- arenes https://www.pokebip.com/page__jeuxvideo__rbvj__champions_arene.html
-- ligue https://www.pokebip.com/page__jeuxvideo__rbvj__conseil4.html
CREATE TABLE detient_pokemon (
	id_dress int NOT NULL, 
	id_pok int NOT NULL,  
	lvl_pok int NOT NULL,
	FOREIGN KEY(id_dress) REFERENCES dresseur(id_dress),
	FOREIGN KEY(id_pok) REFERENCES pokemon(id_pok)
);

CREATE TABLE capacite (
	id_capa int NOT NULL, 
	nom_capa varchar(25) NOT NULL,
	type_capa enum('combat','vol','ouiseau','arbre') NOT NULL,
	classe,
	puis_capa int,
	prec_capa int,
	pp_capa int,
	eff_sec_capa varchar(255),
	PRIMARY KEY(id_capa)
);

CREATE TABLE possede_capacite (
	id_pok int NOT NULL, 
	id_capa varchar(25) NOT NULL,
	FOREIGN KEY(id_capa) REFERENCES capacite(id_capa),
	FOREIGN KEY(id_pok) REFERENCES pokemon(id_pok)
);


--
-- DATA
--

-- http://www.g33kmania.com/liste-pokemon-generation-1/


INSERT INTO pokemon (id_pok, nom_pok) VALUES
	(  1, 'Bulbizarre'),
	(  2, 'Herbizarre'),
	(  3, 'Florizarre'),
	(  4, 'Salameche'),
	(  5, 'Reptincel'),
	(  6, 'Dracaufeu'),
	(  7, 'Carapuce'),
	(  8, 'Carabaffe'),
	(  9, 'Tortank'),
	( 10, 'Chenipan'),
	( 11, 'Chrysacier'),
	( 12, 'Papilusion'),
	( 13, 'Aspicot'),
	( 14, 'Coconfort'),
	( 15, 'Dardargnan'),
	( 16, 'Roucool'),
	( 17, 'Roucoups'),
	( 18, 'Roucarnage'),
	( 19, 'Rattata'),
	( 20, 'Rattatac'),
	( 21, 'Piafabec'),
	( 22, 'Rapasdepic'),
	( 23, 'Abo'),
	( 24, 'Arbok'),
	( 25, 'Pikachu'),
	( 26, 'Raichu'),
	( 27, 'Sabelette'),
	( 28, 'Sablaireau'),
	-- ( 29, 'Nidoran♀'),
	( 29, 'NidoranF'),
	( 30, 'Nidorina'),
	( 31, 'Nidoqueen'),
	-- ( 32, 'Nidoran♂'),
	( 32, 'NidoranM'),
	( 33, 'Nidorino'),
	( 34, 'Nidoking'),
	( 35, 'Melofee'),
	( 36, 'Melodelfe'),
	( 37, 'Goupix'),
	( 38, 'Feunard'),
	( 39, 'Rondoudou'),
	( 40, 'Grodoudou'),
	( 41, 'Nosferapti'),
	( 42, 'Nosferalto'),
	( 43, 'Mystherbe'),
	( 44, 'Ortide'),
	( 45, 'Rafflesia'),
	( 46, 'Paras'),
	( 47, 'Parasect'),
	( 48, 'Mimitoss'),
	( 49, 'Aeromite'),
	( 50, 'Taupiqueur'),
	( 51, 'Triopikeur'),
	( 52, 'Miaouss'),
	( 53, 'Persian'),
	( 54, 'Psykokwak'),
	( 55, 'Akwakwak'),
	( 56, 'Ferosinge'),
	( 57, 'Colossinge'),
	( 58, 'Caninos'),
	( 59, 'Arcanin'),
	( 60, 'Ptitard'),
	( 61, 'Tetarte'),
	( 62, 'Tartard'),
	( 63, 'Abra'),
	( 64, 'Kadabra'),
	( 65, 'Alakazam'),
	( 66, 'Machoc'),
	( 67, 'Machopeur'),
	( 68, 'Mackogneur'),
	( 69, 'Chetiflor'),
	( 70, 'Boustiflor'),
	( 71, 'Empiflor'),
	( 72, 'Tentacool'),
	( 73, 'Tentacruel'),
	( 74, 'Racaillou'),
	( 75, 'Gravalanch'),
	( 76, 'Grolem'),
	( 77, 'Ponyta'),
	( 78, 'Galopa'),
	( 79, 'Ramoloss'),
	( 80, 'Flagadoss'),
	( 81, 'Magneti'),
	( 82, 'Magneton'),
	( 83, 'Canarticho'),
	( 84, 'Doduo'),
	( 85, 'Dodrio'),
	( 86, 'Otaria'),
	( 87, 'Lamantine'),
	( 88, 'Tadmorv'),
	( 89, 'Grotadmorv'),
	( 90, 'Kokiyas'),
	( 91, 'Crustabri'),
	( 92, 'Fantominus'),
	( 93, 'Spectrum'),
	( 94, 'Ectoplasma'),
	( 95, 'Onix'),
	( 96, 'Soporifik'),
	( 97, 'Hypnomade'),
	( 98, 'Krabby'),
	( 99, 'Krabboss'),
	(100, 'Voltorbe'),
	(101, 'Electrode'),
	(102, 'Noeunoeuf'),
	(103, 'Noadkoko'),
	(104, 'Osselait'),
	(105, 'Ossatueur'),
	(106, 'Kicklee'),
	(107, 'Tygnon'),
	(108, 'Excelangue'),
	(109, 'Smogo'),
	(110, 'Smogogo'),
	(111, 'Rhinocorne'),
	(112, 'Rhinoferos'),
	(113, 'Leveinard'),
	(114, 'Saquedeneu'),
	(115, 'Kangourex'),
	(116, 'Hypotrempe'),
	(117, 'Hypocean'),
	(118, 'Poissirene'),
	(119, 'Poissoroy'),
	(120, 'Stari'),
	(121, 'Staross'),
	(122, 'M. Mime'),
	(123, 'Insecateur'),
	(124, 'Lippoutou'),
	(125, 'Elektek'),
	(126, 'Magmar'),
	(127, 'Scarabrute'),
	(128, 'Tauros'),
	(129, 'Magicarpe'),
	(130, 'Leviator'),
	(131, 'Lokhlass'),
	(132, 'Metamorph'),
	(133, 'Evoli'),
	(134, 'Aquali'),
	(135, 'Voltali'),
	(136, 'Pyroli'),
	(137, 'Porygon'),
	(138, 'Amonita'),
	(139, 'Amonistar'),
	(140, 'Kabuto'),
	(141, 'Kabutops'),
	(142, 'Ptera'),
	(143, 'Ronflex'),
	(144, 'Artikodin'),
	(145, 'Electhor'),
	(146, 'Sulfura'),
	(147, 'Minidraco'),
	(148, 'Draco'),
	(149, 'Dracolosse'),
	(150, 'Mewtwo'),
	(151, 'Mew');

INSERT INTO est_type (id_pok, type_pok) VALUES
	(  1, 'Plante'),
	(  1, 'Poison'),
	(  2, 'Plante'),
	(  2, 'Poison'),
	(  3, 'Plante'),
	(  3, 'Poison'),
	(  4, 'Feu'),
	(  5, 'Feu'),
	(  6, 'Feu'),
	(  6, 'Vol'),
	(  7, 'Eau'),
	(  8, 'Eau'),
	(  9, 'Eau'),
	( 10, 'Insecte'),
	( 11, 'Insecte'),
	( 12, 'Insecte'),
	( 12, 'Vol'),
	( 13, 'Insecte'),
	( 13, 'Poison'),
	( 14, 'Insecte'),
	( 14, 'Poison'),
	( 15, 'Insecte'),
	( 15, 'Poison'),
	( 16, 'Normal'),
	( 16, 'Vol'),
	( 17, 'Normal'),
	( 17, 'Vol'),
	( 18, 'Normal'),
	( 18, 'Vol'),
	( 19, 'Normal'),
	( 20, 'Normal'),
	( 21, 'Normal'),
	( 21, 'Vol'),
	( 22, 'Normal'),
	( 22, 'Vol'),
	( 23, 'Poison'),
	( 24, 'Poison'),
	( 25, 'Electrique'),
	( 26, 'Electrique'),
	( 27, 'Sol'),
	( 28, 'Sol'),
	( 29, 'Poison'),
	( 30, 'Poison'),
	( 31, 'Poison'),
	( 31, 'Sol'),
	( 32, 'Poison'),
	( 33, 'Poison'),
	( 34, 'Poison'),
	( 34, 'Sol'),
	( 35, 'Normal'),
	( 36, 'Normal'),
	( 37, 'Feu'),
	( 38, 'Feu'),
	( 39, 'Normal'),
	( 40, 'Normal'),
	( 41, 'Poison'),
	( 41, 'Vol'),
	( 42, 'Poison'),
	( 42, 'Vol'),
	( 43, 'Plante'),
	( 43, 'Poison'),
	( 44, 'Plante'),
	( 44, 'Poison'),
	( 45, 'Plante'),
	( 45, 'Poison'),
	( 46, 'Insecte'),
	( 46, 'Plante'),
	( 47, 'Insecte'),
	( 47, 'Plante'),
	( 48, 'Insecte'),
	( 48, 'Poison'),
	( 49, 'Insecte'),
	( 49, 'Poison'),
	( 50, 'Sol'),
	( 51, 'Sol'),
	( 52, 'Normal'),
	( 53, 'Normal'),
	( 54, 'Eau'),
	( 55, 'Eau'),
	( 56, 'Combat'),
	( 57, 'Combat'),
	( 58, 'Feu'),
	( 59, 'Feu'),
	( 60, 'Eau'),
	( 61, 'Eau'),
	( 62, 'Eau'),
	( 62, 'Combat'),
	( 63, 'Psy'),
	( 64, 'Psy'),
	( 65, 'Psy'),
	( 66, 'Combat'),
	( 67, 'Combat'),
	( 68, 'Combat'),
	( 69, 'Plante'),
	( 69, 'Poison'),
	( 70, 'Plante'),
	( 70, 'Poison'),
	( 71, 'Plante'),
	( 71, 'Poison'),
	( 72, 'Eau'),
	( 72, 'Poison'),
	( 73, 'Eau'),
	( 73, 'Poison'),
	( 74, 'Roche'),
	( 74, 'Sol'),
	( 75, 'Roche'),
	( 75, 'Sol'),
	( 76, 'Roche'),
	( 76, 'Sol'),
	( 77, 'Feu'),
	( 78, 'Feu'),
	( 79, 'Eau'),
	( 79, 'Psy'),
	( 80, 'Eau'),
	( 80, 'Psy'),
	( 81, 'Electrique'),
	( 82, 'Electrique'),
	( 83, 'Normal'),
	( 83, 'Vol'),
	( 84, 'Normal'),
	( 84, 'Vol'),
	( 85, 'Normal'),
	( 85, 'Vol'),
	( 86, 'Eau'),
	( 87, 'Eau'),
	( 87, 'Glace'),
	( 88, 'Poison'),
	( 89, 'Poison'),
	( 90, 'Eau'),
	( 91, 'Eau'),
	( 91, 'Glace'),
	( 92, 'Spectre'),
	( 92, 'Poison'),
	( 93, 'Spectre'),
	( 93, 'Poison'),
	( 94, 'Spectre'),
	( 94, 'Poison'),
	( 95, 'Roche'),
	( 95, 'Sol'),
	( 96, 'Psy'),
	( 97, 'Psy'),
	( 98, 'Eau'),
	( 99, 'Eau'),
	(100, 'Electrique'),
	(101, 'Electrique'),
	(102, 'Plante'),
	(102, 'Psy'),
	(103, 'Plante'),
	(103, 'Psy'),
	(104, 'Sol'),
	(105, 'Sol'),
	(106, 'Combat'),
	(107, 'Combat'),
	(108, 'Normal'),
	(109, 'Poison'),
	(110, 'Poison'),
	(111, 'Sol'),
	(111, 'Roche'),
	(112, 'Sol'),
	(112, 'Roche'),
	(113, 'Normal'),
	(114, 'Plante'),
	(115, 'Normal'),
	(116, 'Eau'),
	(117, 'Eau'),
	(118, 'Eau'),
	(119, 'Eau'),
	(120, 'Eau'),
	(121, 'Eau'),
	(121, 'Psy'),
	(122, 'Psy'),
	(123, 'Insecte'),
	(123, 'Vol'),
	(124, 'Glace'),
	(124, 'Psy'),
	(125, 'Electrique'),
	(126, 'Feu'),
	(127, 'Insecte'),
	(128, 'Normal'),
	(129, 'Eau'),
	(130, 'Eau'),
	(130, 'Vol'),
	(131, 'Eau'),
	(131, 'Glace'),
	(132, 'Normal'),
	(133, 'Normal'),
	(134, 'Eau'),
	(135, 'Electrique'),
	(136, 'Feu'),
	(137, 'Normal'),
	(138, 'Roche'),
	(138, 'Eau'),
	(139, 'Roche'),
	(139, 'Eau'),
	(140, 'Roche'),
	(140, 'Eau'),
	(141, 'Roche'),
	(141, 'Eau'),
	(142, 'Roche'),
	(142, 'Vol'),
	(143, 'Normal'),
	(144, 'Glace'),
	(144, 'Vol'),
	(145, 'Electrique'),
	(145, 'Vol'),
	(146, 'Feu'),
	(146, 'Vol'),
	(147, 'Dragon'),
	(148, 'Dragon'),
	(149, 'Dragon'),
	(149, 'Vol'),
	(150, 'Psy'),
	(151, 'Psy');


INSERT INTO dresseur (id_dress, nom_dress) VALUES 
	(2, 'Pierre'),
	(3, 'Ondine'),
	(4, 'Major Bob'),
	(5, 'Erika'),
	(6, 'Koga'),
	(7, 'Morgane'),
	(8, 'Auguste'),
	(9, 'Giovanni'),
	(10, 'Olga'),
	(11, 'Aldo'),
	(12, 'Agatha'),
	(13, 'Peter');

INSERT INTO detientPokemon (id_dress, id_pok, lvl_pok) VALUES
	-- Pierre: Raccaillou 12, Onix 14 
	(2, 74, 12),
	(2, 95, 14),
	-- Ondine: Stari 18, Staross 21
	(3, 120, 18),
	(3, 121, 21),
	-- Major Bob: Voltorbe 21, Pikachu 18, Raichu 24
	(4, 100, 21),
	(4, 25, 18),
	(4, 26, 24),
	-- Erika: Empiflor 29, Saquedeneu 24, Rafflesia 29
	(5, 71, 29),
	(5, 114, 24),
	(5, 45, 29),
	-- Koga: Smogo 37, Grotadmorv 39, Smogo 37, Smogogo 43
	(6, 109, 37),
	(6, 89, 39),
	(6, 109, 37),
	(6, 110, 43),
	-- Morgane: Kadabra 38, M.  Mime 37, Aeromite 38, Alakazam 43
	(7, 64, 38),
	(7, 122, 37),
	(7, 49, 38),
	(7, 65, 43),
	-- Auguste: Caninos 42, Ponyta 40, Galopa 42, Arcanin 47
	(8, 58, 42),
	(8, 77, 40),
	(8, 78, 42),
	(8, 59, 47),
	-- Giovanni: Rhinocorne 45, Triopikeur 42, Nidoqueen 44, Nodiking 45, Rhinoferos 50
	(9, 111, 42),
	(9, 51, 42),
	(9, 31, 44),
	(9, 34, 45),
	(9, 112, 50),
	-- Olga: Lamantine 54, Crustabri 53, Flagadoss 54, Lippoutou 56, Lokhlass 56
	(10, 87, 54),
	(10, 91, 53),
	(10, 80, 54),
	(10, 124, 56),
	(10, 131, 56),
	-- Aldo: Onix 53, Tygnon 55, Kicklee 55, Onix 56, Mackogneur 58
	(11, 95, 53),
	(11, 107, 55),
	(11, 106, 55),
	(11, 95, 56),
	(11, 68, 58),
	-- Agatha: Ectoplasma 56, Nosferalto 56, Spectrum 55, Arbok 58, Ectoplasma 60
	(12, 94, 56),
	(12, 42, 56),
	(12, 93, 55),
	(12, 24, 58),
	(12, 94, 60),
	-- Peter: Leviator 58, Draco 56,  Draco 56, Ptera 60, Dracolosse 62
	(13, 130, 58),
	(13, 148, 56),
	(13, 148, 56),
	(13, 142, 60),
	(13, 149, 62);


-- evolutions
INSERT INTO evolue_en (id_pok_base, id_pok_evol, lvl_evol_pok) VALUES
-- http://www.pokepedia.fr/Liste_des_Pok%C3%A9mon_par_famille_d%27%C3%A9volution
	(  1,   2, 16),
	(  2,   3, 32),
	(  4,   5, 16),
	(  5,   6, 36),
	(  7,   8, 16),
	(  8,   9, 36),
	( 10,  11, 7 ),
	( 11,  12, 10),
	( 13,  14, 7 ),
	( 14,  15, 10),
	( 16,  17, 18),
	( 17,  18, 36),
	( 19,  20, 20),
	( 21,  22, 20),
	( 23,  24, 22),
	( 25,  26, -1),
	( 27,  28, 22),
	( 29,  30, 16),
	( 30,  31, -1),
	( 32,  33, 16),
	( 33,  34, -1),
	( 35,  36, -1),
	( 37,  38, -1),
	( 39,  40, -1),
	( 41,  42, 22),
	( 43,  44, 21),
	( 44,  45, -1),
	( 46,  47, 24),
	( 48,  49, 31),
	( 50,  51, 26),
	( 52,  53, 28),
	( 54,  55, 33),
	( 56,  57, 28),
	( 58,  59, -1),
	( 60,  61, 25),
	( 61,  62, -1),
	( 63,  64, 16),
	( 64,  65, -2),
	( 66,  67, 28),
	( 67,  68, -2),
	( 69,  70, 21),
	( 70,  71, -1),
	( 72,  73, 30),
	( 74,  75, 25),
	( 75,  76, -2),
	( 77,  78, 40),
	( 79,  80, 37),
	( 81,  82, 30),
	( 84,  85, 31),
	( 86,  87, 34),
	( 88,  89, 38),
	( 90,  91, -1),
	( 92,  93, 25),
	( 93,  94, -2),
	( 96,  97, 26),
	( 98,  99, 28),
	(100, 101, 30),
	(102, 103, -1),
	(104, 105, 28),
	(109, 110, 35),
	(111, 112, 42),
	(116, 117, 32),
	(118, 119, 33),
	(120, 121, -1),
	(129, 130, 20),
	(133, 134, -1),
	(133, 135, -1),
	(133, 136, -1),
	(138, 139, 40),
	(140, 141, 40),
	(147, 148, 30),
	(148, 149, 55);




-- Gestion de la carte du monde
-- Tous les élements de la carte sont regroupés dans une table afin qu'ils aient un id unique
-- Les élements de la map sont: des villes, des sites et des routes
-- Les routes ont l'id de leur numéro
-- CREATE TABLE mapElement (
-- 	'id_elem' SERIAL NOT NULL PRIMARY KEY
-- );
-- 
-- CREATE TABLE ville (
-- 	'id_ville' int NOT NULL, -- FK mapElement(id_elem)
-- 	'nom_ville' varchar(25) 
-- );
-- 
-- CREATE TABLE site (
-- 	'id_site' int NOT NULL, -- FK mapElement(id_elem)
-- 	'nom_site' varchar(25)
-- );
-- 
-- CREATE TABLE route (
-- 	'id_route' int NOT NULL, -- FK mapElement(id_elem)
-- 	'type_route' varchar(20) NOT NULL -- maritime ou terrestre
-- );
-- 
-- -- id_elem peut représenter une route ou un site:
-- --   Une route relie deux elements de la carte
-- --   Un site a une entrée et une sortie qui sont des éléments de map
-- CREATE TABLE liensMap (
-- 	'id_elem' int NOT NULL, -- FK route(id_route)
-- 	'id_elem_in' int NOT NULL, -- FK mapElement(id_elem)
-- 	'id_elem_out' int NOT NULL -- FK mapElement(id_elem)
-- );
