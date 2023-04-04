-- ~~~~~ 4e Requête : Supression ~~~~~
USE gites_de_france;

DELETE FROM Avis 
WHERE id=(SELECT Avis.id FROM Avis
INNER JOIN Reservation ON Avis.id_reservation = Reservation.id
INNER JOIN Utilisateur ON Reservation.id_utilisateur = Utilisateur.id
WHERE Utilisateur.id = 9);