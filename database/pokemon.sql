DROP TABLE IF EXISTS member, trainer, pokemon, pokedex, type, capacity, pokedex_type, capacity_type, pokemon_capacity, pokedex_capacity, pokedex_evolution;

CREATE TABLE member (
  id int(11) NOT NULL AUTO_INCREMENT,
  pseudo varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password text NOT NULL,
  email_validation_key text NOT NULL,
  active tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

CREATE TABLE trainer (
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar(25) NOT NULL,
	id_member int(11) NOT NULL,
	credit int(11) NOT NULL DEFAULT 500,
	PRIMARY KEY (id),
	FOREIGN KEY (id_member) REFERENCES member(id)
);

CREATE TABLE pokemon (
	id int(11) NOT NULL, 
	level int(11) NOT NULL,
	xp int(11) NOT NULL,
	id_trainer int(11), NOT NULL,
	id_pokedex int(11) NOT NULL,
	PRIMARY KEY (id), 
	FOREIGN KEY id_trainer REFERENCES trainer(id),
	FOREIGN KEY id_pokedex REFERENCES pokedex(id)
);

CREATE TABLE pokedex (
	id int NOT NULL,
	name varchar(25) NOT NULL,
	hp int NOT NULL, 
	attack int NOT NULL, 
	defense int NOT NULL,
	sp_attack int NOT NULL,
	sp_defense int NOT NULL,
	speed int NOT NULL,
	description varchar(255) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE type (
	id int(11) NOT NULL,
	name varchar(10),
	PRIMARY KEY(id)
);

CREATE TABLE capacity (
	id int NOT NULL,
	name varchar(25) NOT NULL,
	id_type int(11) NOT NULL,
	class enum('physical', 'special'),
	puis int,
	prec int,
	pp int NOT NULL,
	eff_sec_ varchar(255),
	PRIMARY KEY(id),
	FOREIGN KEY id_type REFERENCES type(id)
);

CREATE TABLE pokedex_type (
	id_pokedex int(11) NOT NULL,
	id_type int(11) NOT NULL,
	PRIMARY KEY (id_pokedex, id_type),
	FOREIGN KEY (id_pokedex) REFERENCES pokedex(id),
	FOREIGN KEY (id_type) REFERENCES type(id)		
);

CREATE TABLE pokemon_capacity (
	id_pokemon int(11) NOT NULL,
	id_capacity int(11) NOT NULL,
	PRIMARY KEY (id_pokemon, id_capacity),
	FOREIGN KEY (id_pokemon) REFERENCES pokemon(id),
	FOREIGN KEY (id_capacity) REFERENCES capacity(id)	
);

CREATE TABLE pokedex_capacity (
	id_pokedex int(11) NOT NULL,
	id_capacity int(11) NOT NULL,
	level int(11) NOT NULL,
	PRIMARY KEY (id_pokedex, id_capacity),
	FOREIGN KEY (id_pokedex) REFERENCES pokedex(id),
	FOREIGN KEY (id_capacity) REFERENCES capacity(id)	
);

CREATE TABLE pokedex_evolution (
	id_from int(11) NOT NULL,
	id_to int(11) NOT NULL,
	level int(11) NOT NULL,
	PRIMARY KEY (id_from, id_to),
	FOREIGN KEY (id_from) REFERENCES pokedex(id),
	FOREIGN KEY (id_to) REFERENCES pokedex(id)
);

--
-- DATA
--

INSERT INTO pokedex (id, name, hp, attack, defense, sp_attack, sp_defense, speed, description) VALUES
	(1, 'Bulbizarre', 45, 49, 49, 65, 65, 45, ""),
	(2, 'Herbizarre', 60, 62, 63, 80, 80, 60, ""),
	(3, 'Florizarre', 80, 82, 83, 100, 100, 80, ""),
	(4, 'Salameche', 39, 52, 43, 60, 50, 65, ""),
	(5, 'Reptincel', 58, 64, 58, 80, 65, 80, ""),
	(6, 'Dracaufeu', 78, 84, 78, 109, 85, 100, ""),
	(7, 'Carapuce', 44, 48, 65, 50, 64, 43, ""),
	(8, 'Carabaffe', 59, 63, 80, 65, 80, 58, ""),
	(9, 'Tortank', 79, 83, 100, 85, 105, 78, ""),
	/*(10, 'Chenipan'),
	(11, 'Chrysacier'),
	(12, 'Papilusion'),
	(13, 'Aspicot'),
	(14, 'Coconfort'),
	(15, 'Dardargnan'),
	(16, 'Roucool'),
	(17, 'Roucoups'),
	(18, 'Roucarnage'),
	(19, 'Rattata'),
	(20, 'Rattatac'),
	(21, 'Piafabec'),
	(22, 'Rapasdepic'),
	(23, 'Abo'),
	(24, 'Arbok'),
	(25, 'Pikachu'),
	(26, 'Raichu'),
	(27, 'Sabelette'),
	(28, 'Sablaireau'),
	-- ( 29, 'Nidoran♀'),
	(29, 'NidoranF'),
	(30, 'Nidorina'),
	(31, 'Nidoqueen'),
	-- ( 32, 'Nidoran♂'),
	(32, 'NidoranM'),
	(33, 'Nidorino'),
	(34, 'Nidoking'),
	(35, 'Melofee'),
	(36, 'Melodelfe'),
	(37, 'Goupix'),
	(38, 'Feunard'),
	(39, 'Rondoudou'),
	(40, 'Grodoudou'),
	(41, 'Nosferapti'),
	(42, 'Nosferalto'),
	(43, 'Mystherbe'),
	(44, 'Ortide'),
	(45, 'Rafflesia'),
	(46, 'Paras'),
	(47, 'Parasect'),
	(48, 'Mimitoss'),
	(49, 'Aeromite'),
	(50, 'Taupiqueur'),
	(51, 'Triopikeur'),
	(52, 'Miaouss'),
	(53, 'Persian'),
	(54, 'Psykokwak'),
	(55, 'Akwakwak'),
	(56, 'Ferosinge'),
	(57, 'Colossinge'),
	(58, 'Caninos'),
	(59, 'Arcanin'),
	(60, 'Ptitard'),
	(61, 'Tetarte'),
	(62, 'Tartard'),
	(63, 'Abra'),
	(64, 'Kadabra'),
	(65, 'Alakazam'),
	(66, 'Machoc'),
	(67, 'Machopeur'),
	(68, 'Mackogneur'),
	(69, 'Chetiflor'),
	(70, 'Boustiflor'),
	(71, 'Empiflor'),
	(72, 'Tentacool'),
	(73, 'Tentacruel'),
	(74, 'Racaillou'),
	(75, 'Gravalanch'),
	(76, 'Grolem'),
	(77, 'Ponyta'),
	(78, 'Galopa'),
	(79, 'Ramoloss'),
	(80, 'Flagadoss'),
	(81, 'Magneti'),
	(82, 'Magneton'),
	(83, 'Canarticho'),
	(84, 'Doduo'),
	(85, 'Dodrio'),
	(86, 'Otaria'),
	(87, 'Lamantine'),
	(88, 'Tadmorv'),
	(89, 'Grotadmorv'),
	(90, 'Kokiyas'),
	(91, 'Crustabri'),
	(92, 'Fantominus'),
	(93, 'Spectrum'),
	(94, 'Ectoplasma'),
	(95, 'Onix'),
	(96, 'Soporifik'),
	(97, 'Hypnomade'),
	(98, 'Krabby'),
	(99, 'Krabboss'),
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
	(151, 'Mew')*/;

INSERT INTO type(id, name) VALUES
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

INSERT INTO capacity(id, name, type, class, puis, prec, pp, eff_sec) VALUES 
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
	(117, "Para-Spore", 9, null, null, 75, 30, "Paralyse la cible"),
	(118, "Poudre Dodo", 9, null, null, 75, 15, "Endort la cible"), 
	(119, "Spore", 9, null, null, 100, 15, "Endort la cible"), 
	(120, "Vampigraine", 9,	null, null, 90, 10, "Draîne à chaque tour des PV de la cible vers le lanceur"), 
	(121, "Vol-Vie", 9,	'special', 20, 100, 20, "Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible"), 
	(122, "Fouet Lianes", 9, 'special', 35, 100, 10, null),
	(123, "Méga-Sangsue", 9, 'special', 40, 100, 10, "Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible"), 
	(124, "Tranch'Herbe", 9, 'special', 55, 95, 25, "Taux de Coups Critiques élevé"), 
	(125, "Danse-Fleur", 9, 'special', 70, 100, 20, "Attaque continue sur deux ou trois tour, le lanceur devient confus par la suite"),
	(126, "Lance-Soleil", 9, 'special', 120, 100, 10, "Attaque en deux tours, n'agit pas au premier"),
	(127, "Acidarmure", 10, null, null, null, 40, "Augmente la défense du lanceur de deux niveaux"), 
	(128, "Gaz Toxik", 10, null, null, 55, 40, "Empoisonne la cible"), 
	(129, "Poudre Toxik", 10, null, null, 75, 35, "Empoisonne la cible"), 
	(130, "Toxik", 10, null, null, 85, 10, "Empoisonne gravement la cible"), 
	(131, "Dard-Venin", 10, 'physical', 15, 100, 35, "Peut empoisonner la cible"), 
	(132, "Purédpois", 10, 'physical', 20, 70, 20, "Peut empoisonner la cible"), 
	(133, "Acide", 10, 'physical', 40, 100, 30, "Peut baisser la défense de la cible"), 
	(134, "Détritus",	10, 'physical', 65, 100, 20, "Peut empoisonner la cible"), 
	(135, "Amnésie", 11, null, null, null, 20, "Augmente le spécial du lanceur de deux niveaux"), 
	(136, "Bouclier", 11, null, null, null, 30, "Augmente la défense du lanceur de deux niveaux"), 
	(137, "Hâte	Type", 11, null, null, null, 30, "Augmente la vitesse du lanceur de deux niveaux"), 
	(138, "Hypnose", 11, null, null, 60, 20, "Endort la cible"), 
	(139, "Mur Lumière", 11, null null, null, 30, "Augmente la résistance du lanceur aux attaques , 'special',s"),
	(140, "Protection", 11, null, null, null, 20, "Augmente la résistance du lanceur aux attaques , 'physical',s"),
	(141, "Repos", 11, null, null, null, 10, "Restaure tous les PV du lanceur ainsi que son statut, le lanceur est immobilisé pendant deux tours"), 
	(142, "Télékinésie", 11, null, null, 80, 15, "Baisse la précision de la cible"), 
	(143, "Téléport", 11, null, null, null, 20, "Met fin au combat contre un Pokémon sauvage,échoue contre un dresseur"), 
	(144, "Yoga", 11, null, null, null, 40, "Augmente l'attaque du lanceur"), 
	(145, "Vague", 11, 'special', null, 80, 15, "Inflige des dégâts variables"), 
	(146, "Choc Mental", 11, 'special',	50, 100, 25, "Peut rendre la cible confuse"), 
	(147, "Rafale Psy", 11, 'special', 65, 100, 20, "Peut rendre la cible confuse"), 
	(148, "Psyko", 11, 'special', 90, 100, 10, "Peut baisser le spécial de la cible"), 
	(149, "Dévorêve", 11, 'special', 100, 100, 15, "Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible, ne fonctionne que si la cible est endormie"), 
	(150, "Jet-Pierres", 12, 'physical', 50, 65, 15, null), 
	(151, "Éboulement", 12, 'physical',	75, 90, 10, "Peut apeurer la cible"), 
	(152, "Abîme", 13, 'physical', null, 30, 5, "Met l'adversaire KO, échoue s'il a une vitesse supérieure à celle du lanceur"), 
	(153, "Osmerang", 13, 'physical', 50, 90, 10, "Attaque deux fois"), 
	(154, "Massd'Os", 13, 'physical', 65, 85, 10, "Peut apeurer la cible"), 
	(155, "Séisme", 13, 'physical', 100, 100, 10, null), 
	(156, "Tunnel", 13, 'physical', 100, 100, 10, "Attaque en deux tours, le lanceur ne peut être atteint que par Météores et Patience au premier tour"), 
	(157, "Onde Folie", 14, null, null, 100, 10, "Rend la cible confuse"), 
	(158, "Ténèbres", 14, 'physical', null, 100, 15, "Inflige des dégâts égaux au niveau du lanceur"), 
	(159, "Léchouille", 14, 'physical', 20, 100, 30, "Peut paralyser la cible"), 
	(160, "Mimique", 15, null, null, null, 20, "Le lanceur utilise la dernière attaque lancée par l'adversaire"), 
	(161, "Cru-Aile", 15, 'physical', 35, 100, 35, null), 
	(162, "Picpic", 15, 'physical', 35, 100, 35, null), 
	(163, "Vol", 15, 'physical', 70, 100, 15, "Attaque en deux tours, le lanceur ne peut être atteint que par Météores et Patience au premier tour"), 
	(164, "Bec Vrille", 15, 'physical',	80, 100, 20, null), 
	(165, 'Piqué', 15, 'physical', 140, 90, 5, "Attaque en deux tours, n'agit pas au premier");

INSERT INTO pokedex_type(id_pokedex, id_type) VALUES
	(  1, 9),
	(  1, 10),
	(  2, 9),
	(  2, 10),
	(  3, 9),
	(  3, 10),
	(  4, 5),
	(  5, 5),
	(  6, 5),
	(  6, 15),
	(  7, 3),
	(  8, 3),
	(  9, 3),
	( 10, 7),
	( 11, 7),
	( 12, 7),
	( 12, 15),
	( 13, 7),
	( 13, 10),
	( 14, 7),
	( 14, 10),
	( 15, 7),
	( 15, 10),
	( 16, 8),
	( 16, 15),
	( 17, 8),
	( 17, 15),
	( 18, 8),
	( 18, 15),
	( 19, 8),
	( 20, 8),
	( 21, 8),
	( 21, 15),
	( 22, 8),
	( 22, 15),
	( 23, 10),
	( 24, 10),
	( 25, 4),
	( 26, 4),
	( 27, 13),
	( 28, 13),
	( 29, 10),
	( 30, 10),
	( 31, 10),
	( 31, 13),
	( 32, 10),
	( 33, 10),
	( 34, 10),
	( 34, 13),
	( 35, 8),
	( 36, 8),
	( 37, 5),
	( 38, 5),
	( 39, 8),
	( 40, 8),
	( 41, 10),
	( 41, 15),
	( 42, 10),
	( 42, 15),
	( 43, 9),
	( 43, 10),
	( 44, 9),
	( 44, 10),
	( 45, 9),
	( 45, 10),
	( 46, 7),
	( 46, 9),
	( 47, 7),
	( 47, 9),
	( 48, 7),
	( 48, 10),
	( 49, 7),
	( 49, 10),
	( 50, 13),
	( 51, 13),
	( 52, 8),
	( 53, 8),
	( 54, 3),
	( 55, 3),
	( 56, 1),
	( 57, 1),
	( 58, 5),
	( 59, 5),
	( 60, 3),
	( 61, 3),
	( 62, 3),
	( 62, 1),
	( 63, 11),
	( 64, 11),
	( 65, 11),
	( 66, 1),
	( 67, 1),
	( 68, 1),
	( 69, 9),
	( 69, 10),
	( 70, 9),
	( 70, 10),
	( 71, 9),
	( 71, 10),
	( 72, 3),
	( 72, 10),
	( 73, 3),
	( 73, 10),
	( 74, 12),
	( 74, 13),
	( 75, 12),
	( 75, 13),
	( 76, 12),
	( 76, 13),
	( 77, 5),
	( 78, 5),
	( 79, 3),
	( 79, 11),
	( 80, 3),
	( 80, 11),
	( 81, 4),
	( 82, 4),
	( 83, 8),
	( 83, 15),
	( 84, 8),
	( 84, 15),
	( 85, 8),
	( 85, 15),
	( 86, 3),
	( 87, 3),
	( 87, 6),
	( 88, 10),
	( 89, 10),
	( 90, 3),
	( 91, 3),
	( 91, 6),
	( 92, 14),
	( 92, 10),
	( 93, 14),
	( 93, 10),
	( 94, 14),
	( 94, 10),
	( 95, 12),
	( 95, 13),
	( 96, 11),
	( 97, 11),
	( 98, 3),
	( 99, 3),
	(100, 4),
	(101, 4),
	(102, 9),
	(102, 11),
	(103, 9),
	(103, 11),
	(104, 13),
	(105, 13),
	(106, 1),
	(107, 1),
	(108, 8),
	(109, 10),
	(110, 10),
	(111, 13),
	(111, 12),
	(112, 13),
	(112, 12),
	(113, 8),
	(114, 9),
	(115, 8),
	(116, 3),
	(117, 3),
	(118, 3),
	(119, 3),
	(120, 3),
	(121, 3),
	(121, 11),
	(122, 11),
	(123, 7),
	(123, 15),
	(124, 6),
	(124, 11),
	(125, 4),
	(126, 5),
	(127, 7),
	(128, 8),
	(129, 3),
	(130, 3),
	(130, 15),
	(131, 3),
	(131, 6),
	(132, 8),
	(133, 8),
	(134, 3),
	(135, 4),
	(136, 5),
	(137, 8),
	(138, 12),
	(138, 3),
	(139, 12),
	(139, 3),
	(140, 12),
	(140, 3),
	(141, 12),
	(141, 3),
	(142, 12),
	(142, 15),
	(143, 8),
	(144, 6),
	(144, 15),
	(145, 4),
	(145, 15),
	(146, 5),
	(146, 15),
	(147, 2),
	(148, 2),
	(149, 2),
	(149, 15),
	(150, 11),
	(151, 11);

INSERT INTO pokedex_capacity(id_capacity, id_pokedex, level) VALUES
	(1, 107, 53), #riposte
	(1, 4, -1),
	(1, 8, -1),
	(1, 35, -1),
	(1, 54, -1),
	(1, 61, -1),
	(1, 65, -1),
	(1, 74, -1),
	(1, 94, -1),
	(1, 105, -1),
	(1, 112, -1),
	(1, 124, -1),
	(1, 150, -1),
	(1, 5, -1),
	(1, 9, -1),
	(1, 36, -1),
	(1, 55, -1),
	(1, 62, -1),
	(1, 66, -1),
	(1, 75, -1),
	(1, 96, -1),
	(1, 106, -1),
	(1, 113, -1),
	(1, 125, -1),
	(1, 151, -1),
	(1, 6, -1),
	(1, 31, -1),
	(1, 39, -1),
	(1, 56, -1),
	(1, 63, -1),
	(1, 67, -1),
	(1, 76, -1),
	(1, 97, -1),
	(1, 107, -1),
	(1, 115, -1),
	(1, 126, -1),
	(1, 7, -1),
	(1, 34, -1),
	(1, 40, -1),
	(1, 57, -1),
	(1, 64, -1),
	(1, 68, -1),
	(1, 80, -1),
	(1, 104, -1),
	(1, 108, -1),
	(1, 122, -1),
	(1, 143, -1),
	(2, 56, 33), #frappe atlas
	(2, 57, 37), 
	(2, 66, 39), 
	(2, 67, 44), 
	(2, 68, 44), 
	(2, 127, 25), 
	(2, 4, -1),  
	(2, 8, -1),  
	(2, 27, -1),  
	(2, 35, -1),  
	(2, 54, -1),  
	(2, 61, -1),  
	(2, 65, -1),  
	(2, 74, -1),  
	(2, 94, -1),  
	(2, 105, -1),  
	(2, 112, -1),  
	(2, 124, -1),  
	(2, 139, -1),  
	(2, 150, -1),  
	(2, 5, -1),  
	(2, 9, -1),  
	(2, 28, -1),  
	(2, 36, -1),  
	(2, 55, -1), 
	(2, 62, -1),   
	(2, 66, -1),   
	(2, 75, -1),   
	(2, 96, -1),   
	(2, 106, -1),   
	(2, 113, -1), 
	(2, 125, -1),   
	(2, 140, -1),   
	(2, 151, -1),   
	(2, 6, -1),   
	(2, 25, -1), 
	(2, 31, -1),   
	(2, 39, -1),   
	(2, 56, -1),   
	(2, 63, -1),   
	(2, 67, -1),   
	(2, 76, -1),   
	(2, 97, -1),   
	(2, 107, -1),   
	(2, 115, -1),   
	(2, 126, -1),   
	(2, 141, -1), 
	(2, 7, -1),   
	(2, 26, -1),   
	(2, 34, -1),   
	(2, 40, -1),   
	(2, 57, -1),   
	(2, 64, -1),   
	(2, 68, -1),   
	(2, 80, -1),   
	(2, 104, -1),   
	(2, 108, -1),   
	(2, 122, -1),   
	(2, 127, -1),   
	(2, 143, -1),         
	(3, 29, 12), #double pied
	(3, 30, 12), 
	(3, 31, 12), 
	(3, 32, 12), 
	(3, 33, 12), 
	(3, 34, 12),
	(3, 106, 1),
	(3, 135, 30), 
	(4, 56, 9), #balayage
	(4, 57, 9),
	(4, 66, 20),
	(4, 67, 20),
	(4, 68, 20),
	(5, 106, 33), #mawashi geri
	(6,)

INSERT INTO pokedex_evolution (id_from, id_to, level) VALUES
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
