-- ### Script de création des tables ###


-- ----------------------------------------------------------
-- 1) Creation des tables ne contenant pas de clés étrangères
-- ----------------------------------------------------------

CREATE TABLE Utilisateur(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   email VARCHAR(320) NOT NULL,
   mdp VARCHAR(255) NOT NULL,
   civilite BOOLEAN NOT NULL,
   date_naissance DATE NOT NULL,
   telephone VARCHAR(20) NOT NULL,
   pays_residence VARCHAR(2) NOT NULL,
   societe VARCHAR(255),
   adresse_postale VARCHAR(255) NOT NULL,
   complement_adresse VARCHAR(255),
   code_postal VARCHAR(5) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   cedex VARCHAR(2),
   date_creation DATE NOT NULL,
   est_admin BOOLEAN NOT NULL,
   photo_profil VARCHAR(255) NOT NULL
);

CREATE TABLE CategorieBien(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Service(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE EquipementExt(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE EquipementInt(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Classement(
   nombre_epis INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE ThemeSejour(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Accessibilite(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE OptionHebergement(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   label VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Region(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Departement(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   code VARCHAR(255) NOT NULL UNIQUE,
   nom VARCHAR(255) NOT NULL UNIQUE,
   id_region INTEGER NOT NULL,
   FOREIGN KEY(id_region) REFERENCES Region(id)
);

CREATE TABLE Hote(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   date_labellise DATE NOT NULL,
   telephone VARCHAR(20) NOT NULL,
   email VARCHAR(320) NOT NULL
);

CREATE TABLE Hote_Utilisateur(
   id_hote INTEGER NOT NULL,
   id_utilisateur INTEGER NOT NULL,
   FOREIGN KEY(id_hote) REFERENCES Hote(id),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id)
);

CREATE TABLE Langue(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   langue VARCHAR(50) NOT NULL
);


-- -------------------------------------------
-- 2) Creation des tables avec clés étrangères
-- -------------------------------------------

CREATE TABLE Hebergement(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   coordonnees_latitude DECIMAL(10,8) NOT NULL,
   coordonnees_longitude DECIMAL(10,8) NOT NULL,
   caution DECIMAL(15,2) NOT NULL,
   capacite INTEGER NOT NULL,
   nbr_chambres INTEGER NOT NULL,
   surface_habitable INTEGER NOT NULL,
   type VARCHAR(255) NOT NULL,
   periode_ouverture VARCHAR(255) NOT NULL,
   commune VARCHAR(255) NOT NULL,
   adresse_postale VARCHAR(255) NOT NULL,
   code_postal VARCHAR(5) NOT NULL,
   fiche_hebergement VARCHAR(255) NOT NULL,
   date_debut_saison DATE NOT NULL,
   animaux_acceptes BOOLEAN NOT NULL,
   reservable_en_ligne BOOLEAN NOT NULL,
   trophees_clients BOOLEAN NOT NULL,
   id_hote INTEGER NOT NULL,
   id_departement INTEGER NOT NULL,
   nombre_epis INTEGER NOT NULL,
   FOREIGN KEY(id_hote) REFERENCES Hote(id),
   FOREIGN KEY(id_departement) REFERENCES Departement(id),
   FOREIGN KEY(nombre_epis) REFERENCES Classement(nombre_epis)
);

CREATE TABLE Disponibilite(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   date_debut DATE NOT NULL,
   date_fin DATE NOT NULL,
   id_hebergement INTEGER NOT NULL,
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id)
);

CREATE TABLE Photo(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   lien_cdn VARCHAR(255),
   id_hebergement INTEGER,
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id)
);

CREATE TABLE Reservation(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   date_arrivee DATETIME NOT NULL,
   date_depart DATETIME NOT NULL,
   nombre_adultes INTEGER NOT NULL,
   nombre_enfants INTEGER NOT NULL,
   nombre_nourissons INTEGER NOT NULL,
   civilite VARCHAR(3) NOT NULL,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   adresse VARCHAR(255) NOT NULL,
   complement_adresse VARCHAR(255),
   code_postal VARCHAR(5) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   pays VARCHAR(2) NOT NULL,
   telephone1 VARCHAR(20) NOT NULL,
   telephone2 VARCHAR(20),
   email VARCHAR(320) NOT NULL,
   mdp VARCHAR(255) NOT NULL,
   accepter_newsletter BOOLEAN NOT NULL,
   payee BOOLEAN NOT NULL,
   id_utilisateur INTEGER NOT NULL,
   id_hebergement INTEGER NOT NULL,
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id)
);

CREATE TABLE DemandeHebergement(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nature_projet VARCHAR(255) NOT NULL,
   commune VARCHAR(255) NOT NULL,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   email VARCHAR(320) NOT NULL,
   telephone VARCHAR(255) NOT NULL,
   message TEXT NOT NULL,
   date_creation DATE NOT NULL,
   statut_verifie BOOLEAN NOT NULL,
   id_departement INTEGER NOT NULL,
   id_hote INTEGER NOT NULL,
   FOREIGN KEY(id_departement) REFERENCES Departement(id),
   FOREIGN KEY(id_hote) REFERENCES Hote(id)
);

CREATE TABLE CodePromotionnel(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   code_promo VARCHAR(255) NOT NULL,
   remise DECIMAL(3,2) NOT NULL,
   id_reservation INTEGER NOT NULL,
   id_utilisateur INTEGER NOT NULL,
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id)
);

CREATE TABLE Chambre(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   photo VARCHAR(255) NOT NULL,
   description TEXT NOT NULL,
   nbr_lits_simple INTEGER NOT NULL,
   nbr_lits_double INTEGER NOT NULL,
   wc_privee BOOLEAN NOT NULL,
   salle_bain_privee BOOLEAN NOT NULL,
   douche_privees BOOLEAN NOT NULL,
   tv_privee BOOLEAN NOT NULL,
   id_hebergement INTEGER NOT NULL,
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id)
);

CREATE TABLE Avis(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   note_generale INTEGER NOT NULL,
   note_proprete INTEGER NOT NULL,
   note_accueil INTEGER NOT NULL,
   note_confort INTEGER NOT NULL,
   note_rapportQP INTEGER NOT NULL,
   date_deposition DATE NOT NULL,
   commentaire TEXT NOT NULL,
   reponse_hote TEXT,
   id_reservation INTEGER NOT NULL,
   id_hebergement INTEGER NOT NULL,
   UNIQUE(id_reservation),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id)
);

CREATE TABLE Assurance(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   pays VARCHAR(2) NOT NULL,
   lien_pdf VARCHAR(50) NOT NULL,
   id_reservation INTEGER,
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id)
);

