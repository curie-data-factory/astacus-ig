Création d’une filière francilienne d’excellence fondée sur des données numériques et interopérables en anatomie et cytologie pathologiques.

### Objectifs

Dans le cadre du projet Astacus, ce document présente un projet de portail pour la mise à disposition de métadonnées et de données de lames d’ACP dématérialisées (images + métadonnées). Il inclut :
* La liste des parties prenantes, les objectifs du projet, son périmètre et un calendrier prévisionnel
* Une description des besoins identifiés et, en lien, des spécifications fonctionnelles qui en découlent
* Une description technique des éléments envisagés pour la mise en œuvre du portail.

### Introduction

#### Parties prenantes

##### AP-HP

* Anatomopathologie, Bicêtre
    * Pr Catherine Guettier
* DNS, Innovation Données
    * Noël Lucas (contact APHP suivi du projet Astacus)
    * Stéphane Bréant (gestion des grands projets)
    * Cendrine Baudoin (gestion des grands projets)
    * Vincent Rubod (responsable technique projets)
    * Aurélien Maire (imagerie)
    * David Ouagne (interopérabilité)
    * Julien Dubiel (portail)
* DRCI
    * à définir
* DST
    * à définir

##### Société Tribun Health

* Bertran de Fürst (Senior Partnerships Manager)
* Sylvain Roux (CTO)

##### Institut Gustave Roussy

