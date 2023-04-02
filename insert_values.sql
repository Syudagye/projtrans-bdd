-- ### Script d'insertion des données ###

INSERT INTO Utilisateur
(nom, prenom, email, mdp, civilite,
date_naissance, telephone, pays_residence,
societe, adresse_postale, complement_adresse,
code_postal, ville, cedex, date_creation, est_admin, photo_profil)
VALUES
    ('Dupont', 'Jean', 'jean.dupont@gmail.com', 'motdepasse1', 1,
    '1990-01-01', '0102030405', 'FR',
    'Société A', '1 Rue du Commerce', NULL,
    '75001', 'Paris', NULL, DATE(NOW()), 0, 'photo1.jpg'),

    ('Durand', 'Sophie', 'sophie.durand@yahoo.com', 'motdepasse2', 0,
    '1995-02-15', '0607080910', 'FR',
    'Société B', '2 Rue du Château', 'Bâtiment A, 3ème étage',
    '69002', 'Lyon', NULL, DATE(NOW()), 0, 'photo2.jpg'),

    ('Martin', 'Pierre', 'pierre.martin@hotmail.com', 'motdepasse3', 1,
    '1985-06-10', '0601020304', 'FR',
    'Société C', '3 Avenue des Fleurs', NULL,
    '13006', 'Marseille', NULL, DATE(NOW()), 1, 'photo3.jpg'),

    ('Lambert', 'Lucas', 'lucas.lambert@gmail.com', 'pass123', 1,
    '1990-07-23', '0612345678', 'FR',
    'ACME', '5 rue des Champs', NULL,
    '75001', 'Paris', NULL, DATE(NOW()), 0, 'default.png'),

    ('DUPOUY', 'Lucette', 'yvon.dupouy@orange.fr', 'motdepasse', 0,
    '1985-02-12', '0676705943', 'FR',
    'Gite Landais', '435 rue des templiers', NULL,
    '40660', 'MOLIETS', NULL, '2018-03-16', 0, 'default.png'),

    ('DUDAI', 'Véronique', 'veroniquedubai@outlook.fr', 'meilleureschambres', 0,
    '1976-12-16', '0558893176', 'FR',
    'Aquitaine le boss.', 'Chemin de provence', NULL,
    '40180', 'CLERMONT', NULL, '2019-03-19', 0, 'default.png'),

    ('DUDAI', 'Pascal', 'veroniquedubai@outlook.fr', 'meilleureschambresdumonde', 0,
    '1976-05-30', '0558893176', 'FR',
    'Aquitaine le boss.', 'Chemin de provence', NULL,
    '40180', 'CLERMONT', NULL, '2019-03-19', 0, 'default.png'),

    ('Dupont', 'Jean', 'jean.dupont@yahoo.fr', 'password', 1,
    '1978-09-10', '0634567890', 'FR',
    'Beta Corp.', '24 avenue des Peupliers', NULL,
    '31000', 'Toulouse', NULL, DATE(NOW()), 0, 'default.png'),

    ('DEMONT', 'Alexis', 'alexis.demont@gmeil.com', 'bestdelegue', 1,
    '2004-06-30', '0612345678', 'FR',
    NULL, '114 rue Lucien Faure', NULL,
    '33000', 'Bordeaux', NULL, DATE(NOW()), 1, 'defaut.png');

INSERT INTO CategorieBien(label)
VALUES
    ('Insolite'),
    ('Citybreak'),
    ('Maison de plain pied'),
    ('Maison individuelle');

INSERT INTO Service(label)
VALUES
    ('Point de recharge électrique'),
    ('Tout compris'),
    ('Spa'),
    ('Sauna'),
    ('Hammam'),
    ('Sauna et/ou spa et/ou hammam'),
    ('Wifi-Internet'),
    ('Draps et linge fournis'),
    ('Equipement bébé'),
    ("Table d'hôtes"),
    ('Vélo / VTT'),
    ('Chauffage inclus'),
    ('Charges incluses'),
    ('Draps fournis'),
    ('Linge de maison fourni'),
    ('Ménage inclus'),
    ('Linge de toilette fourni');

