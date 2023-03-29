-- On se place sur la base de données "gites_de_france"
USE gites_de_france;

-- Creation des tables ne contenant pas de clés étrangères

CREATE TABLE Utilisateur(
   id_utilisateur INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL,
   mdp VARCHAR(255) NOT NULL,
   civilite BOOLEAN NOT NULL,
   complement_adresse VARCHAR(255),
   code_postal VARCHAR(5) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   cedex VARCHAR(2),
   date_creation DATE NOT NULL,
   date_naissance DATE NOT NULL,
   telephone VARCHAR(255),
   pays_residence VARCHAR(2),
   est_admin BOOLEAN NOT NULL,
   societe VARCHAR(255),
   adresse_postale VARCHAR(255) NOT NULL,
   photo_utilisateur VARCHAR(255) NOT NULL
);

CREATE TABLE TypeHebergement(
   id_type_hebergement INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   type_hebergement VARCHAR(255) NOT NULL
);

CREATE TABLE CategorieBien(
   id_categorie_bien INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   type_bien VARCHAR(255) NOT NULL
);

CREATE TABLE Service(
   id_service INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   type_service VARCHAR(255) NOT NULL
);

CREATE TABLE Equipement(
   id_equipement INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label_equipement VARCHAR(255) NOT NULL,
   type_equipement VARCHAR(255) NOT NULL
);

CREATE TABLE Classement(
   id_classement INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label_classement VARCHAR(255) NOT NULL
);

CREATE TABLE ThemeSejour(
   id_theme_sejour INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label_theme_sejour VARCHAR(255) NOT NULL
);

CREATE TABLE Accessibilite(
   id_accessible INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label_accessibilite VARCHAR(255) NOT NULL
);

CREATE TABLE Option(
   id_option INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label_option VARCHAR(255) NOT NULL
);

CREATE TABLE Region(
   id_region INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom_region VARCHAR(255) NOT NULL
);

CREATE TABLE Departement(
   id_departement INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   code_departement VARCHAR(255) NOT NULL,
   nom_departement VARCHAR(255) NOT NULL,
   id_region INTEGER NOT NULL,
   FOREIGN KEY(id_region) REFERENCES Region(id_region)
);