CREATE TABLE PeriodeSaison(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   nom VARCHAR(255) NOT NULL,
   tarif INTEGER NOT NULL,
   id_hebergement INTEGER NOT NULL,
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id)
);

CREATE TABLE DatesPeriodeSaison(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   debut DATE NOT NULL,
   fin DATE NOT NULL,
   id_periode INTEGER NOT NULL,
   FOREIGN KEY(id_periode) REFERENCES PeriodeSaison(id)
);


-- ---------------------------------
-- 3) Creation des tables de liaison
-- ---------------------------------

CREATE TABLE Hebergement_Service(
   id_hebergement INTEGER NOT NULL,
   id_service INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_service),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id),
   FOREIGN KEY(id_service) REFERENCES Service(id)
);

CREATE TABLE Accessibilite_Hebergement(
   id_hebergement INTEGER NOT NULL,
   id_accessible INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_accessible),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id),
   FOREIGN KEY(id_accessible) REFERENCES Accessibilite(id)
);

CREATE TABLE Hebergement_ThemeSejour(
   id_hebergement INTEGER NOT NULL,
   id_theme_sejour INT NOT NULL,
   PRIMARY KEY(id_hebergement, id_theme_sejour),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id),
   FOREIGN KEY(id_theme_sejour) REFERENCES ThemeSejour(id)
);

CREATE TABLE EquipementInt_Hebergement(
   id_hebergement INTEGER NOT NULL,
   id_equipement_int INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_equipement_int),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id),
   FOREIGN KEY(id_equipement_int) REFERENCES EquipementInt(id)
);

CREATE TABLE EquipementExt_Hebergement(
   id_hebergement INTEGER NOT NULL,
   id_equipement_ext INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_equipement_ext),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id),
   FOREIGN KEY(id_equipement_ext) REFERENCES EquipementExt(id)
);

CREATE TABLE Hebergement_OptionHebergement(
   id_hebergement INTEGER NOT NULL,
   id_option INT NOT NULL,
   PRIMARY KEY(id_hebergement, id_option),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id),
   FOREIGN KEY(id_option) REFERENCES OptionHebergement(id)
);

CREATE TABLE CategorieBien_Hebergement(
   id_hebergement INTEGER NOT NULL,
   id_categorie_bien INTEGER NOT NULL,
   PRIMARY KEY(id_hebergement, id_categorie_bien),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id),
   FOREIGN KEY(id_categorie_bien) REFERENCES CategorieBien(id)
);

CREATE TABLE Hote_Langue(
   id_hote INTEGER NOT NULL,
   id_langue INTEGER NOT NULL,
   PRIMARY KEY(id_hote, id_langue),
   FOREIGN KEY(id_hote) REFERENCES Hote(id),
   FOREIGN KEY(id_langue) REFERENCES Langue(id)
);

CREATE TABLE Chambre_Reservation(
   id_reservation INTEGER NOT NULL,
   id_chambre INTEGER NOT NULL,
   PRIMARY KEY(id_reservation, id_chambre),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id),
   FOREIGN KEY(id_chambre) REFERENCES Chambre(id)
);
