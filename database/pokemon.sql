-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 15 avr. 2019 à 12:49
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pokemon`
--

-- --------------------------------------------------------

--
-- Structure de la table `capacity`
--

DROP TABLE IF EXISTS `capacity`;
CREATE TABLE IF NOT EXISTS `capacity` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `id_type` int(11) NOT NULL,
  `class` enum('physical','special') DEFAULT NULL,
  `puis` int(11) DEFAULT NULL,
  `prec` int(11) DEFAULT NULL,
  `pp` int(11) NOT NULL,
  `eff_sec` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `capacity`
--

INSERT INTO `capacity` (`id`, `name`, `id_type`, `class`, `puis`, `prec`, `pp`, `eff_sec`) VALUES
(1, 'Riposte', 1, 'physical', NULL, 100, 20, 'Inflige le double des dégâts subis par une attaque de type Normal ou Combat durant le tour, échoue sinon'),
(2, 'Frappe Atlas', 1, 'physical', NULL, 100, 20, 'Inflige des dégâts égaux au niveau du lanceur'),
(3, 'Double Pied', 1, 'physical', 30, 100, 30, 'Frappe deux fois'),
(4, 'Balayage', 1, 'physical', 50, 100, 20, 'Peut apeurer la cible - Taux de Coups Critiques élevé'),
(5, 'Mawashi Geri', 1, 'physical', 60, 85, 15, 'Peut apeurer la cible'),
(6, 'Pied Sauté', 1, 'physical', 70, 95, 25, 'Enlève 1 PV si l\'attaque échoue'),
(7, 'Sacrifice', 1, 'physical', 80, 80, 25, 'Blesse le lanceur'),
(8, 'Pied Voltige', 1, 'physical', 85, 90, 20, 'Enlève 1 PV si l\'attaque échoue'),
(9, 'Draco-Rage', 2, 'special', NULL, 100, 10, 'Inflige toujours 40 PV de dégâts'),
(10, 'Repli', 3, NULL, NULL, 100, 40, 'Augmente la défense du lanceur'),
(11, 'Écume', 3, 'special', 20, 100, 30, 'Peut baisser la vitesse de la cible'),
(12, 'Claquoir', 3, 'special', 35, 75, 10, 'Attaque continue sur deux à cinq tours'),
(13, 'Pistolet à O', 3, 'special', 40, 100, 25, NULL),
(14, 'Bulles d\'O', 3, 'special', 65, 100, 20, 'Peut baisser la vitesse de la cible'),
(15, 'Cascade', 3, 'special', 80, 100, 15, NULL),
(16, 'Pince-Masse', 3, 'special', 90, 85, 10, 'Taux de Coups Critiques élevé'),
(17, 'Surf', 3, 'special', 95, 100, 15, NULL),
(18, 'Hydrocanon', 3, 'special', 120, 80, 5, NULL),
(19, 'Cage-Éclair', 4, NULL, NULL, 100, 20, 'Paralyse la cible'),
(20, 'Éclair', 4, 'special', 40, 100, 30, 'Peut paralyser la cible'),
(21, 'Poing-Éclair', 4, 'special', 75, 100, 15, 'Peut paralyser la cible'),
(22, 'Tonnerre', 4, 'special', 95, 100, 15, 'Peut paralyser la cible'),
(23, 'Fatal-Foudre', 4, 'special', 120, 70, 5, 'Peut paralyser la cible'),
(24, 'DanseFlamme', 5, 'special', 15, 70, 15, 'Attaque continue sur deux à cinq tours'),
(25, 'Flammèche', 5, 'special', 40, 100, 25, 'Peut brûler la cible'),
(26, 'Poing de Feu', 5, 'special', 75, 100, 15, 'Peut brûler la cible'),
(27, 'Lance-Flamme', 5, 'special', 95, 100, 15, 'Peut brûler la cible'),
(28, 'Déflagration', 5, 'special', 120, 85, 5, 'Peut brûler la cible'),
(29, 'Brume', 6, NULL, NULL, NULL, 30, 'Empêche toute variation de stat provoquée par l\'adversaire'),
(30, 'Buée Noire', 6, NULL, NULL, NULL, 30, 'Annule toute variation de stat, la confusion, les effets de Puissance, Vampigraine, Mur Lumière et Protection'),
(31, 'Onde Boréale', 6, 'special', 65, 100, 20, 'Peut baisser l\'attaque la cible'),
(32, 'Poing-Glace', 6, 'special', 75, 100, 15, 'Peut geler la cible'),
(33, 'Laser Glace', 6, 'special', 95, 100, 10, 'Peut geler la cible'),
(34, 'Blizzard', 6, 'special', 120, 90, 5, 'Peut geler la cible'),
(35, 'Sécrétion', 7, NULL, NULL, 95, 40, 'Diminue la vitesse de la cible'),
(36, 'Dard Nuée', 7, 'physical', 14, 85, 20, 'Attaque deux à cinq fois'),
(37, 'Vampirisme', 7, 'physical', 20, 100, 15, 'Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible'),
(38, 'Double-Dard', 7, 'physical', 25, 100, 20, 'Attaque deux fois - Peut empoisoner'),
(39, 'Adaptation', 8, NULL, NULL, NULL, 30, 'Le lanceur devient du même type que l\'adversaire'),
(40, 'Affûtage', 8, NULL, NULL, NULL, 30, 'Augmente l\'attaque du lanceur'),
(41, 'Armure', 8, NULL, NULL, NULL, 30, 'Augmente la défense du lanceur'),
(42, 'Berceuse', 8, NULL, NULL, 55, 15, 'Endort la cible'),
(43, 'Boul\'Armure', 8, NULL, NULL, NULL, 40, 'Augmente la défense du lanceur'),
(44, 'Brouillard', 8, NULL, NULL, 100, 20, 'Baisse la précision de la cible'),
(45, 'Clonage', 8, NULL, NULL, NULL, 10, 'Crée un clone qui prend les dommages à la place du lanceur, enlève 25% des PV du lanceur'),
(46, 'Copie', 8, NULL, NULL, NULL, 10, 'Apprend une des attaques de l\'advresaire au hasard jusqu\'à la fin du combat'),
(47, 'Croissance', 8, NULL, NULL, NULL, 40, 'Augmente le spécial du lanceur'),
(48, 'Cyclone', 8, NULL, NULL, 100, 20, 'Met fin au combat contre un Pokémon sauvage, échoue contre un dresseur'),
(49, 'Danse-Lames', 8, NULL, NULL, NULL, 30, 'Augmente l\'attaque du lanceur de deux niveaux'),
(50, 'E-Coque', 8, NULL, NULL, NULL, 10, 'Restaure jusqu\'à la moitié des PV du lanceur'),
(51, 'Entrave', 8, NULL, NULL, 55, 20, 'Supprime durant un à huit tour une attaque au hasard de la cible'),
(52, 'Flash', 8, NULL, NULL, 70, 20, 'Baisse la précision de la cible'),
(53, 'Grincement', 8, NULL, NULL, 85, 40, 'Baisse la défense de l\'adversaire de deux niveaux'),
(54, 'Grobisou', 8, NULL, NULL, 75, 10, 'Endort la cible'),
(55, 'Groz\'Yeux', 8, NULL, NULL, 100, 30, 'Baisse la défense de la cible'),
(56, 'Hurlement', 8, NULL, NULL, 100, 20, 'Met fin au combat contre un Pokémon sauvage, échoue contre un dresseur'),
(57, 'Intimidation', 8, NULL, NULL, 75, 30, 'Paralyse la cible'),
(58, 'Jet de Sable', 8, NULL, NULL, 100, 15, 'Baisse la précision de la cible'),
(59, 'Lilliput', 8, NULL, NULL, NULL, 20, 'Augmente l\'esquive du lanceur'),
(60, 'Métronome', 8, NULL, NULL, NULL, 10, 'Exécute une attaque prise au hasard dans cette liste'),
(61, 'Mimi-Queue', 8, NULL, NULL, 100, 30, 'Baisse la défense de la cible'),
(62, 'Morphing', 8, NULL, NULL, NULL, 10, 'Transforme le lanceur en le Pokémon adverse'),
(63, 'Puissance', 8, NULL, NULL, NULL, 30, 'Augmente le taux de Coups Critiques du lanceur'),
(64, 'Reflet', 8, NULL, NULL, NULL, 15, 'Augmente l\'esquive du lanceur'),
(65, 'Rugissement', 8, NULL, NULL, NULL, 40, 'Baisse l\'attaque de la cible'),
(66, 'Soin', 8, NULL, NULL, NULL, 20, 'Restaure jusqu\'à la moitié des PV du lanceur'),
(67, 'Trempette', 8, NULL, NULL, NULL, 40, NULL),
(68, 'Ultrason', 8, NULL, NULL, 55, 20, 'Rend la cible confuse'),
(69, 'Croc Fatal', 8, 'physical', NULL, 90, 10, 'Enlève 50% des PV restants de la cible'),
(70, 'Patience', 8, 'physical', NULL, NULL, 10, 'Immobilise le lanceur deux ou trois tours, puis inflige à l\'adversaire le double des dégâts subis pendant cette période'),
(71, 'Sonicboom', 8, 'physical', NULL, 90, 20, 'Inflige toujours 20 PV de dégâts'),
(72, 'Empal\'Korne', 8, 'physical', NULL, 30, 5, 'Met l\'adversaire KO, échoue s\'il a une vitesse supérieure à celle du lanceur'),
(73, 'Guillotine', 8, 'physical', NULL, 30, 5, 'Met l\'adversaire KO, échoue s\'il a une vitesse supérieure à celle du lanceur'),
(74, 'Constriction', 8, 'physical', 10, 100, 35, 'Peut baisser la vitesse de la cible'),
(75, 'Étreinte', 8, 'physical', 15, 85, 20, 'Attaque continue sur deux à cinq tours'),
(76, 'Furie', 8, 'physical', 15, 85, 20, 'Attaque deux à cinq fois'),
(77, 'Ligotage', 8, 'physical', 15, 90, 20, 'Attaque continue sur deux à cinq tours'),
(78, 'Pilonnage', 8, 'physical', 15, 85, 20, 'Attaque deux à cinq fois'),
(79, 'Torgnoles', 8, 'physical', 15, 85, 10, 'Attaque deux à cinq fois'),
(80, 'Combo-Griffe', 8, 'physical', 18, 80, 15, 'Attaque deux à cinq fois'),
(81, 'Poing Comète', 8, 'physical', 18, 85, 15, 'Attaque deux à cinq fois'),
(82, 'Frénésie', 8, 'physical', 20, 100, 20, 'Attaque sans fin, provoque l\'augmentation de l\'attaque du lanceur à chaque fois qu\'il subit des dégâts'),
(83, 'Picanon', 8, 'physical', 20, 100, 15, 'Attaque deux à cinq fois'),
(84, 'Charge', 8, 'physical', 35, 95, 35, NULL),
(85, 'Tornade', 8, 'physical', 35, 100, 40, NULL),
(86, 'Écras\'Face', 8, 'physical', 40, 100, 35, NULL),
(87, 'Griffe', 8, 'physical', 40, 100, 35, NULL),
(88, 'Jackpot', 8, 'physical', 40, 100, 20, 'Fait gagner un peu d\'argent à la fin des combats'),
(89, 'Vive-Attaque', 8, 'physical', 40, 100, 30, 'Attaque en premier'),
(90, 'Coupe', 8, 'physical', 50, 95, 30, NULL),
(91, 'Poing Karaté', 8, 'physical', 50, 100, 25, 'Taux de Coups Critiques élevé'),
(92, 'Lutte', 8, 'physical', 50, 100, 10, 'Blesse le lanceur'),
(93, 'Force Poigne', 8, 'physical', 55, 100, 30, NULL),
(94, 'Météores', 8, 'physical', 60, NULL, 20, 'N\'échoue jamais'),
(95, 'Morsure', 8, 'physical', 60, 100, 25, 'Peut apeurer la cible'),
(96, 'Écrasement', 8, 'physical', 65, 100, 20, 'Peut apeurer la cible'),
(97, 'Koud\'Korne', 8, 'physical', 65, 100, 25, NULL),
(98, 'Coud\'Boule', 8, 'physical', 70, 100, 15, 'Peut apeurer la cible'),
(99, 'Tranche', 8, 'physical', 70, 100, 20, 'Taux de Coups Critiques élevé'),
(100, 'Uppercut', 8, 'physical', 70, 100, 10, NULL),
(101, 'Coupe-Vent', 8, 'physical', 80, 100, 10, 'Attaque en deux tours, n\'agit pas au premier'),
(102, 'Croc de Mort', 8, 'physical', 80, 90, 15, 'Peut apeurer la cible'),
(103, 'Force', 8, 'physical', 80, 100, 15, NULL),
(104, 'Souplesse', 8, 'physical', 80, 75, 20, NULL),
(105, 'Triplattaque', 8, 'physical', 80, 100, 10, NULL),
(106, 'Ultimapoing', 8, 'physical', 80, 85, 20, NULL),
(107, 'Plaquage', 8, 'physical', 85, 100, 15, 'Peut paralyser la cible'),
(108, 'Bélier', 8, 'physical', 90, 85, 20, 'Blesse le lanceur'),
(109, 'Mania', 8, 'physical', 90, 100, 20, 'Attaque continue sur deux ou trois tours, le lanceur devient confus par la suite'),
(110, 'Bomb\'Œuf', 8, 'physical', 100, 75, 16, NULL),
(111, 'Coud\'Krâne', 8, 'physical', 100, 100, 15, 'Attaque en deux tours, n\'agit pas au premier'),
(112, 'Damoclès', 8, 'physical', 100, 100, 15, 'Blesse le lanceur'),
(113, 'Ultimawashi', 8, 'physical', 120, 75, 5, NULL),
(114, 'Destruction', 8, 'physical', 130, 100, 5, 'Lanceur KO après l\'attaque, ne tient compte que de la moitié de la défense adverse, ce qui équivaut à une puissance réelle de 260'),
(115, 'Ultralaser', 8, 'physical', 150, 90, 5, 'Lanceur immobilisé au tour suivant'),
(116, 'Explosion', 8, 'physical', 170, 100, 5, 'Lanceur KO après l\'attaque, ne tient compte que de la moitié dela défense adverse, ce qui équivaut à une puissance réelle de 340'),
(117, 'Para-Spore', 9, NULL, NULL, 75, 30, 'Paralyse la cible'),
(118, 'Poudre Dodo', 9, NULL, NULL, 75, 15, 'Endort la cible'),
(119, 'Spore', 9, NULL, NULL, 100, 15, 'Endort la cible'),
(120, 'Vampigraine', 9, NULL, NULL, 90, 10, 'Draîne à chaque tour des PV de la cible vers le lanceur'),
(121, 'Vol-Vie', 9, 'special', 20, 100, 20, 'Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible'),
(122, 'Fouet Lianes', 9, 'special', 35, 100, 10, NULL),
(123, 'Méga-Sangsue', 9, 'special', 40, 100, 10, 'Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible'),
(124, 'Tranch\'Herbe', 9, 'special', 55, 95, 25, 'Taux de Coups Critiques élevé'),
(125, 'Danse-Fleur', 9, 'special', 70, 100, 20, 'Attaque continue sur deux ou trois tour, le lanceur devient confus par la suite'),
(126, 'Lance-Soleil', 9, 'special', 120, 100, 10, 'Attaque en deux tours, n\'agit pas au premier'),
(127, 'Acidarmure', 10, NULL, NULL, NULL, 40, 'Augmente la défense du lanceur de deux niveaux'),
(128, 'Gaz Toxik', 10, NULL, NULL, 55, 40, 'Empoisonne la cible'),
(129, 'Poudre Toxik', 10, NULL, NULL, 75, 35, 'Empoisonne la cible'),
(130, 'Toxik', 10, NULL, NULL, 85, 10, 'Empoisonne gravement la cible'),
(131, 'Dard-Venin', 10, 'physical', 15, 100, 35, 'Peut empoisonner la cible'),
(132, 'Purédpois', 10, 'physical', 20, 70, 20, 'Peut empoisonner la cible'),
(133, 'Acide', 10, 'physical', 40, 100, 30, 'Peut baisser la défense de la cible'),
(134, 'Détritus', 10, 'physical', 65, 100, 20, 'Peut empoisonner la cible'),
(135, 'Amnésie', 11, NULL, NULL, NULL, 20, 'Augmente le spécial du lanceur de deux niveaux'),
(136, 'Bouclier', 11, NULL, NULL, NULL, 30, 'Augmente la défense du lanceur de deux niveaux'),
(137, 'Hâte	Type', 11, NULL, NULL, NULL, 30, 'Augmente la vitesse du lanceur de deux niveaux'),
(138, 'Hypnose', 11, NULL, NULL, 60, 20, 'Endort la cible'),
(139, 'Mur Lumière', 11, NULL, NULL, NULL, 30, 'Augmente la résistance du lanceur aux attaques , \'special\',s'),
(140, 'Protection', 11, NULL, NULL, NULL, 20, 'Augmente la résistance du lanceur aux attaques , \'physical\',s'),
(141, 'Repos', 11, NULL, NULL, NULL, 10, 'Restaure tous les PV du lanceur ainsi que son statut, le lanceur est immobilisé pendant deux tours'),
(142, 'Télékinésie', 11, NULL, NULL, 80, 15, 'Baisse la précision de la cible'),
(143, 'Téléport', 11, NULL, NULL, NULL, 20, 'Met fin au combat contre un Pokémon sauvage,échoue contre un dresseur'),
(144, 'Yoga', 11, NULL, NULL, NULL, 40, 'Augmente l\'attaque du lanceur'),
(145, 'Vague', 11, 'special', NULL, 80, 15, 'Inflige des dégâts variables'),
(146, 'Choc Mental', 11, 'special', 50, 100, 25, 'Peut rendre la cible confuse'),
(147, 'Rafale Psy', 11, 'special', 65, 100, 20, 'Peut rendre la cible confuse'),
(148, 'Psyko', 11, 'special', 90, 100, 10, 'Peut baisser le spécial de la cible'),
(149, 'Dévorêve', 11, 'special', 100, 100, 15, 'Restaure un nombre de PV au lanceur égal à la moitié des dégâts infligés à la cible, ne fonctionne que si la cible est endormie'),
(150, 'Jet-Pierres', 12, 'physical', 50, 65, 15, NULL),
(151, 'Éboulement', 12, 'physical', 75, 90, 10, 'Peut apeurer la cible'),
(152, 'Abîme', 13, 'physical', NULL, 30, 5, 'Met l\'adversaire KO, échoue s\'il a une vitesse supérieure à celle du lanceur'),
(153, 'Osmerang', 13, 'physical', 50, 90, 10, 'Attaque deux fois'),
(154, 'Massd\'Os', 13, 'physical', 65, 85, 10, 'Peut apeurer la cible'),
(155, 'Séisme', 13, 'physical', 100, 100, 10, NULL),
(156, 'Tunnel', 13, 'physical', 100, 100, 10, 'Attaque en deux tours, le lanceur ne peut être atteint que par Météores et Patience au premier tour'),
(157, 'Onde Folie', 14, NULL, NULL, 100, 10, 'Rend la cible confuse'),
(158, 'Ténèbres', 14, 'physical', NULL, 100, 15, 'Inflige des dégâts égaux au niveau du lanceur'),
(159, 'Léchouille', 14, 'physical', 20, 100, 30, 'Peut paralyser la cible'),
(160, 'Mimique', 15, NULL, NULL, NULL, 20, 'Le lanceur utilise la dernière attaque lancée par l\'adversaire'),
(161, 'Cru-Aile', 15, 'physical', 35, 100, 35, NULL),
(162, 'Picpic', 15, 'physical', 35, 100, 35, NULL),
(163, 'Vol', 15, 'physical', 70, 100, 15, 'Attaque en deux tours, le lanceur ne peut être atteint que par Météores et Patience au premier tour'),
(164, 'Bec Vrille', 15, 'physical', 80, 100, 20, NULL),
(165, 'Piqué', 15, 'physical', 140, 90, 5, 'Attaque en deux tours, n\'agit pas au premier');

-- --------------------------------------------------------

--
-- Structure de la table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
CREATE TABLE IF NOT EXISTS `challenge` (
  `id_from` int(11) NOT NULL,
  `id_to` int(11) NOT NULL,
  PRIMARY KEY (`id_from`,`id_to`),
  KEY `id_to` (`id_to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ci_session`
--

DROP TABLE IF EXISTS `ci_session`;
CREATE TABLE IF NOT EXISTS `ci_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ci_session`
--

INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('079o84b443n7jngr6kd8b1mi4bshmsbl', '::1', 1555270393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237303339333b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('1g11afhebu4ttb73b04eeks9ipk6e67f', '::1', 1555277541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237373534313b),
('237inii02fte4omejk7irg2lv6h3li6d', '::1', 1555191106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139313130363b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('2n8lngbq6hb2adaek6v4pvej74jomqq4', '::1', 1555187826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353138373832363b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('310fejf3v89rhaurhbqv5h8iqk5kl0pe', '::1', 1555275731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237353733313b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('3k1vlb61adbbodfmqi63uqs5f4eggchj', '::1', 1555271731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237313733313b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('4s6ufjjkts3kkfudl8ltdhsb2o79i22g', '::1', 1555273048, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237333034383b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('62fud1vg8ite0dvdgnhmia4es50ftaru', '::1', 1555196752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139363735323b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('8dli0j488hocfmasqun2dhmf93ggad81', '::1', 1555190514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139303531343b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('8j9fp1l5lbabr79v8si180ua5jm15tck', '::1', 1555271096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237313039363b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('8pu4s7etic1h4s0ul48pm8l04psc628o', '::1', 1555193192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139333139323b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('9vt9p6och661lgb07a2u8vh9a8vc3bfk', '::1', 1555270793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237303739333b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('a7r772nqlbdupeoq44ms9553e6m0lv5a', '::1', 1555276880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237363838303b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('aodqe8dfpp0hlk3ut3jt4ske6l4mhtd7', '::1', 1555194610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139343631303b),
('bo89sneepud8sjeljif1pd8ul5bqt9be', '::1', 1555185252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353138353235323b),
('c116g6m9jsfh3s9dqoc68thnu13fqmb6', '::1', 1555197961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139373733353b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('c8euc959iloe2plut53c975cmmeck8rn', '::1', 1555276388, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237363338383b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('dfaq3ik23n5923k4jdkisv7h7p8786ug', '::1', 1555197434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139373433343b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('e896f393e4nivu1a5r745a7n5l730nkp', '::1', 1555192875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139323837353b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('egk48k3pt81ptu924hqf0ljdun1p9jh0', '::1', 1555187468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353138373436383b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('fo9co8ud9fdfgtlg8v6a8i8m4c0sdle3', '::1', 1555272067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237323036373b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('fv94djdc4la1d3mm4l6drj34ksdhgrlq', '::1', 1555196420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139363432303b),
('g4uaba5oj3me5kcrqkvpj443ge8u7b0r', '::1', 1555188528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353138383532383b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('hp3dues3citrirr9tq10qb1am1175do2', '::1', 1555277260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237373236303b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('k48bpgl36igesn8pbmqrhp6nqi9t16pn', '::1', 1555274711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237343731313b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('k5cv4q6skpkk6vehj31kq694aqdqjrlk', '::1', 1555276047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237363034373b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('l0n62ckoprejacnkhj4je0e0cpkvubbr', '::1', 1555272396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237323339363b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('l2nujg0hg5dajequ77k2g8u7d5089erc', '::1', 1555271417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237313431373b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('l6h46hhb0b3veorc18a7to1775e7a3cf', '::1', 1555275409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237353430393b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('mmd7gsrvmi9u4sq8vkavopopv66tlnov', '::1', 1555273972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237333937323b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('mtfg9piqfa3jcaek4m7lgct1sc8o1dbe', '::1', 1555189051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353138393035313b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('nam8sssvg0j3rvi0lf128g9n8c2k9dm4', '::1', 1555197735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139373733353b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('orq5e23bj02nrf8edgh8jn8e370a7e6b', '::1', 1555197056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139373035363b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('pa3lpvmprrkjboivr9fkqfprkrr973on', '::1', 1555191695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139313639353b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('qrost2lk7ri6n7kmbhlajk6sedbn0f90', '::1', 1555272726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237323732363b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('srn9ksoo2jp40lm7gcmm224nd4bo9t74', '::1', 1555274274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237343237343b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('t1eeukskblmkvg9hfs1212j8h70gt1kh', '::1', 1555273393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237333339333b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('t5st5m8d4nch26n8o3ehj1v0cebpjbtm', '::1', 1555275023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353237353032333b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('tp7sk5mv2o5lsvlifd1fb76khkm92drg', '::1', 1555192357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353139323335373b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b),
('utrk1si40pi0tiu5llm8rvmpvarauu92', '::1', 1555188127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353138383132373b656d61696c7c733a32333a22646173696c7661616c7665736240676d61696c2e636f6d223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b70736575646f7c733a353a225365766c61223b);

-- --------------------------------------------------------

--
-- Structure de la table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email_validation_key` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_activity` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `member`
--

INSERT INTO `member` (`id`, `email`, `password`, `email_validation_key`, `active`, `last_activity`, `online`) VALUES
(14, 'dasilvaalvesb@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '9c50023acb07dc3cd5f7653f0cdec28fbc0efd19', 1, '2019-04-14 21:32:16', 0),
(21, 'dasilvaalvesb@hotmail.fr', '8cb2237d0679ca88db6464eac60da96345513964', '649906b097d2e1a4338b40d822150b3b16a64857', 1, '2019-04-13 18:44:44', 0);

-- --------------------------------------------------------

--
-- Structure de la table `pokedex`
--

DROP TABLE IF EXISTS `pokedex`;
CREATE TABLE IF NOT EXISTS `pokedex` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `hp` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `sp_attack` int(11) NOT NULL,
  `sp_defense` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `rarity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex`
--

INSERT INTO `pokedex` (`id`, `name`, `hp`, `attack`, `defense`, `sp_attack`, `sp_defense`, `speed`, `description`, `rarity`) VALUES
(1, 'Bulbizarre', 45, 49, 49, 65, 65, 45, 'Il peut survivre plusieurs jours sans manger. Le bulbe de son dos enmagasine de l\'énergie.', 3),
(2, 'Herbizarre', 60, 62, 63, 80, 80, 60, 'En emmagasinant de l\'énergie, son bulbe grossit. Il en émane un arôme quand il va éclore.', 4),
(3, 'Florizarre', 80, 82, 83, 100, 100, 80, 'Les pétales de sa fleur dorsale absorbent les rayons du soleil pour en faire de l\'énergie.', 5),
(4, 'Salameche', 39, 52, 43, 60, 50, 65, 'La flammèche au bout de sa queue émet un son crépitant audible seulement dans un endroit calme.', 3),
(5, 'Reptincel', 58, 64, 58, 80, 65, 80, 'Ce Pokémon est violent. Dans la furie d\'un combat son aura brille d\'une flamme bleutée.', 4),
(6, 'Dracaufeu', 78, 84, 78, 109, 85, 100, 'Quand il crache son souffle brûlant, la flamme au bout de sa queue s\'embrase.', 5),
(7, 'Carapuce', 44, 48, 65, 50, 64, 43, 'Caché sous l\'eau, il crache un jet d\'eau sur sa proie et se cache à l\'intérieur de sa coquille. ', 3),
(8, 'Carabaffe', 59, 63, 80, 65, 80, 58, 'Attaqué, il cache sa tête dans sa carapace, mais son corps trop gros ne peut y tenir en entier.', 4),
(9, 'Tortank', 79, 83, 100, 85, 105, 78, 'Une fois sa cible alignée, il projette des jets d\'eau plus puissants qu\'une lance à incendie.', 5),
(10, 'Chenipan', 45, 30, 35, 20, 20, 45, 'Quand on touche l\'appendice sur son front, il sécrète un gaz puant pour se protéger.', 1),
(11, 'Chrysacier', 50, 20, 55, 25, 25, 30, 'Il renforce sa carapace pour se protéger. Mais un coup puissant peut le déloger de son armure.', 2),
(12, 'Papilusion', 60, 45, 50, 90, 80, 70, 'Ses ailes sont enduites d\'une poudre toxique imperméable. Il peut voler sous la pluie.', 3),
(13, 'Aspicot', 40, 35, 30, 20, 20, 50, 'Prenez garde à la pique empoisonnée sur son front. Il se cache dans les buissons et les hautes herbes.', 1),
(14, 'Coconfort', 45, 25, 50, 25, 25, 35, 'Il se déplace très lentement. Menacé, il sort son aiguillon et empoisonne ses ennemis.', 2),
(15, 'Dardargnan', 65, 90, 40, 45, 80, 75, 'Il se sert de ses trois aiguillons empoisonnés pour attaquer sans relâche ses adversaires. ', 3),
(16, 'Roucool', 40, 45, 40, 35, 35, 56, 'De nature très docile, il préfère jeter du sable pour se défendre plutôt qu\'attaquer.', 1),
(17, 'Roucoups', 63, 60, 55, 50, 50, 71, 'Ce Pokémon est très vivace. Il survole en permanence son territoire pour chasser.', 2),
(18, 'Roucarnage', 83, 80, 75, 70, 70, 101, 'Ce Pokémon vole à Mach 2 quand il chasse. Ses grandes griffes sont des armes redoutables.', 3),
(19, 'Rattata', 30, 56, 35, 25, 35, 72, 'Il peut ronger n\'importe quoi. Quand on en voit un, il y en a certainement 40 dans le coin.', 1),
(20, 'Rattatac', 55, 81, 60, 50, 70, 97, 'Ses pattes sont palmées. Il peut poursuivre sa proie à travers les cours d\'eau et les rivières.', 2),
(21, 'Piafabec', 40, 60, 30, 31, 31, 70, 'Incapable de voler à haute altitude, il se déplace très vite pour protéger son territoire.', 1),
(22, 'Rapasdepic', 65, 90, 65, 61, 61, 100, 'Un Pokémon à qui on ne la fait pas. S\'il sent du danger, il fuit instantanément et à toute vitesse.', 2),
(23, 'Abo', 35, 60, 44, 40, 54, 55, 'Plus il est âgé, plus son corps est long. Il se love autour des arbres pour se reposer.', 1),
(24, 'Arbok', 60, 95, 69, 65, 79, 80, 'Des études menées sur les motifs effrayants de son corps ont révélé six variations différentes.', 2),
(25, 'Pikachu', 35, 55, 40, 50, 50, 90, 'Sa queue est dressée quand il est aux aguets. Si vous tirez dessus, il vous mordra. ', 3),
(26, 'Raichu', 60, 90, 55, 90, 80, 110, 'Il devient tout excité quand il emmagasine de l\'électricité. Il brille alors dans le noir.', 4),
(27, 'Sabelette', 50, 75, 85, 20, 30, 40, 'Son corps est sec. Quand la nuit déploie ses ailes de fraîcheur, son épiderme se couvre de rosée.', 1),
(28, 'Sablaireau', 75, 100, 110, 45, 55, 65, 'Ses griffes sont redoutables. Si une d\'elles se casse, elle repoussera en un jour.', 3),
(29, 'NidoranF', 55, 47, 52, 40, 40, 41, 'Un Pokémon paisible qui n\'aime pas se battre. Ses petites cornes sont empoisonnées. ', 1),
(30, 'Nidorina', 70, 62, 67, 55, 55, 56, 'Caché au fond de son terrier, ses cornes se rétractent. C\'est la preuve qu\'il est au repos.', 2),
(31, 'Nidoqueen', 90, 92, 87, 75, 85, 76, 'Son corps musclé est recouvert de lourdes écailles. Elle poussent selon un cycle et un ordre précis.', 3),
(32, 'NidoranM', 46, 57, 40, 40, 40, 50, 'Ses grandes oreilles sont toujours dressées. S\'il est menacé, il se défend avec un dard venimeux.', 1),
(33, 'Nidorino', 61, 72, 57, 50, 55, 65, 'Ses cornes sont venimeuses. Si elles touchent un ennemi, elles lui injectent un poison violent.', 2),
(34, 'Nidoking', 81, 102, 77, 85, 75, 85, 'Ses charges sont dévastatrices grâce à sa peau d\'acier. Ses cornes percent même le diamant.', 3),
(35, 'Melofee', 70, 45, 48, 60, 65, 35, 'Adoré pour son aspect mignon et joyeux, il est considéré comme rare. On en voit très peu.', 1),
(36, 'Melodelfe', 95, 70, 73, 95, 90, 60, 'Il défend son habitat avec courage. C\'est une sorte de fée qui ne se montre que rarement.', 3),
(37, 'Goupix', 38, 41, 40, 50, 65, 65, 'Sa fourrure et sa queue sont magnifiques. En  grandissant sa queue se divise en six.', 1),
(38, 'Feunard', 73, 76, 75, 81, 100, 100, 'Selon la légende, 9 esprits se sont unis et incarnés dans ce Pokémon mystérieux et magique.', 3),
(39, 'Rondoudou', 115, 45, 20, 45, 25, 20, 'Son regard déstabilise ses adversaires. Il chante ensuite une berceuse qui les endort.', 1),
(40, 'Grodoudou', 140, 70, 45, 85, 50, 45, 'Son corps est malléable. En aspirant de l\'air il se gonfle dans des proportions gigantesques.', 3),
(41, 'Nosferapti', 40, 45, 35, 30, 40, 55, 'Il se dirige avec des ultrasons qui lui servent de sonar pour éviter les obstacles sur son trajet.', 1),
(42, 'Nosferalto', 75, 80, 70, 65, 75, 90, 'Il attaque par surprise et sans crier gare. Ses longues dents lui servent à sucer le sang.', 3),
(43, 'Mystherbe', 45, 50, 55, 75, 65, 30, 'Il est souvent confondu avec un radis noir. Si on essaye de le soulever du sol, il hurle.', 1),
(44, 'Ortide', 60, 65, 70, 85, 75, 40, 'Il sent très mauvais ! Mais 1 personne sur 1000 aime la puanteur de son corps nauséabond.', 2),
(45, 'Rafflesia', 75, 80, 85, 110, 90, 50, 'Il fait du bruit sourd quand il secoue ses pétales pour disperser son pollen empoisonné.', 3),
(46, 'Paras', 35, 70, 55, 45, 55, 25, 'Il s\'enfouit sous terre pour ronger des racines afin de nourrir le champignon sur son dos.', 1),
(47, 'Parasect', 60, 95, 80, 60, 80, 30, 'Le champignon absorbe son hôte insectoïde. Il  semble doué de facultés intellectuelles.', 3),
(48, 'Mimitoss', 60, 55, 50, 40, 55, 45, 'Ses grands yeux lui servent de radar. En pleine lumière on peut y distinguer des facettes.', 1),
(49, 'Aeromite', 70, 65, 60, 90, 75, 90, 'Les écailles de ses ailes sont inamovibles. Elles libèrent un poison violent au contact. ', 3),
(50, 'Taupiqueur', 40, 55, 25, 35, 45, 95, 'Il aime les lieux sombres. Il passe la majeure partie du temps sous terre ou dans des cavernes.', 1),
(51, 'Triopikeur', 30, 100, 50, 50, 70, 120, 'Quand un de ces triplets creuse à plus de 90 Km/h, il provoque des tremblements de terre.', 3),
(52, 'Miaouss', 40, 45, 35, 40, 40, 90, 'Il est surtout actif la nuit. Il aime chaparder les objets ronds et brillants.', 1),
(53, 'Persian', 65, 70, 60, 65, 65, 115, 'Sa démarche est souple et majestueuse. La pierre sur son front brille de mille feux.', 3),
(54, 'Psykokwak', 50, 52, 48, 65, 50, 55, 'Il est victime de violent maux de tête. Il utilise ses pouvoirs psy de façon discrète.', 1),
(55, 'Akwakwak', 80, 82, 78, 95, 80, 95, 'Ses membres fins et longs sont terminés par des nageoires qui lui permettent de nager élégamment.', 3),
(56, 'Ferosinge', 40, 80, 35, 35, 45, 70, 'Agile et rapide, ce Pokémon vit dans les arbres. Il est féroce et ne refuse jamais un combat.', 1),
(57, 'Colossinge', 65, 105, 60, 60, 70, 95, 'Sa fureur prend fin quand il n\'a plus personne à frapper. Il est difficile d\'en être témoin.', 3),
(58, 'Caninos', 55, 70, 45, 70, 50, 60, 'Ce Pokémon est de nature amicale. Mais il devient hargneux quand son territoire est menacé.', 1),
(59, 'Arcanin', 90, 110, 80, 100, 80, 95, 'Un Pokémon légendaire en Chine. Il est admiré pour la grâce et la beauté de sa course', 3),
(60, 'Ptitard', 40, 50, 40, 40, 40, 90, 'Le sens de la spirale sur son ventre diffère selon son origine. Il préfère la nage à la marche.', 1),
(61, 'Tetarte', 65, 65, 65, 50, 50, 90, 'Attaqué, il se sert de sa spirale pour endormir sa proie. Il peut ainsi s\'enfuir.', 2),
(62, 'Tartard', 90, 95, 95, 70, 90, 70, 'Son corps très musclé lui permet de nager plus rapidement qu\'un champion olympique.', 3),
(63, 'Abra', 25, 20, 15, 105, 55, 90, 'Il dort 18 heures par jour. En cas de danger, il se téléporte vers un lieu sûr, même s\'il est assoupi.', 1),
(64, 'Kadabra', 40, 35, 30, 120, 70, 105, 'Sa présence cause des événements étranges, comme des pendules marchant à l\'envers.', 3),
(65, 'Alakazam', 55, 50, 45, 135, 95, 120, 'Ce Pokémon est très intelligent. Sa mémoire est immense, il retient tout ce qu\'il apprend.', 5),
(66, 'Machoc', 70, 80, 50, 35, 35, 35, 'Très puissant malgré sa petite taille, il est passé maître en plusieurs types d\'arts martiaux.', 1),
(67, 'Machopeur', 80, 100, 70, 50, 60, 45, 'Sa ceinture sert à retenir son énergie. Sans elle, il serait invincible et incontrôlable.', 3),
(68, 'Mackogneur', 90, 130, 80, 65, 85, 55, 'Un seul de ses bras peut bouger une montagne. Rien ne résiste aux quatre bras en même temps.', 5),
(69, 'Chetiflor', 50, 75, 35, 70, 30, 40, 'Il préfère les endroits chauds et humides. Il capture sa proie avec ses lianes pour la dévorer.', 1),
(70, 'Boustiflor', 65, 90, 50, 85, 45, 55, 'Il peut avaler et digérer n\'importe quoi grâce à l\'hyperacidité de son estomac vorace.', 2),
(71, 'Empiflor', 80, 105, 65, 100, 70, 70, 'Il attire sa proie avec une odeur de miel et l\'avale en entier. Il la digère en un seul jour.', 3),
(72, 'Tentacool', 40, 40, 35, 50, 100, 70, 'Certains échouent sur la plage et sèchent sur le sable. Poussez-les dans l\'eau et ils revivent.', 1),
(73, 'Tentacruel', 80, 70, 65, 80, 120, 100, 'Ses 80 tentacules sont extensibles et autonomes. Ils inoculent un poison au contact.', 3),
(74, 'Racaillou', 40, 80, 100, 30, 30, 20, 'On en trouve près des sentiers de montagne. Si vous marchez dessus, ils s\'énervent et attaquent.', 1),
(75, 'Gravalanch', 55, 95, 115, 45, 45, 35, 'Il dévale les pentes le long des montagnes, et traverse les obstacles en les pulvérisant.', 3),
(76, 'Grolem', 80, 120, 130, 55, 65, 45, 'Son corps est blanc et tendre. Au contact de l\'air sa peau se solidifie en une armure.', 5),
(77, 'Ponyta', 50, 85, 55, 65, 65, 90, 'Capable de sauter très haut, ses sabots et ses pattes peuvent absorber l\'impact de l\'atterrissage.', 1),
(78, 'Galopa', 65, 100, 70, 80, 80, 105, 'Il aime la course. Il poursuit tout ce qui va plus vite que lui. Question d\'honneur.', 3),
(79, 'Ramoloss', 90, 65, 65, 40, 40, 15, 'Lent et stupide, il aime se la couler douce en observant l\'activité autour de lui.', 1),
(80, 'Flagadoss', 95, 75, 110, 100, 80, 30, 'Il se prélasse au soleil. Si le Kokiyas, accroché à sa queue s\'en va, il redevient un Ramoloss. ', 3),
(81, 'Magneti', 25, 35, 70, 95, 55, 45, 'Sa nature défie les lois de la gravité. Il flotte grâce à un champ électromagnétique.', 1),
(82, 'Magneton', 50, 60, 95, 120, 70, 70, 'Il émet un signal radio étrange. Sa présence augmente la température de 1 degré dans un rayon de 1000 m.', 3),
(83, 'Canarticho', 52, 90, 55, 58, 62, 60, 'Ils vivent près des roseaux. On en voit peu, ils sont peut-être en voie d\'extinction.', 3),
(84, 'Doduo', 35, 85, 45, 35, 35, 75, 'Ses petites ailes ne lui permettent pas de voler, mais il peut courir très rapidement.', 1),
(85, 'Dodrio', 60, 110, 70, 60, 60, 110, 'Quand une des 2 têtes d\'un Doduo se divise, il devient un Dodrio capable de courir à 60 km/h.', 3),
(86, 'Otaria', 65, 45, 55, 45, 70, 45, 'Il est à l\'aise dans les endroits froids et gelés. Il peut nager dans de l\'eau à 0 degré.', 1),
(87, 'Lamantine', 90, 70, 80, 70, 95, 70, 'Son corps entier est d\'une couleur blanc neige. Il peut nager au milieu des icebergs.', 3),
(88, 'Tadmorv', 80, 80, 50, 40, 50, 25, 'Ce tas d\'ordure concentrées sent très mauvais. Rien ne peut pousser son sillage putride.', 1),
(89, 'Grotadmorv', 105, 105, 75, 65, 100, 50, 'Son odeur immonde provoque des évanouissements. Son odorat s\'est atrophié par sa propre puanteur.', 3),
(90, 'Kokiyas', 30, 65, 100, 45, 25, 40, 'Sa coquille le protège de toute attaque. Si elle s\'ouvre son corps fragile devient vulnérable.', 1),
(91, 'Crustabri', 50, 95, 180, 85, 45, 70, 'Sa coquille plus dure que le diamant le protège. Il peut envoyer des volées de dards.', 3),
(92, 'Fantominus', 30, 35, 30, 100, 35, 80, 'On en trouve dans les maisons en ruines. Il n\'a pas de forme bien définie car il est fait de gaz.', 1),
(93, 'Spectrum', 45, 50, 45, 115, 55, 95, 'Les tremblements provoqués par le contact de sa langue éthérée ne s\'arrêtent qu\'à l\'évanouissement.', 3),
(94, 'Ectoplasma', 60, 65, 60, 130, 75, 110, 'Quand il lance une malédiction, il émet une aura malveillante qui provoque des frissons.', 5),
(95, 'Onix', 35, 45, 160, 30, 45, 70, 'Il creuse sous terre en quête de nourriture. Ses tunnels servent de maison aux Taupiqueur.', 2),
(96, 'Soporifik', 60, 48, 45, 43, 90, 42, 'Si vous dormez près de lui, il influencera vos rêves avec les songes qu\'il a dévorés.', 1),
(97, 'Hypnomade', 85, 73, 70, 73, 115, 67, 'Evitez son regard quand vous en croisez un, ou il essayera de vous hypnotiser avec son pendule', 3),
(98, 'Krabby', 30, 105, 90, 25, 25, 50, 'Ses pinces sont de puissantes armes. Si une se casse durant un combat, elle repoussera vite.', 1),
(99, 'Krabboss', 55, 130, 115, 50, 50, 75, 'Sa pince, grosse et dure comme de l\'acier, peut déployer une pression de 100 tonnes.', 3),
(100, 'Voltorbe', 40, 30, 50, 55, 55, 100, 'On dit qu\'il se déguise en PokéBall. Il s\'autodétruira à la moindre stimulation. ', 1),
(101, 'Electrode', 60, 50, 70, 80, 80, 150, 'Il stocke de l\'énergie électrique dans son corps, ce qui le rend instable et explosif.', 3),
(102, 'Noeunoeuf', 60, 40, 80, 60, 45, 40, 'Les têtes sont attirées les unes vers les autres. Il en faut 6 pour qu\'il établisse son équilibre.', 1),
(103, 'Noadkoko', 95, 95, 85, 125, 75, 55, 'Son hurlement est strident car ses 3 têtes se chamaillent tout le temps.', 3),
(104, 'Osselait', 50, 50, 95, 40, 50, 35, 'Il porte le crâne de sa défunte mère. Ses pleurs résonnent dans son casque en une triste mélodie.', 1),
(105, 'Ossatueur', 60, 80, 110, 50, 80, 45, 'Petit et faible, ce Pokémon est habile avec sa masse en os. Il devient vicieux avec l\'âge.', 3),
(106, 'Kicklee', 50, 120, 53, 35, 110, 87, 'Quand il donne des coups de pieds, ceux-ci deviennent durs comme le diamant.', 4),
(107, 'Tygnon', 50, 105, 79, 35, 110, 76, 'Ses coups de poings rotatifs sont si puissants qu\'il peut forer le béton comme un marteau-piqueur.', 4),
(108, 'Excelangue', 90, 55, 75, 60, 75, 30, 'Sa langue mesure 2m  et elle est plus maniable que ses pattes. Son contact provoque la paralysie.', 4),
(109, 'Smogo', 40, 65, 95, 60, 45, 35, 'Dans des endroits chauds, son corps fait de gaz devient instable et peut exploser. Attention !', 1),
(110, 'Smogogo', 65, 90, 120, 85, 70, 60, 'Ce Pokémon se nourrit de gaz, de poisons, et de germes que l\'on peut trouver dans des tas d\'ordures.', 3),
(111, 'Rhinocorne', 80, 85, 95, 30, 30, 25, 'Un Pokémon qui a des oeillères. S\'il se met à charger, il ne s\'arrêtera qu\'à l\'épuisement.', 1),
(112, 'Rhinoferos', 105, 130, 120, 45, 45, 40, 'Il peut se tenir debout. Il semble un peu intelligent. Son épiderme résiste même à la lave.', 3),
(113, 'Leveinard', 250, 5, 5, 35, 105, 50, 'Il est gentil et aimable, et il partage ses oeufs nourrissants avec les Pokémon blessés.', 4),
(114, 'Saquedeneu', 65, 55, 115, 100, 40, 60, 'Son corps est masqué par une masse épaisse de lianes bleues qui poussent en permanence.', 4),
(115, 'Kangourex', 105, 95, 80, 40, 80, 90, 'Il élève son petit dans sa poche ventrale. Il ne l\'abandonne jamais dans un combat.', 4),
(116, 'Hypotrempe', 30, 40, 70, 70, 25, 60, 'Menacé, il crache un jet d\'encre ou d\'eau de sa bouche pour se défendre.', 1),
(117, 'Hypocean', 55, 65, 95, 95, 45, 85, 'Le contact de sa nageoire provoque une irritation. Il ancre sa queue au corail pour dormir.', 3),
(118, 'Poissirene', 45, 67, 60, 35, 50, 63, 'Quand survient la saison de ponte, on peut en voir dans les rivières et les cascades en larges groupes.', 1),
(119, 'Poissoroy', 80, 92, 65, 65, 80, 68, 'Le mâle utilise la corne placée sur son front pour creuser un nid dans la rivière.', 3),
(120, 'Stari', 30, 45, 55, 70, 55, 85, 'Tant que sa partie centrale est indemne, il peut régénérer les parties de son corps.', 1),
(121, 'Staross', 60, 75, 85, 100, 85, 115, 'Quand le centre de son corps, appelé le coeur, brille de 7 couleurs, il essaie de parler.', 3),
(122, 'M. Mime', 40, 45, 65, 100, 120, 90, 'Il est toujours en train de mimer. Il leurre ses ennemis en mimant des actions irréelles.', 4),
(123, 'Insecateur', 70, 110, 80, 55, 80, 105, 'Bondissant hors de l\'herbe comme un ninja, il lacère sa proie de ses griffes acérées.', 4),
(124, 'Lippoutou', 65, 50, 35, 115, 95, 95, 'Il bouge en rythme comme s\'il dansait. Il ondule du popotin quand il marche.', 4),
(125, 'Elektek', 65, 83, 57, 95, 85, 105, 'Il provoque des pannes de courants dans les centrales en mangeant de l\'électricité.', 4),
(126, 'Magmar', 65, 95, 57, 100, 85, 93, 'Né dans un volcan en fusion, son corps est recouvert de flammes, comme une boule de feu.', 4),
(127, 'Scarabrute', 65, 125, 100, 55, 70, 85, 'Il enserre sa proie de sa puissance pince. Il ne peut se déplacer dans les milieux froids.', 4),
(128, 'Tauros', 75, 100, 95, 40, 70, 110, 'C\'est un Pokémon très endurant. Il n\'achève sa charge qu\'une fois sa cible pulvérisée.', 4),
(129, 'Magicarpe', 20, 10, 55, 15, 20, 80, 'Célèbre pour son inutilité, on en trouve beaucoup dans les océans, les étangs et les rivières.', 1),
(130, 'Leviator', 95, 125, 79, 60, 100, 81, 'Brutal, vicieux et dangereux, il est connu pour avoir rasé des villes entières par le passé.', 3),
(131, 'Lokhlass', 130, 85, 80, 85, 95, 60, 'D\'une âme noble, il peut lire dans les esprits. Il transporte les humains sur son dos.', 4),
(132, 'Metamorph', 48, 48, 48, 48, 48, 48, 'Quand il repère un ennemi, il adapte sa forme pour en faire une copie parfaite. ', 3),
(133, 'Evoli', 55, 55, 50, 45, 65, 55, 'Sa génétique instable lui permet d\'évoluer de plusieurs façons. Très peu sont en vie.', 3),
(134, 'Aquali', 130, 65, 60, 110, 95, 65, 'Sa structure cellulaire est semblable à celle de l\'eau. Il est invisible en milieu aquatique.', 4),
(135, 'Voltali', 65, 65, 60, 110, 95, 130, 'Un Pokémon très sensible et lunatique. Il se charge en énergie selon son humeur.', 4),
(136, 'Pyroli', 65, 130, 60, 95, 110, 65, 'Une flamme brûle en permanence dans son corps. Il crache un feu de plus de 1000 degrés.', 4),
(137, 'Porygon', 65, 60, 70, 85, 75, 40, 'Conçu pour voler dans l\'espace, on ne lui a toujours pas trouvé une autre utilité. ', 4),
(138, 'Amonita', 35, 40, 100, 90, 55, 35, 'Un ancien Pokémon régénéré à partir d\'un fossile. Il nage grâce à ses 10 tentacules.', 4),
(139, 'Amonistar', 70, 60, 125, 115, 70, 55, 'Sa bouche est formée de becs aiguisés. Sa coquille trop lourde l\'empêche de se déplacer.', 5),
(140, 'Kabuto', 30, 80, 90, 55, 45, 55, 'Créé à partir d\'un fossile, il se sert des yeux dans son dos quand il se cache au fond de l\'eau. ', 4),
(141, 'Kabutops', 60, 115, 105, 65, 70, 80, 'C\'est un très bon nageur. Il lacère sa proie de ses longues griffes et en absorbe les fluides corporels.', 5),
(142, 'Ptera', 80, 105, 65, 60, 75, 130, 'Un Pokémon sauvage disparu il y a longtemps. Il est créé à partir d\'ADN fossilisé dans de l\'ambre. ', 4),
(143, 'Ronflex', 160, 110, 65, 65, 110, 30, 'Il peut tout manger, même de la nourriture avariée. Il n\'a jamais mal au ventre.', 4),
(144, 'Artikodin', 90, 85, 100, 95, 125, 85, 'Un Pokémon légendaire. Il glace la vapeur d\'eau contenue dans l\'air pour faire de la neige.', 5),
(145, 'Electhor', 90, 90, 85, 125, 90, 100, 'Ce Pokémon légendaire annonce l\'arrivée de nuages noirs, d\'éclairs et d\'averses.', 5),
(146, 'Sulfura', 90, 100, 90, 125, 85, 90, 'Quand ce Pokémon légendaire agite ses ailes de feu, même la nuit noire s\'embrase et rougeoie.', 5),
(147, 'Minidraco', 41, 64, 45, 50, 50, 50, 'L\'existence de ce Pokémon mythique ne fut confirmée que récemment par un pêcheur.', 3),
(148, 'Draco', 61, 84, 65, 70, 70, 70, 'Selon certains, son corps est baigné d\'une étrange aura, lui donnant un air mystique.', 4),
(149, 'Dracolosse', 91, 134, 95, 100, 100, 80, 'On raconte que ce Pokémon vit quelque part dans la mer et qu\'il peut voler. rien n\'est moins sûr. ', 5),
(150, 'Mewtwo', 106, 110, 90, 154, 90, 130, 'Son ADN est le même que celui de MEW mais sa taille et son aspect sont très différents. ', 5),
(151, 'Mew', 100, 100, 100, 100, 100, 100, 'Vu au microscope, le pelage de ce Pokémon est fin, soyeux et très délicat.', 5);

-- --------------------------------------------------------

--
-- Structure de la table `pokedex_capacity`
--

DROP TABLE IF EXISTS `pokedex_capacity`;
CREATE TABLE IF NOT EXISTS `pokedex_capacity` (
  `id_pokedex` int(11) NOT NULL,
  `id_capacity` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id_pokedex`,`id_capacity`),
  KEY `id_capacity` (`id_capacity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex_capacity`
--

INSERT INTO `pokedex_capacity` (`id_pokedex`, `id_capacity`, `level`) VALUES
(1, 84, 0),
(4, 65, 0),
(4, 87, 0),
(7, 84, 0);

-- --------------------------------------------------------

--
-- Structure de la table `pokedex_evolution`
--

DROP TABLE IF EXISTS `pokedex_evolution`;
CREATE TABLE IF NOT EXISTS `pokedex_evolution` (
  `id_from` int(11) NOT NULL,
  `id_to` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id_from`,`id_to`),
  KEY `id_to` (`id_to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex_evolution`
--

INSERT INTO `pokedex_evolution` (`id_from`, `id_to`, `level`) VALUES
(1, 2, 16),
(2, 3, 32),
(4, 5, 16),
(5, 6, 36),
(7, 8, 16),
(8, 9, 36),
(10, 11, 7),
(11, 12, 10),
(13, 14, 7),
(14, 15, 10),
(16, 17, 18),
(17, 18, 36),
(19, 20, 20),
(21, 22, 20),
(23, 24, 22),
(25, 26, -1),
(27, 28, 22),
(29, 30, 16),
(30, 31, -1),
(32, 33, 16),
(33, 34, -1),
(35, 36, -1),
(37, 38, -1),
(39, 40, -1),
(41, 42, 22),
(43, 44, 21),
(44, 45, -1),
(46, 47, 24),
(48, 49, 31),
(50, 51, 26),
(52, 53, 28),
(54, 55, 33),
(56, 57, 28),
(58, 59, -1),
(60, 61, 25),
(61, 62, -1),
(63, 64, 16),
(64, 65, -2),
(66, 67, 28),
(67, 68, -2),
(69, 70, 21),
(70, 71, -1),
(72, 73, 30),
(74, 75, 25),
(75, 76, -2),
(77, 78, 40),
(79, 80, 37),
(81, 82, 30),
(84, 85, 31),
(86, 87, 34),
(88, 89, 38),
(90, 91, -1),
(92, 93, 25),
(93, 94, -2),
(96, 97, 26),
(98, 99, 28),
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

-- --------------------------------------------------------

--
-- Structure de la table `pokedex_type`
--

DROP TABLE IF EXISTS `pokedex_type`;
CREATE TABLE IF NOT EXISTS `pokedex_type` (
  `id_pokedex` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  PRIMARY KEY (`id_pokedex`,`id_type`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex_type`
--

INSERT INTO `pokedex_type` (`id_pokedex`, `id_type`) VALUES
(56, 1),
(57, 1),
(62, 1),
(66, 1),
(67, 1),
(68, 1),
(106, 1),
(107, 1),
(147, 2),
(148, 2),
(149, 2),
(7, 3),
(8, 3),
(9, 3),
(54, 3),
(55, 3),
(60, 3),
(61, 3),
(62, 3),
(72, 3),
(73, 3),
(79, 3),
(80, 3),
(86, 3),
(87, 3),
(90, 3),
(91, 3),
(98, 3),
(99, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(129, 3),
(130, 3),
(131, 3),
(134, 3),
(138, 3),
(139, 3),
(140, 3),
(141, 3),
(25, 4),
(26, 4),
(81, 4),
(82, 4),
(100, 4),
(101, 4),
(125, 4),
(135, 4),
(145, 4),
(4, 5),
(5, 5),
(6, 5),
(37, 5),
(38, 5),
(58, 5),
(59, 5),
(77, 5),
(78, 5),
(126, 5),
(136, 5),
(146, 5),
(87, 6),
(91, 6),
(124, 6),
(131, 6),
(144, 6),
(10, 7),
(11, 7),
(12, 7),
(13, 7),
(14, 7),
(15, 7),
(46, 7),
(47, 7),
(48, 7),
(49, 7),
(123, 7),
(127, 7),
(16, 8),
(17, 8),
(18, 8),
(19, 8),
(20, 8),
(21, 8),
(22, 8),
(35, 8),
(36, 8),
(39, 8),
(40, 8),
(52, 8),
(53, 8),
(83, 8),
(84, 8),
(85, 8),
(108, 8),
(113, 8),
(115, 8),
(128, 8),
(132, 8),
(133, 8),
(137, 8),
(143, 8),
(1, 9),
(2, 9),
(3, 9),
(43, 9),
(44, 9),
(45, 9),
(46, 9),
(47, 9),
(69, 9),
(70, 9),
(71, 9),
(102, 9),
(103, 9),
(114, 9),
(1, 10),
(2, 10),
(3, 10),
(13, 10),
(14, 10),
(15, 10),
(23, 10),
(24, 10),
(29, 10),
(30, 10),
(31, 10),
(32, 10),
(33, 10),
(34, 10),
(41, 10),
(42, 10),
(43, 10),
(44, 10),
(45, 10),
(48, 10),
(49, 10),
(69, 10),
(70, 10),
(71, 10),
(72, 10),
(73, 10),
(88, 10),
(89, 10),
(92, 10),
(93, 10),
(94, 10),
(109, 10),
(110, 10),
(63, 11),
(64, 11),
(65, 11),
(79, 11),
(80, 11),
(96, 11),
(97, 11),
(102, 11),
(103, 11),
(121, 11),
(122, 11),
(124, 11),
(150, 11),
(151, 11),
(74, 12),
(75, 12),
(76, 12),
(95, 12),
(111, 12),
(112, 12),
(138, 12),
(139, 12),
(140, 12),
(141, 12),
(142, 12),
(27, 13),
(28, 13),
(31, 13),
(34, 13),
(50, 13),
(51, 13),
(74, 13),
(75, 13),
(76, 13),
(95, 13),
(104, 13),
(105, 13),
(111, 13),
(112, 13),
(92, 14),
(93, 14),
(94, 14),
(6, 15),
(12, 15),
(16, 15),
(17, 15),
(18, 15),
(21, 15),
(22, 15),
(41, 15),
(42, 15),
(83, 15),
(84, 15),
(85, 15),
(123, 15),
(130, 15),
(142, 15),
(144, 15),
(145, 15),
(146, 15),
(149, 15);

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
--

DROP TABLE IF EXISTS `pokemon`;
CREATE TABLE IF NOT EXISTS `pokemon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `%_hp` float NOT NULL,
  `id_trainer` int(11) NOT NULL,
  `id_pokedex` int(11) NOT NULL,
  `in_team` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pokedex` (`id_pokedex`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `level`, `xp`, `%_hp`, `id_trainer`, `id_pokedex`, `in_team`) VALUES
(13, 50, 69, 100, 14, 3, 1),
(16, 50, 0, 100, 14, 6, 0),
(17, 50, 0, 100, 14, 65, 2),
(18, 50, 0, 100, 14, 68, 3),
(19, 50, 0, 100, 14, 76, 5),
(20, 50, 0, 100, 14, 94, 4),
(21, 50, 0, 100, 14, 149, 6),
(28, 1, 0, 100, 21, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_capacity`
--

DROP TABLE IF EXISTS `pokemon_capacity`;
CREATE TABLE IF NOT EXISTS `pokemon_capacity` (
  `id_pokemon` int(11) NOT NULL,
  `id_capacity` int(11) NOT NULL,
  `pp` int(11) NOT NULL,
  PRIMARY KEY (`id_pokemon`,`id_capacity`),
  KEY `id_capacity` (`id_capacity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokemon_capacity`
--

INSERT INTO `pokemon_capacity` (`id_pokemon`, `id_capacity`, `pp`) VALUES
(13, 4, 6),
(13, 69, 5),
(13, 89, 4),
(13, 132, 15),
(28, 65, 40),
(28, 87, 35);

-- --------------------------------------------------------

--
-- Structure de la table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
CREATE TABLE IF NOT EXISTS `trainer` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `avatar` int(11) NOT NULL,
  `pokedollar` int(11) NOT NULL DEFAULT '50',
  `pokeball` int(11) NOT NULL DEFAULT '5',
  `potion` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `trainer`
--

INSERT INTO `trainer` (`id`, `name`, `avatar`, `pokedollar`, `pokeball`, `potion`) VALUES
(14, 'Sevla', 1, 265, 68, 38),
(21, 'Keyser', 2, 100, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
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

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `capacity`
--
ALTER TABLE `capacity`
  ADD CONSTRAINT `capacity_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `challenge`
--
ALTER TABLE `challenge`
  ADD CONSTRAINT `challenge_ibfk_1` FOREIGN KEY (`id_from`) REFERENCES `trainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `challenge_ibfk_2` FOREIGN KEY (`id_to`) REFERENCES `trainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pokedex_capacity`
--
ALTER TABLE `pokedex_capacity`
  ADD CONSTRAINT `pokedex_capacity_ibfk_1` FOREIGN KEY (`id_pokedex`) REFERENCES `pokedex` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pokedex_capacity_ibfk_2` FOREIGN KEY (`id_capacity`) REFERENCES `capacity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pokedex_evolution`
--
ALTER TABLE `pokedex_evolution`
  ADD CONSTRAINT `pokedex_evolution_ibfk_1` FOREIGN KEY (`id_from`) REFERENCES `pokedex` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pokedex_evolution_ibfk_2` FOREIGN KEY (`id_to`) REFERENCES `pokedex` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pokedex_type`
--
ALTER TABLE `pokedex_type`
  ADD CONSTRAINT `pokedex_type_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`id_pokedex`) REFERENCES `pokedex` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `pokemon_capacity`
--
ALTER TABLE `pokemon_capacity`
  ADD CONSTRAINT `pokemon_capacity_ibfk_1` FOREIGN KEY (`id_capacity`) REFERENCES `capacity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `trainer`
--
ALTER TABLE `trainer`
  ADD CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
