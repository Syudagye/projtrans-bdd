-- ~~~~~ 5e Requête : Affichage 3~~~~~
USE gites_de_france;

SELECT * FROM Hebergement
INNER JOIN Departement ON Hebergement.id_departement = Departement.id
INNER JOIN Region ON Departement.id_region = Region.id
INNER JOIN Disponibilite ON Hebergement.id = Disponibilite.id_hebergement
WHERE Region.nom = 'Aquitaine' AND capacite = 11 AND Disponibilite.date_debut <= '2023-04-05' 
AND Disponibilite.date_fin >= '2023-04-14' ;