INSERT INTO EquipementExt(label)
VALUES
    ('Point de recharge électrique'),
    ('Piscine'),
    ('Terrain clos'),
    ('Salon de jardin'),
    ('Jardin clos'),
    ('Terrase'),
    ('Jardin'),
    ('Garage - privé'),
    ('Barbecue'),
    ('Jeux enfants');

INSERT INTO EquipementInt(label)
VALUES
    ('Poêle à pellets'),
    ('Piscine intérieure'),
    ('Télévision'),
    ('Lave-vaisselle'),
    ('Lave-linge'),
    ('Air conditionné'),
    ('Cheminée'),
    ('Sèche-linge'),
    ('Congélateur'),
    ('Poêle à bois'),
    ('Micro-ondes');

INSERT INTO Classement(label)
VALUES
    ('1 épi'),
    ('2 épis'),
    ('3 epis / Confort'),
    ('4 épis / Premium'),
    ('5 épis / Luxury');

INSERT INTO ThemeSejour(label)
VALUES
    ('Ecogestes'),
    ('Ecogîtes'),
    ('Télétravail'),
    ('Demeures de caractère'),
    ('Montagne'),
    ('Mer'),
    ('A la ferme'),
    ('Bienvenue à la ferme'),
    ('Bienvenue aux animaux'),
    ('Hébergement de prestige'),
    ('Bien-être'),
    ('Insolite'),
    ('Pêche'),
    ('Ski'),
    ('Ski de piste'),
    ('Ski de fond'),
    ('Equitation'),
    ('VTT - Cyclo'),
    ('Oenotourisme'),
    ('Randonnées'),
    ('Motard'),
    ('Campagne'),
    ('Ville');

INSERT INTO Accessibilite(label)
VALUES
    ('Handicap mental'),
    ('Handicap moteur'),
    ('Handicap auditif'),
    ('Handicap visuel');

INSERT INTO OptionHebergement(label)
VALUES
    ('Ménage fin de séjour'),
    ('Draps lit 2 personnes'),
    ('Draps lit 1 personne'),
    ('Forfait chauffage'),
    ('Linge de maison'),
    ('Bois de chauffage'),
    ('Suppément Animaux'),
    ("Tables d'hôtes (premier repas)");

INSERT INTO Region(nom)
VALUES
    ('Alsace'),
    ('Aquitaine'),
    ('Auvergne'),
    ('Bourgogne'),
    ('Bretagne'),
    ('Centre'),
    ('Champagne-Ardenne'),
    ('Corse'),
    ('Franche-Comté'),
    ('Languedoc-Roussillon'),
    ('Limousin'),
    ('Lorraine'),
    ('Midi-Pyrénées'),
    ('Nord-Pas-de-Calais'),
    ('Normandie'),
    ('Pays-de-la-Loire'),
    ('Picardie'),
    ('Poitou-Charentes'),
    ("Provence-Alpes-Côte-d'Azur"),
    ('Rhône Alpes'),
    ('Outre-Mer'),
    ('Île-de-France');

