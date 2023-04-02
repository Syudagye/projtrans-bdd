-- ~~~~~ 1e Requête : Insertion ~~~~~

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

-- ~~~~~ 2e Requête : Affichage 1~~~~~
SELECT 
Hebergement.*,  
JSON_ARRAYAGG(EquipementExt.label),
JSON_ARRAYAGG(EquipementInt.label), 
JSON_ARRAYAGG(CategorieBien.label),
JSON_ARRAYAGG(OptionHebergement.label), 
JSON_ARRAYAGG(Service.label), 
JSON_ARRAYAGG(ThemeSejour.label),  
JSON_ARRAYAGG(Accessibilite.label),  
GROUP_CONCAT(Departement.code, Departement.nom SEPARATOR ' ,'),
Hote.*,  
JSON_ARRAYAGG(Photo.lien_cdn),  
Chambre.*,  
Avis.*,  
GROUP_CONCAT(PeriodeSaison.nom, PeriodeSaison.tarif SEPARATOR ' ,'),
JSON_ARRAYAGG(Classement.label)

FROM Hebergement

LEFT JOIN EquipementExt_Hebergement ON Hebergement.id = EquipementExt_Hebergement.id_hebergement
LEFT JOIN EquipementExt ON EquipementExt_Hebergement.id_equipement_ext = EquipementExt.id


LEFT JOIN EquipementInt_Hebergement ON Hebergement.id = EquipementInt_Hebergement.id_hebergement
LEFT JOIN EquipementInt ON EquipementInt_Hebergement.id_equipement_int = EquipementInt.id

LEFT JOIN CategorieBien_Hebergement ON Hebergement.id = CategorieBien_Hebergement.id_hebergement
LEFT JOIN CategorieBien ON CategorieBien_Hebergement.id_categorie_bien = CategorieBien.id


LEFT JOIN Hebergement_OptionHebergement ON Hebergement.id = Hebergement_OptionHebergement.id_hebergement
LEFT JOIN OptionHebergement ON Hebergement_OptionHebergement.id_option = OptionHebergement.id

LEFT JOIN Hebergement_Service ON Hebergement.id = Hebergement_Service.id_hebergement
LEFT JOIN Service ON Hebergement_Service.id_service = Service.id

LEFT JOIN Hebergement_ThemeSejour ON Hebergement.id = Hebergement_ThemeSejour.id_hebergement
LEFT JOIN ThemeSejour ON Hebergement_ThemeSejour.id_theme_sejour = ThemeSejour.id

LEFT JOIN Accessibilite_Hebergement ON Hebergement.id = Accessibilite_Hebergement.id_hebergement
LEFT JOIN Accessibilite ON Accessibilite_Hebergement.id_accessible = Accessibilite.id

LEFT JOIN Departement ON Hebergement.id_departement = Departement.id

LEFT JOIN Hote ON Hebergement.id_hote = Hote.id

LEFT JOIN Photo ON Hebergement.id = Photo.id_hebergement

LEFT JOIN Chambre ON Hebergement.id = Chambre.id_hebergement

LEFT JOIN Avis ON Hebergement.id = Avis.id_hebergement

LEFT JOIN PeriodeSaison ON Hebergement.id = PeriodeSaison.id_hebergement

LEFT JOIN Classement ON Hebergement.nombre_epis = Classement.nombre_epis

WHERE Hebergement.id = 2;


-- ~~~~~ 3e Requête : Modification ~~~~~
UPDATE Reservation
SET payee = 0
WHERE id = 0;

-- ~~~~~ 4e Requête : Affichage 2 ~~~~~
DELETE FROM Avis 
WHERE id=(SELECT Avis.id FROM Avis
INNER JOIN Reservation ON Avis.id_reservation = Reservation.id
INNER JOIN Utilisateur ON Reservation.id_utilisateur = Utilisateur.id
WHERE Utilisateur.id = 9);