* Pr Jean-Yves Scoazec (Département de biologie et pathologie médicales, anatomopathologiste)
* Sylvain Ducroz (Direction)
* Christophe Mattler (Transformation numérique et des systèmes d'information)

##### Institut Pierre et Marie Curie

* Pr Anne Salomon (Pôle de Médecine Diagnostique et Théranostique)
* Pr Yves Allory (Service d'anatomopathologie)
* Dr Amaury Martin (Valorisation, Données, Programme Médico-Scientifique)
* Xose Fernandez (Direction des Data)

##### ARS Région Ile de France


##### Collégiale anatomopathologie

* Pr Thierry Molina (Anatomie et cytologie pathologiques, Necker-Enfants Malades)

#### Objectifs fonctionnels du projet Astacus

La convention signée entre l'APHP et l'ARS Ile de France précise que le projet a pour objectif de numériser les données d’anatomie et cytologie pathologiques (ACP) produites dans le cadre du soin par l’Assistance Publique - Hôpitaux de Paris, Gustave Roussy et l’Institut Curie, puis de valoriser ce patrimoine régional de données numériques en ouvrant son accès aux médecins, chercheurs, industriels de la santé et startups pour permettre l’élaboration, la certification et la validation d’outils algorithmiques et d’IA d’aide à la décision médicale.

Dans un 1e temps, il est convenu de la mise en place d'un portail qui permettrait à un acteur autorisé de constituer une cohorte de lames virtuelles concernant une pathologie test en interrogeant les éléments cliniques et biologiques pertinentsleurs métadonnées, ou celles liées à celles-ci, et mises à disposition par chacun des sites.

#### Calendrier prévisionnel

| N°  | Tâche | Acteur | Date prévisionnelle |
|-----|-------|--------|---------------------|
| 1   |       |        |                     |
| 2   |       |        |                     |

### Expression du besoin

#### Point de situation de chacun des établissements

##### Pathologie digitale dans le cadre du soin

La numérisation des données d’ACP des 3 établissements participants au projet est aujourd’hui avancée de manière hétérogène.

* A l’AP-HP
    * X (1 ?) site totalement digitalisé
    * X sites en cours de digitalisation, en lien avec des projets distincts d'équipement ou de recherche [note, à détailler ; structuration hétérogène ; 3 sites et 3 situations différentes – identification des technologies, logiciels, etc.]
* À l’Institut Pierre et Marie Curie [à compléter]
* À l’Institut Gustave Roussy [à compléter]

##### Réutilisation des données d'ACP dans le cadre de la recherche et de l'innovation

* A l’AP-HP 
  * L'intégration depuis le soin vers l'espace des données de santé de l’EDS du flux des métadonnées du SGL (DIAMIC) est planifiée [note, priorisation et date à valider]
  * Le processus de mise à disposition de lames virtuelles est en cours de conception

#### Besoins identifiés

Le projet ASTACUS doit permettre la réalisation de projets de recherche ou d’innovation multicentriques dans le domaine de l’ACP.

Dans le cadre de règles de gouvernance définies au sein du consortium, le caractère multicentrique implique la mise en œuvre :
* d'un processus d’instruction des demandes d'accès au portail commun aux 3 établissements
  * débutant sur le portail avec la requête initiale en vue de la constitution d'une cohorte
  * et aboutissant à la mise à disposition d'un espace de travail avec l'ensemble des données des lames virtuelles liées à la requête, ainsi que des données liées
* de la mise en place des éléments techniques, portail / plateforme, permettant respectivement la mise en œuvre des requêtes puis les échanges des données liées à ces requêtes, en lien avec les sites concernés.

La plateforme permet également une restitution de l’activité de recherche (nombre, caractéristiques et statut des projets, nombre et caractéristiques des sites ASTACUS) 

Les caractéristiques des sites doivent permettre aux utilisateurs de disposer d’informations sur les ressources disponibles au niveau des sites (catalogue de données, capacité de calcul, etc.)

##### Gouvernance d'accès aux données

À discuter et détailler. Pourrait inclure :

* La mise en place d’un comité de pilotage représentant les parties prenantes et nommant les membres d’un comité scientifique 
* La mise en place du comité scientifique

Sous leur égide, les modalités de demande d’accès puis d’instruction de celles-ci pourront être élaborées incluant en particulier l’évaluation de l’intérêt scientifique, de la faisabilité du projet et du respect des règles éthiques.

##### Valorisations économiques et scientifiques

À discuter en lien avec les 2 comités :

* Cout des prestations
* Politique de valorisation scientifique

##### Aspects réglementaires et juridiques

Organisation en amont d’un cadre juridique permettant un traitement rapide et simplifié des demandes.

##### Schéma envisagé d'obtention des données pour la mise en œuvre d'un projet

<div style="text-align:center"><img src="astacus-schemageneral.png"></div>

La mise en œuvre d’un projet de recherche comporte les phases suivantes :

0. Préparation dans les 3 établissements d’un catalogue d’éléments cliniques et biologiqueses données pertinents pouvant être en partie issues d’une sélection d’attributs liés aux métadonnées des lames virtuelles disponibles et pouvant être mises à disposition.
   La création du catalogue implique :
* le choix de standards d’interopérabilité autorisant l’interfaçage des données
* la liste et le type des données à mettre à disposition
  * les modalités du choix des lames ainsi mises à disposition :
    * pathologie(s)
    * type de lames 
      * contexte (soins ou recherche ; prospectif ou rétrospectif, …)
1. Connexion sécurisée par un utilisateur autorisé sur une interface type portail pour la mise en œuvre d’une requête de recherche de lames virtuelles via les attributs sélectionnables du catalogue en vue de la constitution d’une cohorte
2. Résultat de la requête : nombre de lames virtuelles par site
3. Transmission à chacun des établissements des informations pour la mise en œuvre interne des requêtes permettant de rassembler les lames et les données d’intérêts liées
4. Récupération des données depuis les établissements et regroupement vers un entrepôt adapté
5. Mise à disposition des données sur un espace de travail pour l’utilisateur ayant mis en œuvre la requête. Mise à disposition de jeux de données : lames digitales + métadonnées + données cliniques et biologiques

Le périmètre fonctionnel du « portail » est initialement limité à ces fonctionnalités de base.

### Description de la solution technique pour le « portail »

![Schéma technique général](astacus-ptf-schemageneral.png)

![Diagramme de séquence](astacus-ptf-sequence.png)