INSERT INTO Departement(code, nom, id_region)
VALUES
    ('01', 'Ain', 20),
    ('02', 'Aisne', 17),
    ('03', 'Allier', 3),
    ('04', 'Alpes-de-Haute-Provence', 19),
    ('05', 'Hautes-Alpes', 19),
    ('06', 'Alpes-Maritimes', 19),
    ('07', 'Ardèche', 20),
    ('08', 'Ardennes', 7),
    ('09', 'Ariège', 13),
    ('10', 'Aube', 7),
    ('11', 'Aude', 10),
    ('12', 'Aveyron', 13),
    ('13', 'Bouches-du-Rhône', 19),
    ('14', 'Calvados', 15),
    ('15', 'Cantal', 3),
    ('16', 'Charente', 18),
    ('17', 'Charente-Maritime', 18),
    ('18', 'Cher', 6),
    ('19', 'Corrèze', 11),
    ('2A', 'Corse-du-Sud', 8),
    ('2B', 'Haute-Corse', 8),
    ('21', "Côte-d'Or", 4),
    ('22', "Côtes-d'Armor", 5),
    ('23', 'Creuse', 11),
    ('24', 'Dordogne', 2),
    ('25', 'Doubs', 9),
    ('26', 'Drôme', 20),
    ('27', 'Eure', 15),
    ('28', 'Eure-et-Loir', 6),
    ('29', 'Finistère', 5),
    ('30', 'Gard', 10),
    ('31', 'Haute-Garonne', 13),
    ('32', 'Gers', 13),
    ('33', 'Gironde', 2),
    ('34', 'Hérault', 10),
    ('35', 'Ille-et-Vilaine', 5),
    ('36', 'Indre', 6),
    ('37', 'Indre-et-Loire', 6),
    ('38', 'Isère', 20),
    ('39', 'Jura', 9),
    ('40', 'Landes', 2),
    ('41', 'Loir-et-Cher', 6),
    ('42', 'Loire', 20),
    ('43', 'Haute-Loire', 3),
    ('44', 'Loire-Atlantique', 16),
    ('45', 'Loiret', 6),
    ('46', 'Lot', 13),
    ('47', 'Lot-et-Garonne', 2),
    ('48', 'Lozère', 10),
    ('49', 'Maine-et-Loire', 16),
    ('50', 'Manche', 15),
    ('51', 'Marne', 7),
    ('52', 'Haute-Marne', 7),
    ('53', 'Mayenne', 16),
    ('54', 'Meurthe-et-Moselle', 12),
    ('55', 'Meuse', 12),
    ('56', 'Morbihan', 5),
    ('57', 'Moselle', 12),
    ('58', 'Nièvre', 4),
    ('59', 'Nord', 14),
    ('60', 'Oise', 17),
    ('61', 'Orne', 15),
    ('62', 'Pas-de-Calais', 14),
    ('63', 'Puy-de-Dôme', 3),
    ('64', 'Pyrénées-Atlantiques', 2),
    ('65', 'Hautes-Pyrénées', 13),
    ('66', 'Pyrénées-Orientales', 10),
    ('67', 'Bas-Rhin', 1),
    ('68', 'Haut-Rhin', 1),
    ('69', 'Rhône', 20),
    ('70', 'Haute-Saône', 9),
    ('71', 'Saône-et-Loire', 4),
    ('72', 'Sarthe', 16),
    ('73', 'Savoie', 20),
    ('74', 'Haute-Savoie', 20),
    ('75', 'Paris', 22),
    ('76', 'Seine-Maritime', 15),
    ('77', 'Seine-et-Marne', 22),
    ('78', 'Yvelines', 22),
    ('79', 'Deux-Sèvres', 18),
    ('80', 'Somme', 17),
    ('81', 'Tarn', 13),
    ('82', 'Tarn-et-Garonne', 13),
    ('83', 'Var', 19),
    ('84', 'Vaucluse', 19),
    ('85', 'Vendée', 16),
    ('86', 'Vienne', 18),
    ('87', 'Haute-Vienne', 11),
    ('88', 'Vosges', 12),
    ('89', 'Yonne', 4),
    ('90', 'Territoire de Belfort', 9),
    ('91', 'Essonne', 22),
    ('92', 'Hauts-de-Seine', 22),
    ('93', 'Seine-Saint-Denis', 22),
    ('94', 'Val-de-Marne', 22),
    ('95', "Val-d'Oise", 22),
    ('971', 'Guadeloupe', 21),
    ('972', 'Martinique', 21),
    ('973', 'Guyane', 21),
    ('974', 'La Réunion', 21),
    ('976', 'Mayotte', 21);

INSERT INTO Hote(nom, date_labellise, telephone, email)
VALUES
    ('La maison landaise de Mâa', '2018-03-16', '0558487601', 'yvon.dupouy@orange.fr'),
    ('La Forge de Clermont', '2017-05-01', '0558893176', 'veroniquebudai@outlook.fr');

INSERT INTO Hote_Utilisateur(id_hote, id_utilisateur)
VALUES
    (1, 6),
    (2, 7),
    (2, 8);

