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
## Structure du Projet
Le projet est divisé en deux grandes parties :

1. **Le Compteur**
Ce processus incrémente un compteur de 8 bits à chaque cycle d'horloge. Quand il atteint la valeur maximale (255), il revient à zéro. En cas de réinitialisation (reset_n), il est remis à zéro immédiatement.

2. **Le Comparateur**
Ce processus compare en permanence la valeur actuelle du compteur avec le rapport cyclique. En fonction de cette comparaison, il génère le signal PWM :

Haut (1) si la valeur du compteur est inférieure au rapport cyclique.
Bas (0) sinon.

# Projet BE
