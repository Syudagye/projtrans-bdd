-- Utiliser la requête suivante pour permettre de supprimer la BDD lors de tests des fichiers
DROP DATABASE gites_de_france;

-- On crée la BDD "gites_de_france"
CREATE DATABASE gites_de_france;

-- On se place sur la BDD "gites_de_france"
USE gites_de_france;

-- Creation des tables
source create_tables.sql

-- Insertion des données
source insert_values.sql
