-- ~~~~~ 2e Requête : Affichage 1~~~~~

SELECT 
Hebergement.*,
DISTING JSON_ARRAYAGG(DEquipementExt.label),
JSON_ARRAYAGG(EquipementInt.label),
JSON_ARRAYAGG(OptionHebergement.label),
JSON_ARRAYAGG(Service.label),
JSON_ARRAYAGG(ThemeSejour.label),
GROUP_CONCAT(Departement.code, Departement.nom SEPARATOR ' ,'),
Hote.*,
JSON_ARRAYAGG(Photo.lien_cdn),
Chambre.*,
Avis.*,
Classement.label

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

LEFT JOIN Departement ON Hebergement.id_departement = Departement.id

LEFT JOIN Hote ON Hebergement.id_hote = Hote.id

LEFT JOIN Photo ON Hebergement.id = Photo.id_hebergement

LEFT JOIN Chambre ON Hebergement.id = Chambre.id_hebergement

LEFT JOIN Avis ON Hebergement.id = Avis.id_hebergement

LEFT JOIN Classement ON Hebergement.nombre_epis = Classement.nombre_epis

WHERE Hebergement.id = 2;