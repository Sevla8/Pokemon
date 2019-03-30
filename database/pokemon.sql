-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 30 mars 2019 à 15:31
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ci_session`
--

INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ssmi3mdaotmul48im9gi7lck1adf7ins', '::1', 1552497170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323439373137303b),
('olse4pmrid9q0in4nopslihavqeem7n4', '::1', 1552499296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323439393239363b70736575646f7c733a373a225261697a656e73223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b),
('vggmfp65op7qqtko5eujm8l5qbd30tsg', '::1', 1552499297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323439393239363b),
('repvob5pote4r1ukarn058khsqv0kdhp', '::1', 1552755243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323735353234333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b),
('ta9sg9996a2crjj46btmd1mrfjh3f42h', '::1', 1552755397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323735353234333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b),
('3s4igpgcr3jrcm6tenaerof78fcfbj6p', '::1', 1552822503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323832323530323b),
('nfapgq822h9ce7b4a9dc2kliiqk4br6c', '::1', 1553850244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835303234343b),
('u72cbvschpdjn6ihrjo4107jotuld9km', '::1', 1553850633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835303633333b),
('mh3c56h2qsp3of7eh325sd6prt4s04il', '::1', 1553851078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835313037383b),
('a3tfr4hp9rbrbc3fb8dpvce82i954755', '::1', 1553851476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835313437363b),
('lptrn01njft1kuqb5tgolfqkr65gl0i3', '::1', 1553852215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835323231353b),
('giakhkoflnm63c1r50ccf35s9ncqummg', '::1', 1553852659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835323635393b),
('7ova3bdqmt2im86i3bg753vdsv5m35o0', '::1', 1553854339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835343333393b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b),
('af4eqdslfqvmmajcinut6bnk31b82l6c', '::1', 1553854890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835343839303b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b),
('6186qmei6uq07fln9j22ktll207jtepe', '::1', 1553855733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835353733333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b),
('itohkdki8tc6onfu37u0sbqmnc3dn5fu', '::1', 1553856663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835363636333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b),
('f7o0h6bsb214dvp2havileo0ppbaoodp', '::1', 1553856255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333835363135343b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2234223b),
('eim6l6rlatbgs5nvn32mipnh4clkr3f7', '::1', 1553861581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836313538313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2234223b),
('p36nrpa25jbl46ge3imovq4bat44ag9i', '::1', 1553865288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836353238383b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2234223b),
('quf77t5piqur058min6ushliergf8mgt', '::1', 1553865703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836353730333b),
('2r570ag548uhev05sngje4dcveclufcv', '::1', 1553866224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836363232343b),
('2ufqqrr952ilcmsu4fjki72tq8j0fsv1', '::1', 1553866527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836363532373b),
('098bn2o9ssojv680vgnorfa46kfeiaqn', '::1', 1553867230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836373233303b),
('qblr59romo6sdh162ngtsj7ch9cd0hof', '::1', 1553867225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836373231373b),
('e7a25ujuhmg5qfra5tjtufjpmo9h4m2t', '::1', 1553867638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836373633383b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('kd0pvgc966p4mbmc39v61i5e370e6cqv', '::1', 1553868016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836383031363b),
('qp9ir329v27qkru2o44s7o15bh2lugle', '::1', 1553868386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836383338363b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('pat0c83dgvlcghenftfvof742pqo48kg', '::1', 1553869002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836393030323b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('2rsehma821l0n2k2n9pt3b84ijdrvuts', '::1', 1553869370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333836393337303b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('cuq504rbovpn76b7g84ida2nslcleo8b', '::1', 1553870328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837303332383b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('14ace25tmutgekd681krij92s7cus0f3', '::1', 1553870633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837303633333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('hrv57k5c0gl6j0ptug0afo2cismv22t7', '::1', 1553871719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837313731393b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('qrrc7hcbvdqgp29bputu8esn9nb4u44t', '::1', 1553872249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837323234393b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('b2e6t9urecppd106ab2mghkk42044smu', '::1', 1553872966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837323936363b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('3ktlqcknfre0pd771bqosrfl9fpfdi4o', '::1', 1553873281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837333238313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('78hk7i8pmu12fdnviotojao6bkbgkg9k', '::1', 1553874180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837343138303b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('31rqqhc5c3919lti9pl4t2ft1helbg8j', '::1', 1553874546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837343534363b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('18qp72jgdgbd6fdgch04cdghi46bnnpf', '::1', 1553874881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837343838313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a313a2239223b),
('m54fhd2ls29bdsdce5d1h0fijvatmhb4', '::1', 1553875625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837353632353b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('cj4lmoievdnukov0339nu2fjpmfo6ki8', '::1', 1553875065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837353036343b),
('2lm90dlos3jp87le86h3m6ug1rfnk5kg', '::1', 1553875912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333837353931323b),
('k27ei16efd5mh1ndfmm9cvdnm2rh6t2c', '::1', 1553945821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333934353832313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('lip5ld51ui4346f595c165vdhjk28j16', '::1', 1553946419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333934363431393b),
('nlgisr336cgorg90uivgv8p6hdo42cp5', '::1', 1553946794, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333934363739343b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('jbcmsnfj2f8dpdo65th8lj8trpu0k70u', '::1', 1553947207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333934373230373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('ufnm8r3s15cku4kl3fhiq3m8cf0gja45', '::1', 1553949687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333934393638373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('o80p1ok6onao78fdo9ho4iqpm9spem7c', '::1', 1553950153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935303135333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('brk322khlv65prteqpnt29ioq26sd79e', '::1', 1553950697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935303639373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('bpl0vg0c7i5oh2p1h44drh342bv3tu0q', '::1', 1553951031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935313033313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('8nsg6ejlicdabprgcchh5hkhdeu41h46', '::1', 1553951508, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935313530383b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('v369uocqst64hpf83hsoo5vppoo9sv57', '::1', 1553951912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935313931323b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('0tdesgt597qpet1vrjprvupc54g3govr', '::1', 1553952482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935323438323b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('81sp5s1pc9bgnnlb9svlf854g5oerlq2', '::1', 1553952908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935323930383b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('ir4639me7j94n06iahrb1u4bcqa6t7b1', '::1', 1553953413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935333431333b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('pfubomugonte9u5lrs8i5j79b1gcedm2', '::1', 1553956867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935363836373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('4t9t67mpp6e7bfmehpivnl8ikeci0ifu', '::1', 1553957276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935373237363b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('on2jgj85jhlr7grah79pfp025kd05jaj', '::1', 1553957687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935373638373b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('djh5hd8kau1lv141qumg9r9k5qu9gd9s', '::1', 1553958256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935383235363b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('dsk3rkuv76fb2q5a6u866m2u6s5ftqmb', '::1', 1553958564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935383536343b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('6mvspb93pch48lm6r3qi3c3lg51kql1g', '::1', 1553958880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935383838303b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b),
('mm2dobmdgsf7re8gd8167h2557qm0peq', '::1', 1553959341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935393334313b),
('9p0rsj4nvuaq51l23fltcmg1nr2tsada', '::1', 1553959358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333935393334313b70736575646f7c733a353a225365766c61223b70617373776f72647c733a34303a2237633232326662323932376438323861663232663539323133346538393332343830363337633064223b69647c733a323a223132223b);

-- --------------------------------------------------------

--
-- Structure de la table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email_validation_key` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_activity` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `member`
--

INSERT INTO `member` (`id`, `pseudo`, `email`, `password`, `email_validation_key`, `active`, `last_activity`) VALUES
(12, 'Sevla', 'dasilvaalvesb@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'eae6547d9346c932c7cd5ecd3437716b3e88b999', 1, '2019-03-30 15:22:21');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex`
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
-- Structure de la table `pokedex_capacity`
--

