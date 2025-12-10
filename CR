# 🫀 Prédiction des Maladies Cardiaques par Machine Learning

![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![Scikit-Learn](https://img.shields.io/badge/Library-Scikit--Learn-orange)
![Algorithm](https://img.shields.io/badge/Algorithm-Random%20Forest-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

Ce projet vise à développer un modèle d'Intelligence Artificielle capable de prédire la présence de maladies cardiaques chez un patient en analysant des indicateurs cliniques standards.

---

## 📋 Table des Matières
1. [Contexte et Enjeux](#-contexte-et-enjeux)
2. [Le Dataset](#-le-dataset)
3. [Méthodologie](#-méthodologie)
4. [Choix de l'Algorithme](#-choix-de-lalgorithme)
5. [Résultats et Performance](#-résultats-et-performance)
6. [Installation et Utilisation](#-installation-et-utilisation)

---

## 🩺 Contexte et Enjeux

Les maladies cardiovasculaires sont une cause majeure de mortalité. L'objectif de ce projet est de fournir un outil d'aide à la décision pour les médecins (tri/screening).

### La Matrice de Coûts (L'enjeu médical)
En médecine, toutes les erreurs ne se valent pas.
*   **Faux Positif :** On prédit une maladie alors que le patient est sain. (Conséquence : Stress, examens inutiles).
*   **Faux Négatif :** On prédit que le patient est sain alors qu'il est malade. (Conséquence : **Danger de mort** par absence de traitement).

> **Objectif Clé :** Maximiser le **Rappel (Recall)** pour minimiser les Faux Négatifs. Le modèle doit agir comme un filet de sécurité.

---

## 💾 Le Dataset

Nous utilisons la base de données **Cleveland Heart Disease**, disponible via le dépôt UCI Machine Learning et OpenML.

*   **Taille :** 303 patients.
*   **Target (Cible) :**
    *   `0` : Patient Sain.
    *   `1` : Patient Malade (Présence de maladie cardiaque).

### Description des Features (Variables)

| Variable | Description |
| :--- | :--- |
| `age` | Âge du patient |
| `sex` | Sexe (1 = Homme, 0 = Femme) |
| `cp` | Type de douleur thoracique (Chest Pain) |
| `trestbps` | Pression artérielle au repos |
| `chol` | Cholestérol sérique (mg/dl) |
| `fbs` | Glycémie à jeun > 120 mg/dl |
| `thalach` | Fréquence cardiaque maximale atteinte |
| `exang` | Angine induite par l'exercice |

---

## ⚙️ Méthodologie

Le pipeline de Data Science suit les étapes suivantes :

1.  **Ingénierie de la Cible :** Transformation de la cible multi-classes (0-4) en classification binaire (0 vs 1).
2.  **Simulation de "Dirty Data" :** Introduction artificielle de 5% de valeurs manquantes (`NaN`) pour simuler des dossiers hospitaliers réels incomplets.
3.  **Nettoyage (Data Cleaning) :** Imputation des valeurs manquantes par la **Moyenne** (`SimpleImputer`).
4.  **Séparation :** Division du jeu de données en Train (80%) et Test (20%) avec `random_state=42`.

---

## 🌲 Choix de l'Algorithme

Nous avons opté pour un **Random Forest Classifier** (Forêt Aléatoire).

### Pourquoi ce choix ?
1.  **Non-linéarité :** Le corps humain est complexe. Le Random Forest gère mieux les interactions non-linéaires entre variables (ex: âge + cholestérol) que la régression logistique.
2.  **Robustesse :** Grâce au principe de *Bagging* (vote de 100 arbres), l'algorithme est résilient face au bruit et aux erreurs d'imputation.
3.  **Flexibilité :** Pas besoin de mise à l'échelle (Scaling) des données.

---

## 📊 Résultats et Performance

Le modèle a été évalué sur le jeu de test (patients jamais vus durant l'entraînement).

### Métriques Clés
*   **Accuracy (Précision globale) :** ~85% (Indicateur de performance générale).
*   **Recall (Sensibilité) :** C'est notre KPI principal. Un score élevé (>0.85) indique que nous détectons la grande majorité des malades.

### Matrice de Confusion
La matrice permet de visualiser les erreurs de classification :
*   **Case bas-gauche :** Représente les malades ratés (Faux Négatifs). Ce chiffre est maintenu au minimum par le modèle.

---

## 🚀 Installation et Utilisation

### Pré-requis
*   Python 3.x
*   Bibliothèques : `pandas`, `numpy`, `matplotlib`, `seaborn`, `scikit-learn`

### Lancer le projet
1.  Cloner le repo ou télécharger le script.
2.  Installer les dépendances :
    ```bash
    pip install pandas numpy matplotlib seaborn scikit-learn
    ```
3.  Exécuter le script :
    ```bash
    python heart_disease_prediction.py
    ```

---

*Projet réalisé dans le cadre du module Data Science.*
