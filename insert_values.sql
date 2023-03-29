-- insertion table hebergement avec parametized query

INSERT INTO Hebergement (
coordonnees_lattitude,
coordonnees_longitude,
saison,
superficie,
prix,
animaux,
reservable,
nombre_chambres,
animaux_acceptes,
reservation_partagee,
service_reservation,
location_direct,
caution_particulier,
caution_professionel,
fiche_hebergement,
capacite)

VALUES (
:coordonnees_lattitude,
:coordonnees_longitude,
:saison,
:superficie,
:prix,
:animaux,
:reservable,
:nombre_chambres,
:animaux_acceptes,
:reservation_partagee,
:service_reservation,
:location_direct,
:caution_particulier,
:caution_professionel,
:fiche_hebergement,
:capacite);