INSERT INTO Langue(langue)
VALUES
    ('Français'),
    ('Anglais'),
    ('Espagnol'),
    ('Allemand'),
    ('Italien'),
    ('Brésilien'),
    ('Chinois'),
    ('Russe');

INSERT INTO Hebergement
(coordonnees_latitude, coordonnees_longitude, caution,
capacite, nbr_chambres, surface_habitable, type, periode_ouverture,
commune, adresse_postale, code_postal, fiche_hebergement,
date_debut_saison, animaux_acceptes, reservable_en_ligne,
trophees_clients, id_hote, id_departement, nombre_epis)
VALUES
    (43.86293550, -1.35453090, 300.00,
    11, 7, 1050, 'Gîte', "Toute l'année",
    'Moliets', '435 rue des templiers', 40660, 'https://widget-fngf.itea.fr/fichePrint.php?ident=gites40_b2023.1.20795.G&exercice=2023&deb=08/04/2023&nbj=7&exe=2023',
    '2023-04-01', 1, 1,
    0, 1, 41, 2),
    (43.65251600, -0.91739400, 100.00,
    8, 4, 50, "Chambre d'hôtes", "Toute l'année",
    'CLERMONT', '490 Chemin de Provence', 40180, 'https://widget-fngf.itea.fr/fichePrint.php?ident=gites40_b2023.1.30415.H&exercice=2023&deb=13/04/2023&nbj=1&exe=2023',
    '2023-04-01', 0, 1,
    0, 2, 41, 3);

INSERT INTO Disponibilite(date_debut, date_fin, id_hebergement)
VALUES
    ('2023-04-04', '2023-04-15', 1),
    ('2023-04-17', '2023-04-30', 1),
    ('2023-04-04', '2023-04-13', 2),
    ('2023-04-17', '2023-04-28', 2);

INSERT INTO Photo(lien_cdn, id_hebergement)
VALUES
    ("https://www.gites-de-france.com/sites/default/files/styles/gallery/public/images/381396/381396-4_20795_23cfd4eddfe05f47eb76e27b6fe02ad9.jpg?itok=5ZdKALQr", 1),
    ("https://www.gites-de-france.com/sites/default/files/styles/gallery/public/images/381396/381396-0_20795_d3687b70aec99d5ad3f1ba2e0db6d976.jpg?itok=OVqnzpw_", 1),
    ("https://www.gites-de-france.com/sites/default/files/styles/gallery/public/images/400759/400759-0_30415_a66ad23d20e0935f16d6e9526ca09100.jpg?itok=DgdFwETt", 2),
    ("https://www.gites-de-france.com/sites/default/files/styles/gallery/public/images/400759/400759-1_30415_207df419287d84be22ba5205dc68a769.jpg?itok=dzUQEiMJ", 2);

INSERT INTO Reservation
(date_arrivee, date_depart, nombre_adultes, nombre_enfants,
nombre_nourissons, civilite, nom, prenom,
adresse, code_postal, ville, pays,
telephone1, email, mdp, accepter_newsletter,
payee, id_utilisateur, id_hebergement)
VALUES
    ('2023-04-15', '2023-04-22', 2, 0,
    0, 'Mr.', 'DEMONT', 'Alexis',
    '114 rue Lucien Faure', '33000', 'Bordeaux', 'FR',
    '0612345678', 'alexis.demont@gmail.com', 'bestdelegue', 1,
    1, 9, 1),

    ('2023-06-10', '2023-06-11', 2, 1,
    0, 'Mr.', 'RESSIOT', 'Samuel',
    '113 rue Lucien Faure', '33290', 'Margaux', 'FR',
    '0672598327', 'samortlamort@gmail.com', 'cbonpourvous', 0,
    1, 9, 2);

INSERT INTO DemandeHebergement
(nature_projet, commune,
nom, prenom, email, telephone,
message, date_creation, statut_verifie, id_departement, id_hote)
VALUES
    ("Blablabla", 'MOLIETS',
    'DUPOUY', 'Lucette', 'yvon.dupouy@orange.fr', '0676705943',
    "J'aimerai partager mon gîte à plus de monde",
    '2018-01-03', 0, 41, 1);

