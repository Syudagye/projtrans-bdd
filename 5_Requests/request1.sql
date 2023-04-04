-- ~~~~~ 1e Requête : Insertion ~~~~~
USE gites_de_france;

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
    '2023-04-01', 1, 1, 0, 1, 41, 2),
    (43.65251600, -0.91739400, 100.00,
    8, 4, 50, "Chambre d'hôtes", "Toute l'année",
    'CLERMONT', '490 Chemin de Provence', 40180, 'https://widget-fngf.itea.fr/fichePrint.php?ident=gites40_b2023.1.30415.H&exercice=2023&deb=13/04/2023&nbj=1&exe=2023',
    '2023-04-01', 0, 1, 0, 2, 41, 3);