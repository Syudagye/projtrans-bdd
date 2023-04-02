# Projet Transversal Base de Données

<sup>Réalisé par Samuel RESSIOT, Alexis DEMONT, Enzo LAHAYE, Toscan LETULLIER et Maxime PICO<sup/>

## Fichiers et Rendus

Vous trouverez le compte rendu rédigé [dans ce google doc][doc-rendu].

D'autre fichiers sont aussi à votre disposition:
- [Le dictionnaire de données][dico] ainsi que le graphe de dépendance fonctionnelles
(situé sur le même document, mais sur un autre page, accessible en bas de l'interface de google docs)
- Le [MCD][mcd] et [MLD][mld], au format [looping][looping].
- [Le cahier des charges][monkas]

[doc-rendu]: https://docs.google.com/document/d/1sbfEMbjXPSe-90sBl1_OQGTHZuhHDpTwfHTCxo6qAqI/edit?usp=sharing
[dico]: https://docs.google.com/spreadsheets/d/1Vig4XA_3-VH6DWeNc9zAR5k3Yn6IOxXtWgvs6g5tWmE/edit?usp=sharing
[mcd]: https://docs.google.com/spreadsheets/d/1Vig4XA_3-VH6DWeNc9zAR5k3Yn6IOxXtWgvs6g5tWmE/edit?usp=sharing
[mld]: https://drive.google.com/file/d/196GG2aNc3gqJqohAbfttr3Pz-fdoJo_7/view?usp=sharing
[looping]: https://www.looping-mcd.fr
[monkas]: https://drive.google.com/file/d/16gONbFvKBjyPST-mTrVheQ_bAhk8y2ug/view?usp=sharing

## Scripts de Creation de la BDD

Cette repository contient les script permettant la création et l'initialisation de la base de données, ainsi que les 5 scripts demandés dans le cahier des charges.

Les scripts:
- [`create_tables.sql`](https://github.com/Syudagye/projtrans-bdd/blob/master/create_tables_V1.sql) - Script de création des tables de la base de donnée
- [`insert_values.sql`](https://github.com/Syudagye/projtrans-bdd/blob/master/insert_values.sql) - Script d'insertion des données exemples
- [`all_requests.sql`](https://github.com/Syudagye/projtrans-bdd/blob/master/all_requests.sql) - Script regroupant les deux premiers et permettant la création de la base de donnée MySQL (Utilisée pour faciliter les tests).
