-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 03, 2019 at 09:56 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dasilvaa`
--

-- --------------------------------------------------------

--
-- Table structure for table `capacity`
--

CREATE TABLE `capacity` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `id_type` int(11) NOT NULL,
  `class` enum('physical','special') DEFAULT NULL,
  `puis` int(11) DEFAULT NULL,
  `prec` int(11) DEFAULT NULL,
  `pp` int(11) NOT NULL,
  `eff_sec` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `capacity`
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
-- Table structure for table `ci_session`
--

CREATE TABLE `ci_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_session`
--

INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('45732c5e0d8645cb12ec389c86e3ec84456526dc', '193.48.143.177', 1554284898, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343238343637313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('987989963372b3e77bd73641c95516a2ff23f040', '193.48.143.177', 1554284671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343238343637313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('631f952d9aa20186a505eb1037e7b413f82994d8', '193.48.143.177', 1554281364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343238313336343b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('6c6744836270d941d7424a5395d8c2753fb29688', '193.48.143.177', 1554284300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343238343330303b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('6cb1dbecc6bb2028c27545bd4e6d0d0a093d2945', '193.48.143.177', 1554280877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343238303837373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('977d66f3395a694a9135f957306ad38b685265a3', '193.48.143.177', 1554280118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343238303131383b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('b7d224d4f1c926969f0f6093a224c65159ad2cfa', '193.48.143.177', 1554279718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237393731383b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('f0286d1dd6dbfc74ec3bbde3c8ffd3e17d836525', '193.48.143.177', 1554279072, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237393037323b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('6ec6726f067d5918c374000a594c3422829af129', '193.48.143.177', 1554279373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237393337333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('2b734027bd198fb72123c855eec4070f9313f662', '193.48.143.177', 1554278507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237383530373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('8033c1df74df1c9a06b82e79588b839dd9727416', '193.48.143.177', 1554278205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237383230353b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('8a38c28c84dab0aac2bb18e9ad010abc864bb04e', '193.48.143.177', 1554275240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237353234303b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('1ae72a0fca007374c2088031363604aaf6ddc8c3', '193.48.143.177', 1554275550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237353535303b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('e46ec199e83b48807ba6ab83e716303b347bf91e', '193.48.143.177', 1554276493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237363439333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('0957e81b8e381912000aff5c352d78a3f31c555a', '193.48.143.177', 1554276847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237363834373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('5f9b0a4781b0fbbe2ac3bd95bd13c4092c9f0acd', '193.48.143.177', 1554277479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237373437393b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b),
('dc872ca4e7052496ea0b451202b71ebb0e1353a3', '193.48.143.177', 1554277862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535343237373836323b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223134223b);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email_validation_key` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_activity` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `pseudo`, `email`, `password`, `email_validation_key`, `active`, `last_activity`) VALUES
(14, 'Sevla', 'dasilvaalvesb@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '9c50023acb07dc3cd5f7653f0cdec28fbc0efd19', 1, '2019-04-03 09:48:18'),
(13, 'Keyser', 'dasilvaalvesb@hotmail.fr', '7c222fb2927d828af22f592134e8932480637c0d', '5f8a6e17ede4abd83878190b587a1b1e47a61c24', 1, '2019-04-02 19:42:44');

-- --------------------------------------------------------

--
-- Table structure for table `pokedex`
--

CREATE TABLE `pokedex` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `hp` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `sp_attack` int(11) NOT NULL,
  `sp_defense` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokedex`
--

INSERT INTO `pokedex` (`id`, `name`, `hp`, `attack`, `defense`, `sp_attack`, `sp_defense`, `speed`, `description`) VALUES
(1, 'Bulbizarre', 45, 49, 49, 65, 65, 45, 'Il a une étrange graine plantée sur son dos. Elle grandit avec lui depuis sa naissance.'),
(2, 'Herbizarre', 60, 62, 63, 80, 80, 60, 'Il a un bulbe sur son dos. On dit que s\'il absorbe assez de nutriments, ce bulbe se transforme en une jolie fleur.'),
(3, 'Florizarre', 80, 82, 83, 100, 100, 80, 'Ses pétales lui servent à capter la lumière du soleil. Il peut ainsi en canaliser l\'énergie.'),
(4, 'Salameche', 39, 52, 43, 60, 50, 65, 'La flamme sur sa queue représente l\'énergie vitale de Salamèche. Quand il est vigoureux, elle brûle plus fort.'),
(5, 'Reptincel', 58, 64, 58, 80, 65, 80, 'Il se sert de sa queue pour faire tomber ses adversaires. Une fois qu\'ils sont au sol, il les lacère de ses griffes acérées.'),
(6, 'Dracaufeu', 78, 84, 78, 109, 85, 100, 'Quand il crache son souffle brûlant, la flamme au bout de sa queue s\'embrase.'),
(7, 'Carapuce', 44, 48, 65, 50, 64, 43, 'Il se réfugie dans sa carapace et réplique en éclaboussant l\'ennemi à la première occasion.'),
(8, 'Carabaffe', 59, 63, 80, 65, 80, 58, 'Attaqué, il cache sa tête dans sa carapace, mais son corps trop gros ne peut y tenir en entier.'),
(9, 'Tortank', 79, 83, 100, 85, 105, 78, 'Il écrase ses adversaires de tout son poids pour leur faire perdre connaissance. Il rentre dans sa carapace s\'il se sent en danger.');

