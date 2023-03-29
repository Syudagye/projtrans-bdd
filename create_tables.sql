CREATE TABLE Utilisateur(
   id_utilisateur INT,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   email VARCHAR(255),
   mdp VARCHAR(255),
   civilite LOGICAL,
   complement_adresse VARCHAR(255),
   code_postal VARCHAR(5) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   cedex VARCHAR(2),
   date_creation DATE,
   date_naissance DATE NOT NULL,
   telephone VARCHAR(255),
   pays_residence VARCHAR(2),
   est_admin LOGICAL NOT NULL,
   societe VARCHAR(255),
   adresse_postale VARCHAR(255) NOT NULL,
   photo_utilisateur VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_utilisateur)
);

CREATE TABLE TypeHebergement(
   id_type_hebergement INT,
   type_hebergement VARCHAR(255),
   PRIMARY KEY(id_type_hebergement)
);

CREATE TABLE CategorieBien(
   id_categorie_bien INT,
   type_bien VARCHAR(255),
   PRIMARY KEY(id_categorie_bien)
);

CREATE TABLE Service(
   id_service INT,
   type_service VARCHAR(255),
   PRIMARY KEY(id_service)
);

CREATE TABLE Equipement(
   id_equipement INT,
   label_equipement VARCHAR(255),
   type_equipement VARCHAR(255),
   PRIMARY KEY(id_equipement)
);

CREATE TABLE Classement(
   id_classement INT,
   label_classement VARCHAR(255),
   PRIMARY KEY(id_classement)
);

CREATE TABLE ThemeSejour(
   id_theme_sejour INT,
   label_theme_sejour VARCHAR(255),
   PRIMARY KEY(id_theme_sejour)
);

CREATE TABLE Accessibilite(
   id_accessible INT,
   label_accessibilite VARCHAR(255),
   PRIMARY KEY(id_accessible)
);

CREATE TABLE Option(
   id_option INT,
   label_option VARCHAR(255),
   PRIMARY KEY(id_option)
);

CREATE TABLE Region(
   id_region INT,
   nom_region VARCHAR(255),
   PRIMARY KEY(id_region)
);

CREATE TABLE Departement(
   id_departement INT,
   code_departement VARCHAR(255),
   nom_departement VARCHAR(255),
   id_region INT NOT NULL,
   PRIMARY KEY(id_departement),
   FOREIGN KEY(id_region) REFERENCES Region(id_region)
);

CREATE TABLE Hote(
   id_hote COUNTER,
   nom VARCHAR(255) NOT NULL,
   date_labellise DATE NOT NULL,
   telephone VARCHAR(20) NOT NULL,
   email VARCHAR(255) NOT NULL,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_hote),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE Langues(
   id_langue COUNTER,
   langue VARCHAR(2) NOT NULL,
   PRIMARY KEY(id_langue)
);

CREATE TABLE Hebergement(
   id_hebergement INT,
   coordonnees_lattitude VARCHAR(20),
   coordonnees_longitude VARCHAR(20),
   saison VARCHAR(255),
   prix INT,
   animaux LOGICAL,
   reservable LOGICAL,
   nombre_chambres INT,
   animaux_acceptes LOGICAL,
   reservation_partagees LOGICAL,
   service_reservation LOGICAL,
   location_direct LOGICAL,
   caution_particulier INT,
   caution_professionel LOGICAL,
   id_hote INT NOT NULL,
   id_departement INT NOT NULL,
   id_classement INT NOT NULL,
   id_type_hebergement INT NOT NULL,
   PRIMARY KEY(id_hebergement),
   FOREIGN KEY(id_hote) REFERENCES Hote(id_hote),
   FOREIGN KEY(id_departement) REFERENCES Departement(id_departement),
   FOREIGN KEY(id_classement) REFERENCES Classement(id_classement),
   FOREIGN KEY(id_type_hebergement) REFERENCES TypeHebergement(id_type_hebergement)
);