DROP TABLE IF EXISTS `pokedex_capacity`;
CREATE TABLE IF NOT EXISTS `pokedex_capacity` (
  `id_pokedex` int(11) NOT NULL,
  `id_capacity` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id_pokedex`,`id_capacity`),
  KEY `id_capacity` (`id_capacity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex_capacity`
--

INSERT INTO `pokedex_capacity` (`id_pokedex`, `id_capacity`, `level`) VALUES
(1, 84, 0),
(4, 87, 0),
(4, 65, 0),
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex_evolution`
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
-- Structure de la table `pokedex_type`
--

DROP TABLE IF EXISTS `pokedex_type`;
CREATE TABLE IF NOT EXISTS `pokedex_type` (
  `id_pokedex` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  PRIMARY KEY (`id_pokedex`,`id_type`),
  KEY `id_type` (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokedex_type`
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
  KEY `id_trainer` (`id_trainer`),
  KEY `id_pokedex` (`id_pokedex`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `level`, `xp`, `%_hp`, `id_trainer`, `id_pokedex`, `in_team`) VALUES
(9, 1, 0, 100, 12, 7, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pokemon_capacity`
--

INSERT INTO `pokemon_capacity` (`id_pokemon`, `id_capacity`, `pp`) VALUES
(9, 84, 35);

-- --------------------------------------------------------

--
-- Structure de la table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
CREATE TABLE IF NOT EXISTS `trainer` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `pokedollar` int(11) NOT NULL DEFAULT '50',
  `pokeball` int(11) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `trainer`
--

INSERT INTO `trainer` (`id`, `name`, `pokedollar`, `pokeball`) VALUES
(12, 'Sevla', 200, 20);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
