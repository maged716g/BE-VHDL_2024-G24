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

## Spécifications du circuit d'interface d'acquisition du cap

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