INSERT INTO CodePromotionnel(code_promo, remise, id_reservation, id_utilisateur)
VALUES
    ('4dz6q4d46zq4dz1dz56q16d1zq65d1', 0.90, 1, 9);

INSERT INTO Chambre
(nom, photo,
description,
nbr_lits_simple, nbr_lits_double, wc_privee, salle_bain_privee, douche_privees, tv_privee, id_hebergement)
VALUES
    ('CHAMBRE 1 : ROMANCE', 'https://widget-fngf.itea.fr/photos/gites40/G/photo9/30415.jpg',
    "Chambre pour une ou deux personnes joliment décorée dans le style romantique. Salle d'eau avec wc communicante et privée. 14 m². Télévision. Entièrement refaite en 2020",
    0, 1, 1, 0, 1, 1, 2),

    ('CHAMBRE 2 : RIVAGE', "https://widget-fngf.itea.fr/photos/gites40/G/photo3/30415.jpg",
    "Chambre 2 personnes avec couchage en 160. Télévision, salle d'eau avec wc et fenêtre donnant sur la piscine et le jardin. Armoire de rangement. Entièrement refaite en 2021",
    0, 1, 1, 0, 1, 1, 2),

    ('CHAMBRE 3 : RIVIERA', 'https://widget-fngf.itea.fr/photos/gites40/G/photo7/30415.jpg',
    "Petite chambre avec lit 160 ou 2 lits 80 si séparés, placard, bureau et salle d'eau avec wc. Entièrement refaite en 2021",
    0, 1, 1, 0, 1, 1, 2),

    ('CHAMBRE 4 : LE SALEYA', 'https://widget-fngf.itea.fr/photos/gites40/G/photo30/30415.jpg',
    "Chambre en annexe, environ 20 m², style chalet. Couchage en 160, salle d'eau privative avec wc. Terrasse privative avec mobilier de jardin. Entièrement refaite en 2019",
    0, 1, 1, 0, 1, 1, 2);

INSERT INTO Avis
(note_generale, note_proprete, note_accueil, note_confort, note_rapportQP,
date_deposition, commentaire, id_reservation, id_hebergement)
VALUES
    (5, 5, 5, 5, 5,
    '2022-04-12', "Une très bonne adresse. Idéalement placé dans le charmant pays de la Chalosse pour visiter les Landes, le Bordelais ou le Pays-Basque. Les chambres sont refaites à neufs et parfaites pour quelques nuits.
    Les propriétaires sont très acceuillants et serviables. Une des meilleures adresses Gîtes de France où nous avons séjourné.",
    1, 2);

INSERT INTO Assurance(pays, lien_pdf, id_reservation)
VALUES
    ('FR', 'gites-de-france/assurances/MaisonLandaise.pdf', 1);

INSERT INTO Hebergement_Service(id_hebergement, id_service)
VALUES
    (1, 7),
    (2, 3),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 10),
    (2, 13);

INSERT INTO Hebergement_ThemeSejour(id_hebergement, id_theme_sejour)
VALUES
    (1, 9),
    (1, 6),
    (2, 9),
    (2, 11),
    (2, 22);

INSERT INTO EquipementInt_Hebergement(id_hebergement, id_equipement_int)
VALUES
    (1, 1),
    (1, 3),
    (1, 5),
    (1, 4),
    (1, 10),
    (1, 11);

INSERT INTO EquipementExt_Hebergement(id_hebergement, id_equipement_ext)
VALUES
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 7),
    (1, 9),
    (1, 10),

    (2, 2),
    (2, 3),
    (2, 5),
    (2, 6),
    (2, 7),
    (2, 10);

INSERT INTO Hebergement_OptionHebergement(id_hebergement, id_option)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),

    (2, 7),
    (2, 8);

INSERT INTO Hote_Langue(id_hote, id_langue)
VALUES
    (1, 1),
    (1, 3),
    (2, 1);

INSERT INTO Chambre_Reservation(id_reservation, id_chambre)
VALUES
    (2, 1),
    (2, 3),
    (2, 4);