-- --------------------------------------------------------

--
-- Table structure for table `pokedex_capacity`
--

CREATE TABLE `pokedex_capacity` (
  `id_pokedex` int(11) NOT NULL,
  `id_capacity` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokedex_capacity`
--

INSERT INTO `pokedex_capacity` (`id_pokedex`, `id_capacity`, `level`) VALUES
(1, 84, 0),
(4, 87, 0),
(4, 65, 0),
(7, 84, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pokedex_evolution`
--

CREATE TABLE `pokedex_evolution` (
  `id_from` int(11) NOT NULL,
  `id_to` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokedex_evolution`
--

INSERT INTO `pokedex_evolution` (`id_from`, `id_to`, `level`) VALUES
(1, 2, 16),
(2, 3, 32),
(4, 5, 16),
(5, 6, 36),
(7, 8, 16),
(8, 9, 36);

-- --------------------------------------------------------

--
-- Table structure for table `pokedex_type`
--

CREATE TABLE `pokedex_type` (
  `id_pokedex` int(11) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokedex_type`
--

INSERT INTO `pokedex_type` (`id_pokedex`, `id_type`) VALUES
(1, 9),
(1, 10),
(2, 9),
(2, 10),
(3, 9),
(3, 10),
(4, 5),
(5, 5),
(6, 5),
(6, 15),
(7, 3),
(8, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `xp` int(11) NOT NULL,
  `%_hp` float NOT NULL,
  `id_trainer` int(11) NOT NULL,
  `id_pokedex` int(11) NOT NULL,
  `in_team` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokemon`
--

INSERT INTO `pokemon` (`id`, `level`, `xp`, `%_hp`, `id_trainer`, `id_pokedex`, `in_team`) VALUES
(11, 1, 0, 100, 14, 1, 1),
(10, 1, 0, 100, 13, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_capacity`
--

CREATE TABLE `pokemon_capacity` (
  `id_pokemon` int(11) NOT NULL,
  `id_capacity` int(11) NOT NULL,
  `pp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pokemon_capacity`
--

INSERT INTO `pokemon_capacity` (`id_pokemon`, `id_capacity`, `pp`) VALUES
(10, 87, 35),
(10, 65, 40),
(11, 84, 35);

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `pokedollar` int(11) NOT NULL DEFAULT '50',
  `pokeball` int(11) NOT NULL DEFAULT '5',
  `potion` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`id`, `name`, `pokedollar`, `pokeball`, `potion`) VALUES
(14, 'Sevla', 500, 13, 6),
(13, 'Keyser', 50, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `capacity`
--
ALTER TABLE `capacity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `ci_session`
--
ALTER TABLE `ci_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pokedex`
--
ALTER TABLE `pokedex`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pokedex_capacity`
--
ALTER TABLE `pokedex_capacity`
  ADD PRIMARY KEY (`id_pokedex`,`id_capacity`),
  ADD KEY `id_capacity` (`id_capacity`);

--
-- Indexes for table `pokedex_evolution`
--
ALTER TABLE `pokedex_evolution`
  ADD PRIMARY KEY (`id_from`,`id_to`),
  ADD KEY `id_to` (`id_to`);

--
-- Indexes for table `pokedex_type`
--
ALTER TABLE `pokedex_type`
  ADD PRIMARY KEY (`id_pokedex`,`id_type`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_trainer` (`id_trainer`),
  ADD KEY `id_pokedex` (`id_pokedex`);

--
-- Indexes for table `pokemon_capacity`
--
ALTER TABLE `pokemon_capacity`
  ADD PRIMARY KEY (`id_pokemon`,`id_capacity`),
  ADD KEY `id_capacity` (`id_capacity`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
