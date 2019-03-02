create table Attaques (
	id int primary key,
	Nom varchar,
	type enum 
	classe, 
	puissance int,
	precision int,
	points de pouvoir int,
	effets secondaires varchar(255)
);

insert into Attaques values (1, 'Riposte', 'combat', 'Physique', null, 100, 20, 'Inflige le double des dégâts subis par une attaque de type Normal ou Combat durant le tour, échoue sinon');
Frappe Atlas	Type combat 3G	Physique	- 	100	20	Inflige des dégâts égaux au niveau du lanceur
Double Pied	Type combat 3G	Physique	30	100	30	Frappe deux fois
Balayage	Type combat 3G	Physique	50	100	20	Peut apeurer la cible - Taux de Coups Critiques élevé
Mawashi Geri	Type combat 3G	Physique	60	85	15	Peut apeurer la cible
Pied Sauté	Type combat 3G	Physique	70	95	25	Enlève 1 PV si l'attaque échoue
Sacrifice	Type combat 3G	Physique	80	80	25	Blesse le lanceur
Pied Voltige	Type combat 3G	Physique	85	90	20	Enlève 1 PV si l'attaque échoue
Draco-Rage	Type dragon 3G	Spéciale	- 	100	10	Inflige toujours 40 PV de dégâts
Repli	Type eau 3G	- 	- 	100	40	Augmente la défense du lanceur
Écume	Type eau 3G	Spéciale	20	100	30	Peut baisser la vitesse de la cible
Claquoir	Type eau 3G	Spéciale	35	75	10	Attaque continue sur deux à cinq tours
Pistolet à O	Type eau 3G	Spéciale	40	100	25	Aucun
Bulles d'O	Type eau 3G	Spéciale	65	100	20	Peut baisser la vitesse de la cible
Cascade	Type eau 3G	Spéciale	80	100	15	Aucun
Pince-Masse	Type eau 3G	Spéciale	90	85	10	Taux de Coups Critiques élevé
Surf	Type eau 3G	Spéciale	95	100	15	Aucun
Hydrocanon	Type eau 3G	Spéciale	120	80	5	Aucun
Cage-Éclair	Type electrik 3G	- 	- 	100	20	Paralyse la cible
Éclair	Type electrik 3G	Spéciale	40	100	30	Peut paralyser la cible
Poing-Éclair	Type electrik 3G	Spéciale	75	100	15	Peut paralyser la cible
Tonnerre	Type electrik 3G	Spéciale	95	100	15	Peut paralyser la cible
Fatal-Foudre	Type electrik 3G	Spéciale	120	70	5	Peut paralyser la cible
DanseFlamme	Type feu 3G	Spéciale	15	70	15	Attaque continue sur deux à cinq tours
Flammèche	Type feu 3G	Spéciale	40	100	25	Peut brûler la cible
Poing de Feu	Type feu 3G	Spéciale	75	100	15	Peut brûler la cible
Lance-Flamme	Type feu 3G	Spéciale	95	100	15	Peut brûler la cible
Déflagration	Type feu 3G	Spéciale	120	85	5	Peut brûler la cible
Brume	Type glace 3G	- 	- 	- 	30	Empêche toute variation de stat provoquée par l'adversaire
Buée Noire	Type glace 3G	- 	- 	- 	30	Annule toute variation de stat, la confusion, les effets de
Puissance, Vampigraine, Mur Lumière et Protection
Onde Boréale	Type glace 3G	Spéciale	65	100	20	Peut baisser l'attaque la cible
Poing-Glace	Type glace 3G	Spéciale	75	100	15	Peut geler la cible
Laser Glace	Type glace 3G	Spéciale	95	100	10	Peut geler la cible
Blizzard	Type glace 3G	Spéciale	120	90	5	Peut geler la cible
Sécrétion	Type insecte 3G	- 	- 	95	40	Diminue la vitesse de la cible
Dard Nuée	Type insecte 3G	Physique	14	85	20	Attaque deux à cinq fois
Vampirisme	Type insecte 3G	Physique	20	100	15	Restaure un nombre de PV au lanceur égal
à la moitié des dégâts infligés à la cible
Double-Dard	Type insecte 3G	Physique	25	100	20	Attaque deux fois - Peut empoisoner
Adaptation	Type normal 3G	- 	- 	- 	30	Le lanceur devient du même type que l'adversaire
Affûtage	Type normal 3G	- 	- 	- 	30	Augmente l'attaque du lanceur
Armure	Type normal 3G	- 	- 	- 	30	Augmente la défense du lanceur
Berceuse	Type normal 3G	- 	- 	55	15	Endort la cible
Boul'Armure	Type normal 3G	- 	- 	- 	40	Augmente la défense du lanceur
Brouillard	Type normal 3G	- 	- 	100	20	Baisse la précision de la cible
Clonage	Type normal 3G	- 	- 	- 	10	Crée un clone qui prend les dommages à la place du lanceur,
enlève 25% des PV du lanceur
Copie	Type normal 3G	- 	- 	- 	10	Apprend une des attaques de l'advresaire au hasard
jusqu'à la fin du combat
Croissance	Type normal 3G	- 	- 	- 	40	Augmente le spécial du lanceur
Cyclone	Type normal 3G	- 	- 	100	20	Met fin au combat contre un Pokémon sauvage,
échoue contre un dresseur
Danse-Lames	Type normal 3G	- 	- 	- 	30	Augmente l'attaque du lanceur de deux niveaux
E-Coque	Type normal 3G	- 	- 	- 	10	Restaure jusqu'à la moitié des PV du lanceur
Entrave	Type normal 3G	- 	- 	55	20	Supprime durant un à huit tour une
attaque au hasard de la cible
Flash	Type normal 3G	- 	- 	70	20	Baisse la précision de la cible
Grincement	Type normal 3G	- 	- 	85	40	Baisse la défense de l'adversaire de deux niveaux
Grobisou	Type normal 3G	- 	- 	75	10	Endort la cible
Groz'Yeux	Type normal 3G	- 	- 	100	30	Baisse la défense de la cible
Hurlement	Type normal 3G	- 	- 	100	20	Met fin au combat contre un Pokémon sauvage,
échoue contre un dresseur
Intimidation	Type normal 3G	- 	- 	75	30	Paralyse la cible
Jet de Sable	Type normal 3G	- 	- 	100	15	Baisse la précision de la cible
Lilliput	Type normal 3G	- 	- 	- 	20	Augmente l'esquive du lanceur
Métronome	Type normal 3G	- 	- 	- 	10	Exécute une attaque prise au hasard dans cette liste
Mimi-Queue	Type normal 3G	- 	- 	100	30	Baisse la défense de la cible
Morphing	Type normal 3G	- 	- 	- 	10	Transforme le lanceur en le Pokémon adverse
Puissance	Type normal 3G	- 	- 	- 	30	Augmente le taux de Coups Critiques du lanceur
Reflet	Type normal 3G	- 	- 	- 	15	Augmente l'esquive du lanceur
Rugissement	Type normal 3G	- 	- 	- 	40	Baisse l'attaque de la cible
Soin	Type normal 3G	- 	- 	- 	20	Restaure jusqu'à la moitié des PV du lanceur
Trempette	Type normal 3G	- 	- 	- 	40	Aucun
Ultrason	Type normal 3G	- 	- 	55	20	Rend la cible confuse
Croc Fatal	Type normal 3G	Physique	- 	90	10	Enlève 50% des PV restants de la cible
Patience	Type normal 3G	Physique	- 	- 	10	Immobilise le lanceur deux ou trois tours, puis inflige à
l'adversaire le double des dégâts subis pendant cette période
Sonicboom	Type normal 3G	Physique	- 	90	20	Inflige toujours 20 PV de dégâts
Empal'Korne	Type normal 3G	Physique	- 	30	5	Met l'adversaire KO, échoue s'il a une vitesse
supérieure à celle du lanceur
Guillotine	Type normal 3G	Physique	- 	30	5	Met l'adversaire KO, échoue s'il a une vitesse
supérieure à celle du lanceur
Constriction	Type normal 3G	Physique	10	100	35	Peut baisser la vitesse de la cible
Étreinte	Type normal 3G	Physique	15	85	20	Attaque continue sur deux à cinq tours
Furie	Type normal 3G	Physique	15	85	20	Attaque deux à cinq fois
Ligotage	Type normal 3G	Physique	15	90	20	Attaque continue sur deux à cinq tours
Pilonnage	Type normal 3G	Physique	15	85	20	Attaque deux à cinq fois
Torgnoles	Type normal 3G	Physique	15	85	10	Attaque deux à cinq fois
Combo-Griffe	Type normal 3G	Physique	18	80	15	Attaque deux à cinq fois
Poing Comète	Type normal 3G	Physique	18	85	15	Attaque deux à cinq fois
Frénésie	Type normal 3G	Physique	20	100	20	Attaque sans fin, provoque l'augmentation de l'attaque
du lanceur à chaque fois qu'il subit des dégâts
Picanon	Type normal 3G	Physique	20	100	15	Attaque deux à cinq fois
Charge	Type normal 3G	Physique	35	95	35	Aucun
Tornade	Type normal 3G	Physique	35	100	40	Aucun
Écras'Face	Type normal 3G	Physique	40	100	35	Aucun
Griffe	Type normal 3G	Physique	40	100	35	Aucun
Jackpot	Type normal 3G	Physique	40	100	20	Fait gagner un peu d'argent à la fin des combats
Vive-Attaque	Type normal 3G	Physique	40	100	30	Attaque en premier
Coupe	Type normal 3G	Physique	50	95	30	Aucun
Poing Karaté	Type normal 3G	Physique	50	100	25	Taux de Coups Critiques élevé
Lutte	Type normal 3G	Physique	50	100	- 	Blesse le lanceur
Force Poigne	Type normal 3G	Physique	55	100	30	Aucun
Météores	Type normal 3G	Physique	60	- 	20	N'échoue jamais
Morsure	Type normal 3G	Physique	60	100	25	Peut apeurer la cible
Écrasement	Type normal 3G	Physique	65	100	20	Peut apeurer la cible
Koud'Korne	Type normal 3G	Physique	65	100	25	Aucun
Coud'Boule	Type normal 3G	Physique	70	100	15	Peut apeurer la cible
Tranche	Type normal 3G	Physique	70	100	20	Taux de Coups Critiques élevé
Uppercut	Type normal 3G	Physique	70	100	10	Aucun
Coupe-Vent	Type normal 3G	Physique	80	100	10	Attaque en deux tours, n'agit pas au premier
Croc de Mort	Type normal 3G	Physique	80	90	15	Peut apeurer la cible
Force	Type normal 3G	Physique	80	100	15	Aucun
Souplesse	Type normal 3G	Physique	80	75	20	Aucun
Triplattaque	Type normal 3G	Physique	80	100	10	Aucun
Ultimapoing	Type normal 3G	Physique	80	85	20	Aucun
Plaquage	Type normal 3G	Physique	85	100	15	Peut paralyser la cible
Bélier	Type normal 3G	Physique	90	85	20	Blesse le lanceur
Mania	Type normal 3G	Physique	90	100	20	Attaque continue sur deux ou trois tours, le
lanceur devient confus par la suite
Bomb'Œuf	Type normal 3G	Physique	100	75	16	Aucun
Coud'Krâne	Type normal 3G	Physique	100	100	15	Attaque en deux tours, n'agit pas au premier
Damoclès	Type normal 3G	Physique	100	100	15	Blesse le lanceur
Ultimawashi	Type normal 3G	Physique	120	75	5	Aucun
Destruction	Type normal 3G	Physique	130	100	5	Lanceur KO après l'attaque, ne tient compte que de la moitié de
la défense adverse, ce qui équivaut à une puissance réelle de 260
Ultralaser	Type normal 3G	Physique	150	90	5	Lanceur immobilisé au tour suivant
Explosion	Type normal 3G	Physique	170	100	5	Lanceur KO après l'attaque, ne tient compte que de la moitié de
la défense adverse, ce qui équivaut à une puissance réelle de 340
Para-Spore	Type plante 3G	- 	- 	75	30	Paralyse la cible
Poudre Dodo	Type plante 3G	- 	- 	75	15	Endort la cible
Spore	Type plante 3G	- 	- 	100	15	Endort la cible
Vampigraine	Type plante 3G	- 	- 	90	10	Draîne à chaque tour des PV de la cible vers le lanceur
Vol-Vie	Type plante 3G	Spéciale	20	100	20	Restaure un nombre de PV au lanceur égal
à la moitié des dégâts infligés à la cible
Fouet Lianes	Type plante 3G	Spéciale	35	100	10	Aucun
Méga-Sangsue	Type plante 3G	Spéciale	40	100	10	Restaure un nombre de PV au lanceur égal
à la moitié des dégâts infligés à la cible
Tranch'Herbe	Type plante 3G	Spéciale	55	95	25	Taux de Coups Critiques élevé
Danse-Fleur	Type plante 3G	Spéciale	70	100	20	Attaque continue sur deux ou trois tour, le
lanceur devient confus par la suite
Lance-Soleil	Type plante 3G	Spéciale	120	100	10	Attaque en deux tours, n'agit pas au premier
Acidarmure	Type poison 3G	- 	- 	- 	40	Augmente la défense du lanceur de deux niveaux
Gaz Toxik	Type poison 3G	- 	- 	55	40	Empoisonne la cible
Poudre Toxik	Type poison 3G	- 	- 	75	35	Empoisonne la cible
Toxik	Type poison 3G	- 	- 	85	10	Empoisonne gravement la cible
Dard-Venin	Type poison 3G	Physique	15	100	35	Peut empoisonner la cible
Purédpois	Type poison 3G	Physique	20	70	20	Peut empoisonner la cible
Acide	Type poison 3G	Physique	40	100	30	Peut baisser la défense de la cible
Détritus	Type poison 3G	Physique	65	100	20	Peut empoisonner la cible
Amnésie	Type psy 3G	- 	- 	- 	20	Augmente le spécial du lanceur de deux niveaux
Bouclier	Type psy 3G	- 	- 	- 	30	Augmente la défense du lanceur de deux niveaux
Hâte	Type psy 3G	- 	- 	- 	30	Augmente la vitesse du lanceur de deux niveaux
Hypnose	Type psy 3G	- 	- 	60	20	Endort la cible
Mur Lumière	Type psy 3G	- 	- 	- 	30	Augmente la résistance du lanceur aux attaques spéciales
Protection	Type psy 3G	- 	- 	- 	20	Augmente la résistance du lanceur aux attaques physiques
Repos	Type psy 3G	- 	- 	- 	10	Restaure tous les PV du lanceur ainsi que son statut,
le lanceur est immobilisé pendant deux tours
Télékinésie	Type psy 3G	- 	- 	80	15	Baisse la précision de la cible
Téléport	Type psy 3G	- 	- 	- 	20	Met fin au combat contre un Pokémon sauvage,
échoue contre un dresseur
Yoga	Type psy 3G	- 	- 	- 	40	Augmente l'attaque du lanceur
Vague Psy	Type psy 3G	Spéciale	- 	80	15	Inflige des dégâts variables
Choc Mental	Type psy 3G	Spéciale	50	100	25	Peut rendre la cible confuse
Rafale Psy	Type psy 3G	Spéciale	65	100	20	Peut rendre la cible confuse
Psyko	Type psy 3G	Spéciale	90	100	10	Peut baisser le spécial de la cible
Dévorêve	Type psy 3G	Spéciale	100	100	15	Restaure un nombre de PV au lanceur égal à la moitié des dégâts
infligés à la cible, ne fonctionne que si la cible est endormie
Jet-Pierres	Type roche 3G	Physique	50	65	15	Aucun
Éboulement	Type roche 3G	Physique	75	90	10	Peut apeurer la cible
Abîme	Type sol 3G	Physique	- 	30	5	Met l'adversaire KO, échoue s'il a une vitesse
supérieure à celle du lanceur
Osmerang	Type sol 3G	Physique	50	90	10	Attaque deux fois
Massd'Os	Type sol 3G	Physique	65	85	10	Peut apeurer la cible
Séisme	Type sol 3G	Physique	100	100	10	Aucun
Tunnel	Type sol 3G	Physique	100	100	10	Attaque en deux tours, le lanceur ne peut être atteint
que par Météores et Patience au premier tour
Onde Folie	Type spectre 3G	- 	- 	100	10	Rend la cible confuse
Ténèbres	Type spectre 3G	Physique	- 	100	15	Inflige des dégâts égaux au niveau du lanceur
Léchouille	Type spectre 3G	Physique	20	100	30	Peut paralyser la cible
Mimique	Type vol 3G	- 	- 	- 	20	Le lanceur utilise la dernière attaque lancée par l'adversaire
Cru-Aile	Type vol 3G	Physique	35	100	35	Aucun
Picpic	Type vol 3G	Physique	35	100	35	Aucun
Vol	Type vol 3G	Physique	70	100	15	Attaque en deux tours, le lanceur ne peut être atteint
que par Météores et Patience au premier tour
Bec Vrille	Type vol 3G	Physique	80	100	20	Aucun
Piqué	Type vol 3G	Physique	140	90	5	Attaque en deux tours, n'agit pas au premier