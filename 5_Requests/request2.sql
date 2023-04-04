-- ~~~~~ 2e Requête : Affichage 1~~~~~
USE gites_de_france;

SELECT
    Hebergement.*,
    JSON_ARRAYAGG(DISTINCT EquipementExt.label) as equipement_exterieur,
    JSON_ARRAYAGG(DISTINCT EquipementInt.label) as equipement_interieur,
    JSON_ARRAYAGG(DISTINCT CategorieBien.label) as categories_bien,
    JSON_ARRAYAGG(DISTINCT OptionHebergement.label) as options_hebergement,
    JSON_ARRAYAGG(DISTINCT Service.label) as services,
    JSON_ARRAYAGG(DISTINCT ThemeSejour.label) as theme,
    JSON_ARRAYAGG(DISTINCT Accessibilite.label) as accessibilite,
    JSON_ARRAYAGG(DISTINCT JSON_OBJECT(
            'date_debut', Disponibilite.date_debut,
            'date_fin', Disponibilite.date_fin
    )) as dates_sejour,
    JSON_ARRAYAGG(DISTINCT JSON_OBJECT(
            'code', Departement.code,
            'nom', Departement.nom
    )) as departement,
    Hote.*,
    JSON_ARRAYAGG(DISTINCT Photo.lien_cdn) as photos,
    Chambre.*,
    Avis.*,
    JSON_ARRAYAGG(DISTINCT JSON_OBJECT(
            'nom', PeriodeSaison.nom,
            'tarif', PeriodeSaison.tarif
    )) as tarifs,
    JSON_ARRAYAGG(DISTINCT Classement.label) as classement
FROM Hebergement

LEFT JOIN EquipementExt_Hebergement ON Hebergement.id = EquipementExt_Hebergement.id_hebergement
LEFT JOIN EquipementExt ON EquipementExt_Hebergement.id_equipement_ext = EquipementExt.id


LEFT JOIN EquipementInt_Hebergement ON Hebergement.id = EquipementInt_Hebergement.id_hebergement
LEFT JOIN EquipementInt ON EquipementInt_Hebergement.id_equipement_int = EquipementInt.id

LEFT JOIN Hebergement_OptionHebergement ON Hebergement.id = Hebergement_OptionHebergement.id_hebergement
LEFT JOIN OptionHebergement ON Hebergement_OptionHebergement.id_option = OptionHebergement.id

LEFT JOIN Hebergement_Service ON Hebergement.id = Hebergement_Service.id_hebergement
LEFT JOIN Service ON Hebergement_Service.id_service = Service.id

LEFT JOIN Hebergement_ThemeSejour ON Hebergement.id = Hebergement_ThemeSejour.id_hebergement
LEFT JOIN ThemeSejour ON Hebergement_ThemeSejour.id_theme_sejour = ThemeSejour.id

LEFT JOIN Accessibilite_Hebergement ON Hebergement.id = Accessibilite_Hebergement.id_hebergement
LEFT JOIN Accessibilite ON Accessibilite_Hebergement.id_accessible = Accessibilite.id

LEFT JOIN Disponibilite ON Hebergement.id = Disponibilite.id_hebergement

LEFT JOIN Departement ON Hebergement.id_departement = Departement.id

LEFT JOIN Hote ON Hebergement.id_hote = Hote.id

LEFT JOIN Photo ON Hebergement.id = Photo.id_hebergement

LEFT JOIN Chambre ON Hebergement.id = Chambre.id_hebergement

LEFT JOIN Avis ON Hebergement.id = Avis.id_hebergement

LEFT JOIN Classement ON Hebergement.nombre_epis = Classement.nombre_epis

WHERE Hebergement.id = 2;