CREATE TABLE Photo(
   id_photo INT,
   lien_cdn VARCHAR(255),
   id_hebergement INT,
   PRIMARY KEY(id_photo),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE Reservation(
   id_reservation INT,
   date_debut DATETIME,
   date_fin DATETIME,
   nombre_adultes INT,
   nombre_enfants INT,
   nombre_nourissons INT,
   civilite VARCHAR(3),
   nom VARCHAR(50),
   prenom VARCHAR(50),
   adresse VARCHAR(255),
   complement_adresse VARCHAR(255),
   code_postal VARCHAR(5),
   ville VARCHAR(50),
   pays VARCHAR(2),
   telephone1 VARCHAR(20),
   telephone2 VARCHAR(20),
   email VARCHAR(50),
   mdp VARCHAR(255),
   accepter_newsletter LOGICAL,
   payee LOGICAL NOT NULL,
   id_utilisateur INT NOT NULL,
   id_hebergement INT NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE DemandeHebergement(
   id_demande_hebergement INT,
   departement VARCHAR(255) NOT NULL,
   commune VARCHAR(255) NOT NULL,
   nom VARCHAR(255) NOT NULL,
   prenom VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL,
   telephone VARCHAR(255) NOT NULL,
   message TEXT NOT NULL,
   date_creation DATE NOT NULL,
   statut_verifie LOGICAL NOT NULL,
   id_hote INT NOT NULL,
   PRIMARY KEY(id_demande_hebergement),
   FOREIGN KEY(id_hote) REFERENCES Hote(id_hote)
);

CREATE TABLE CodePromotionnel(
   id_code_promo COUNTER,
   code VARCHAR(255) NOT NULL,
   remise DECIMAL(3,2) NOT NULL,
   id_reservation INT,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_code_promo),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE Chambre(
   id_chambre COUNTER,
   nom VARCHAR(255) NOT NULL,
   nbr_lits_simple INT NOT NULL,
   nbr_lits_doubles INT NOT NULL,
   wc_privee LOGICAL NOT NULL,
   salle_bain_privee LOGICAL NOT NULL,
   douche_privees LOGICAL NOT NULL,
   description TEXT NOT NULL,
   photo_chambre VARCHAR(255) NOT NULL,
   id_hebergement INT NOT NULL,
   PRIMARY KEY(id_chambre),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE Avis(
   id_avis COUNTER,
   note_generale INT NOT NULL,
   note_proprietee INT NOT NULL,
   note_accueil INT NOT NULL,
   note_confort INT NOT NULL,
   note_rapportQP INT NOT NULL,
   date_deposition DATE NOT NULL,
   commentaire TEXT NOT NULL,
   reponse_hote TEXT,
   id_reservation INT NOT NULL,
   id_hebergement INT NOT NULL,
   PRIMARY KEY(id_avis),
   UNIQUE(id_reservation),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement)
);

CREATE TABLE Assurance(
   id_assurance COUNTER,
   pays VARCHAR(2) NOT NULL,
   lien_pdf VARCHAR(50) NOT NULL,
   id_reservation INT,
   PRIMARY KEY(id_assurance),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation)
);

CREATE TABLE Proposer(
   id_hebergement INT,
   id_service INT,
   PRIMARY KEY(id_hebergement, id_service),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_service) REFERENCES Service(id_service)
);

CREATE TABLE Comporter(
   id_hebergement INT,
   id_accessible INT,
   PRIMARY KEY(id_hebergement, id_accessible),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_accessible) REFERENCES Accessibilite(id_accessible)
);

CREATE TABLE Admettre(
   id_hebergement INT,
   id_theme_sejour INT,
   PRIMARY KEY(id_hebergement, id_theme_sejour),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_theme_sejour) REFERENCES ThemeSejour(id_theme_sejour)
);

CREATE TABLE Equiper(
   id_hebergement INT,
   id_equipement INT,
   PRIMARY KEY(id_hebergement, id_equipement),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_equipement) REFERENCES Equipement(id_equipement)
);

CREATE TABLE Personnaliser(
   id_hebergement INT,
   id_option INT,
   PRIMARY KEY(id_hebergement, id_option),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_option) REFERENCES Option(id_option)
);

CREATE TABLE Categoriser(
   id_hebergement INT,
   id_categorie_bien INT,
   PRIMARY KEY(id_hebergement, id_categorie_bien),
   FOREIGN KEY(id_hebergement) REFERENCES Hebergement(id_hebergement),
   FOREIGN KEY(id_categorie_bien) REFERENCES CategorieBien(id_categorie_bien)
);

CREATE TABLE Parler(
   id_hote INT,
   id_langue INT,
   PRIMARY KEY(id_hote, id_langue),
   FOREIGN KEY(id_hote) REFERENCES Hote(id_hote),
   FOREIGN KEY(id_langue) REFERENCES Langues(id_langue)
);

CREATE TABLE ReserverChambre(
   id_reservation INT,
   id_chambre INT,
   PRIMARY KEY(id_reservation, id_chambre),
   FOREIGN KEY(id_reservation) REFERENCES Reservation(id_reservation),
   FOREIGN KEY(id_chambre) REFERENCES Chambre(id_chambre)
);
