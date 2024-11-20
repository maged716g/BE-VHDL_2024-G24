# Comptage et affichage des secondes (TP de base)

## Introduction

Ce projet consiste à créer un système de comptage et d'affichage des secondes de 0 à 9 à l'aide de l'outil Quartus II et de la carte DE2. L'objectif est de visualiser l'écoulement des secondes sur un afficheur à 7 segments en utilisant un oscillateur à quartz de 50 MHz.


## Étapes du Projet

### 1. Génération du Signal de 1 Hz

#### Objectif

Réaliser un signal de fréquence 1 Hz à partir de l'horloge de 50 MHz.

#### Instructions

- **Diviseur de fréquence** : Réaliser un diviseur de fréquence en VHDL.
- **Création du symbole** : Créer un symbole pour le diviseur.

### 2. Réalisation du Compteur BCD

#### Compteur  BCD

- **Objectif** : Réaliser un compteur BCD simple avec 1 entrée d'horloge `H` et 4 sorties 


### 4. Réalisation du Décodeur 7 Segments

- **Objectif** : Réaliser un décodeur BCD vers 7 segments.

## Technologies Utilisées

- **Outil de Développement** : Quartus II
- **Langage** : VHDL
- **Matériel** : Carte DE2


# PWM (TP de base)
## Description
Ce projet met en œuvre un générateur de signal PWM écrit en VHDL. Il a été conçu pour produire un signal PWM configurable avec une résolution de 8 bits. L'objectif est de répondre à un cahier des charges typique d’un circuit de modulation de largeur d’impulsion, avec une fréquence et un rapport cyclique prédéfinis.

Le design inclut une simulation fonctionnelle et est prêt à être déployé sur des cartes FPGA comme la DE2 ou la DE0 Nano.
## Structure
Le projet est divisé en deux grandes parties :

1. **Le Compteur**
Ce processus incrémente un compteur de 8 bits à chaque cycle d'horloge. Quand il atteint la valeur maximale (255), il revient à zéro. En cas de réinitialisation (reset_n), il est remis à zéro immédiatement.

2. **Le Comparateur**
Ce processus compare en permanence la valeur actuelle du compteur avec le rapport cyclique. En fonction de cette comparaison, il génère le signal PWM :

Haut (1) si la valeur du compteur est inférieure au rapport cyclique.
Bas (0) sinon.

# Projet BE ""Barre Franche""
Dans le cadre de ce projet, nous devions implémenter une fonction simple et une fonction complexe.
Pour la fonction simple, nous avons fait un "circuit d'acquisition de la vitesse du vent". De plus, nous avons fait la deuxième fonction simple (en plus), à savoir un "circuit interface acquisition cap".
Quant à la fonction complexe, elle porte sur le contrôle d’un vérin, en plus on a fait l’asservissement pour gérer son fonctionnement via des boutons.

## 1) Spécifications du circuit d'interface d'acquisition du cap

Le module `gestion_compas` est conçu pour fonctionner avec des boussoles CMPS03 ou CMPS10. Il permet d'acquérir et de traiter les données provenant du capteur de manière fiable. Voici les spécifications détaillées pour l'interface d'acquisition :

### Entrées :
- **clk_50M** : Horloge de 50 MHz, utilisée pour la synchronisation du circuit.
- **raz_n** : Signal de réinitialisation actif à 0. Lorsqu'il est activé, le circuit est réinitialisé.
- **in_pwm_compas** : Signal PWM généré par la boussole. La durée de ce signal varie entre 1 ms et 36,9 ms.
- **continu** : Mode de fonctionnement.
  - **Si = 0** : Mode monocoup, où l'acquisition se fait une seule fois.
  - **Si = 1** : Mode continu, où la donnée est mise à jour chaque seconde.
- **start_stop** : Contrôle du démarrage de l'acquisition.
  - **Si = 1** : Lance une nouvelle acquisition de données (mode monocoup).
  - **Si = 0** : Réinitialise le signal `data_valid` et arrête l'acquisition.