CREATE TABLE Hote(
   id_hote INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   date_labellise DATE NOT NULL,
   telephone VARCHAR(20) NOT NULL,
   email VARCHAR(255) NOT NULL,
   id_utilisateur INTEGER NOT NULL,
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE Langues(
   id_langue INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   langue VARCHAR(2) NOT NULL,
   PRIMARY KEY(id_langue)
);

CREATE TABLE Hebergement(
   id_hebergement INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   coordonnees_lattitude VARCHAR(20) NOT NULL,
   coordonnees_longitude VARCHAR(20) NOT NULL,
   saison VARCHAR(255) NOT NULL,
   prix INTEGER NOT NULL,
   animaux BOOLEAN NOT NULL,
   reservable BOOLEAN NOT NULL,
   nombre_chambres INT NOT NULL,
   animaux_acceptes BOOLEAN NOT NULL,
   reservation_partagees BOOLEAN NOT NULL,
   service_reservation BOOLEAN NOT NULL,
   location_direct BOOLEAN NOT NULL,
   caution_particulier INTEGER NOT NULL,
   caution_professionel BOOLEAN NOT NULL,
   id_hote INTEGER NOT NULL,
   id_departement INTEGER NOT NULL,
   id_classement INTEGER NOT NULL,
   id_type_hebergement INTEGER NOT NULL,
   FOREIGN KEY(id_hote) REFERENCES Hote(id_hote),
   FOREIGN KEY(id_departement) REFERENCES Departement(id_departement),
   FOREIGN KEY(id_classement) REFERENCES Classement(id_classement),
   FOREIGN KEY(id_type_hebergement) REFERENCES TypeHebergement(id_type_hebergement)
);

CREATE TABLE Photo(
   id_photo INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   id_hebergement INTEGER,
   lien_cdn VARCHAR(255),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE Reservation(
   id_reservation INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   date_debut DATETIME NOT NULL,
   date_fin DATETIME NOT NULL,
   nombre_adultes INTEGER,
   nombre_enfants INTEGER,
   nombre_nourissons INTEGER,
   civilite VARCHAR(3) NOT NULL,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   adresse VARCHAR(255) NOT NULL,
   complement_adresse VARCHAR(255) NOT NULL,
   code_postal VARCHAR(5) NOT NULL,
   ville VARCHAR(50) NOT NULL,
   pays VARCHAR(2) NOT NULL,
   telephone1 VARCHAR(20) NOT NULL,
   telephone2 VARCHAR(20) NOT NULL,
   email VARCHAR(50) NOT NULL,
   mdp VARCHAR(255) NOT NULL,
   accepter_newsletter BOOLEAN NOT NULL,
   payee BOOLEAN NOT NULL,
   id_utilisateur INTEGER NOT NULL,
   id_hebergement INTEGER NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE DemandeHebergement(
   id_demande_hebergement INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   departement VARCHAR(255) NOT NULL,
   commune VARCHAR(255) NOT NULL,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL,
   telephone VARCHAR(255) NOT NULL,
   message LONGTEXT NOT NULL, -- le message n'as pas de limite sur le site
   date_creation DATE NOT NULL,
   statut_verifie BOOLEAN NOT NULL,
   id_hote INT NOT NULL,
   FOREIGN KEY(id_hote) REFERENCES Hote(id_hote)
);

CREATE TABLE CodePromotionnel(
   id_code_promo INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   code VARCHAR(255) NOT NULL,
   remise DECIMAL(3,2) NOT NULL,
   id_reservation INTEGER NOT NULl,
   id_utilisateur INTEGER NOT NULL,
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE Chambre(
   id_chambre INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   nbr_lits_simple INTEGER NOT NULL,
   nbr_lits_doubles INTEGER NOT NULL,
   wc_privee BOOLEAN NOT NULL,
   salle_bain_privee BOOLEAN NOT NULL,
   douche_privees BOOLEAN NOT NULL,
   description LONGTEXT NOT NULL,
   photo_chambre VARCHAR(255) NOT NULL,
   id_hebergement INTEGER NOT NULL,
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE Avis(
   id_avis INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   note_generale INT NOT NULL,
   note_proprietee INT NOT NULL,
   note_accueil INT NOT NULL,
   note_confort INT NOT NULL,
   note_rapportQP INT NOT NULL,
   date_deposition DATE NOT NULL,
   commentaire LONGTEXT NOT NULL,
   reponse_hote LONGTEXT,
   id_reservation INT NOT NULL,
   id_hebergement INT NOT NULL,
   PRIMARY KEY(id_avis),
   UNIQUE(id_reservation),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE Assurance(
   id_assurance INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   pays VARCHAR(2) NOT NULL,
   lien_pdf VARCHAR(50) NOT NULL,
   id_reservation INTEGER,
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation)
);

CREATE TABLE Proposer(
   id_hebergement INTEGER NOT NULL,
   id_service INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_service),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_service) REFERENCES Service(id_service)
);

CREATE TABLE Comporter(
   id_hebergement INTEGER NOT NULL,
   id_accessible INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_accessible),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_accessible) REFERENCES Accessibilite(id_accessible)
);

CREATE TABLE Admettre(
   id_hebergement INTEGER NOT NULL,
   id_theme_sejour INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_theme_sejour),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_theme_sejour) REFERENCES ThemeSejour(id_theme_sejour)
);

CREATE TABLE Equiper(
   id_hebergement INTEGER NOT NULL,
   id_equipement INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_equipement),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_equipement) REFERENCES Equipement(id_equipement)
);

CREATE TABLE Personnaliser(
   id_hebergement INTEGER NOT NULL,
   id_option INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_option),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_option) REFERENCES Option(id_option)
);

CREATE TABLE Categoriser(
   id_hebergement INTEGER NOT NULL,
   id_categorie_bien INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_categorie_bien),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_categorie_bien) REFERENCES CategorieBien(id_categorie_bien)
);

CREATE TABLE Parler(
   id_hote INTEGER NOT NULL,
   id_langue INTEGER NOT NULL,
   PRIMARY KEY(id_hote, id_langue),
   FOREIGN KEY(id_hote) REFERENCES Hote(id_hote),
   FOREIGN KEY(id_langue) REFERENCES Langues(id_langue)
);

CREATE TABLE ReserverChambre(
   id_reservation INTEGER NOT NULL,
   id_chambre INTEGER NOT NULL,
   PRIMARY KEY(id_reservation, id_chambre),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation),
   FOREIGN KEY(id_chambre) REFERENCES Chambre(id_chambre)
);