### Sorties :
- **data_valid** : Indicateur de validité des données acquises.
  - **Si = 1** : Les données sont valides et peuvent être utilisées.
  - **Si = 0** : Les données ne sont pas valides, souvent remis à 0 lorsque `start_stop` est à 0.
- **out_1s** : Signal de contrôle pour le top seconde (généralement inutilisé, mais peut être utilisé pour des synchronisations temporelles).
- **data_compas** : Valeur du cap réel de la boussole, exprimée en degrés et codée sur 9 bits.

### Interface Avalon :
Le module expose deux registres accessibles via l'interface Avalon pour la gestion et la lecture des données :

- **Registre `config`** (adresse 0, lecture/écriture) :
  - **b2** : Commande Start/Stop (active ou arrête l'acquisition).
  - **b1** : Mode continu (active le rafraîchissement des données chaque seconde).
  - **b0** : Signal de réinitialisation actif à 0 (réinitialise le module).
  
- **Registre `compas`** (adresse 1, lecture/écriture) :
  - **b9** : Indicateur de validité des données (`valid`).
  - **b8 à b0** : Données de la boussole, `data_compas` codées sur 9 bits.

## 2) Spécifications du circuit d'acquisition de la vitesse du vent

Le module `gestion_anemometre` est conçu pour acquérir la vitesse du vent à partir d'un anémomètre. Ce module traite le signal de fréquence variable du capteur pour calculer et fournir la vitesse du vent exprimée sur 8 bits.

## Entrées :
- **clk_50M** : Horloge de 50 MHz, utilisée pour la synchronisation du circuit.
- **raz_n** : Signal de réinitialisation actif à 0. Lorsqu'il est activé, le circuit est réinitialisé.
- **in_freq_anemometre** : Signal de fréquence variable, allant de 0 à 250 Hz, provenant de l'anémomètre.
- **continu** : Mode de fonctionnement.
  - **Si = 0** : Mode monocoup, où l'acquisition se fait une seule fois.
  - **Si = 1** : Mode continu, où la donnée est mise à jour chaque seconde.
- **start_stop** : Contrôle du démarrage de l'acquisition.
  - **Si = 1** : Lance une nouvelle acquisition de données (mode monocoup).
  - **Si = 0** : Réinitialise le signal `data_valid` et arrête l'acquisition.

## Sorties :
- **data_valid** : Indicateur de validité des données acquises.
  - **Si = 1** : Les données sont valides et peuvent être utilisées.
  - **Si = 0** : Les données ne sont pas valides, souvent remis à 0 lorsque `start_stop` est à 0.
- **data_anemometre** : Valeur de la vitesse du vent, codée sur 8 bits.

## Interface Avalon :
Le module expose deux registres accessibles via l'interface Avalon pour la gestion et la lecture des données :

- **Registre `config`** (adresse 0, lecture/écriture) :
  - **b2** : Commande Start/Stop (active ou arrête l'acquisition).
  - **b1** : Mode continu (active le rafraîchissement des données chaque seconde).
  - **b0** : Signal de réinitialisation actif à 0 (réinitialise le module).
  
- **Registre `code`** (adresse 1, lecture/écriture) :
  - **b9** : Indicateur de validité des données (`valid`).
  - **b7 à b0** : Données de l'anémomètre, `data_anemometre` codées sur 8 bits.
 
## 3) Spécifications du circuit « gestion vérin »

Le circuit de gestion du vérin comprend plusieurs fonctions principales et secondaires permettant de contrôler le mouvement du vérin et de gérer l'interaction avec le bus Avalon du NIOS. Ce circuit intègre la gestion de la PWM moteur, le contrôle des butées de fin de course, la gestion du convertisseur AN MCP 3201 pour la recopie de la position de la barre, ainsi que l'interface avec le bus Avalon.

### Fonctionnalités principales

#### 1. Gestion de la PWM moteur
La gestion de la PWM moteur repose sur deux fonctions secondaires :
- **Fixation de la fréquence de la PWM** : Cette fonction est réalisée par un processus secondaire appelé `process divide`, qui permet de fixer la fréquence de la PWM en fonction de l'horloge système.
- **Fixation du rapport cyclique et génération du signal PWM** : Le processus `process compare` génère le signal PWM en sortie en fonction du rapport cyclique choisi.

#### 2. Contrôle des butées de fin de course du vérin
La fonction `controle_butées` assure que le signal PWM est mis à 0 si l'angle de la barre (`angle_barre`) sort des limites des butées gauche (`butee_g`) et droite (`butee_d`). Elle prend également en compte le sens de rotation du moteur et génère les signaux de fin de course `fin_course_g` et `fin_course_d`.

#### 3. Gestion du convertisseur AN MCP 3201
Cette fonction se compose de cinq fonctions secondaires permettant de gérer le convertisseur analogique-numérique MCP 3201 :
- **Machine à état pour piloter l'ADC** : Le processus `pilote_adc` contrôle la conversion analogique-numérique et mémorise la donnée de l'angle de barre.
- **Comptage des fronts d'horloge** : Le processus `compt_fronts` gère le comptage des fronts d'horloge de `clk_adc`.
- **Registre à décalage pour récupérer les données** : Le processus `rec_dec` récupère les données du convertisseur via un registre à décalage.
- **Génération du signal 1 MHz pour la machine à état** : Le processus `gene_1M` génère une horloge à 1 MHz pour synchroniser la machine à état.
- **Génération périodique du signal start_conv** : Le processus `gene_start_conv` génère un signal `start_conv` toutes les 100 ms pour déclencher la conversion.

#### 4. Interface avec le bus Avalon
L'interface Avalon permet de communiquer avec le NIOS à travers deux processus :
- **Écriture des données sur le bus NIOS** : Le processus `ecriture` envoie les données du circuit vers le bus Avalon.
- **Relecture des signaux depuis le bus NIOS** : Le processus `lecture` permet de lire et renvoyer les signaux sur le bus Avalon.

### Interface Avalon

L'interface Avalon expose 6 registres pour configurer et contrôler le circuit :

- **Registre `freq` (adresse 0, lecture/écriture)** :
  - **b15..b0** : Valeur de la fréquence de la PWM moteur (par exemple, si `freq = 2000`, la fréquence de la PWM sera `clk / 2000`, soit 25 kHz si `clk = 50 MHz`).
  
- **Registre `duty` (adresse 1, lecture/écriture)** :
  - **b15..b0** : Valeur du rapport cyclique de la PWM (par exemple, si `duty = freq / 2`, le rapport cyclique sera de 50%).
  
- **Registre `Butee_g` (adresse 2, lecture/écriture)** :
  - **b15..b0** : Valeur de la butée gauche. Elle fixe la limite inférieure de l'angle du vérin, de 0 à 4095.
  
- **Registre `Butee_d` (adresse 3, lecture/écriture)** :
  - **b15..b0** : Valeur de la butée droite. Elle fixe la limite supérieure de l'angle du vérin, de 0 à 4095.
  
- **Registre `config` (adresse 4, lecture/écriture)** :
  - **b0** : `raz_n` (réinitialisation du circuit).
  - **b1** : `enable_pwm` (activation de la PWM).
  - **b2** : `sens_rotation` (sens de rotation du moteur : 0 = gauche, 1 = droite).
  - **b3** : `fin_course_d` (indicateur de fin de course à droite).
  - **b4** : `fin_course_g` (indicateur de fin de course à gauche).
  
- **Registre `Angle_barre` (adresse 5, lecture)** :
  - **b11..b0** : Valeur de l'angle de la barre codée sur 12 bits (résultat de la conversion analogique-numérique).

### Description des fonctionnalités des registres

- **`freq`** : Permet de configurer la fréquence de la PWM moteur.
- **`duty`** : Permet de configurer le rapport cyclique de la PWM.
- **`Butee_g` et `Butee_d`** : Définissent les limites de déplacement du vérin. Si l'angle de barre sort de ces limites, la PWM est automatiquement coupée.
- **`config`** : Permet de configurer l'état du système, activer la PWM, définir la direction de rotation, et indiquer si les butées ont été atteintes.
- **`Angle_barre`** : Donne la position actuelle du vérin en termes d'angle, en valeurs codées sur 12 bits.


