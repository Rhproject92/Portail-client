# Manuel expert RHproject — 04. Secteurs Nettoyage et Généraliste, essai gratuit, points d'attention

> Source : lecture du code de l'application (build 2026-04-08). Le secteur **Médical** existe dans l'application mais est **hors périmètre** de ce manuel. Les trois secteurs couverts par les manuels sont donc **BTP/échafaudage** (manuel 03), **Nettoyage/Propreté** et **Généraliste** (ce document). *Hypothèse de travail : « les 3 secteurs hors médical » = Généraliste, BTP, Nettoyage. À confirmer par la fondatrice.*

## 1. Comment le secteur est attribué

- Le **secteur** est posé **côté serveur par RHproject** sur le contrat du client : `GENERALISTE` (valeur par défaut), `BTP`, `NETTOYAGE` ou `MEDICAL`. Le client ne peut pas le modifier.
- Ne pas confondre avec la question « Secteur d'activité » de l'assistant de premier lancement, qui sert à **préremplir la convention collective** (Syntec, commerce de détail, restauration rapide, hôtels-cafés-restaurants, bâtiment, coiffure, transport routier, aide à domicile, autre).
- Les modules métier BTP et Nettoyage s'ouvrent si le secteur est payé en **Sérénité (F2) ou Pilotage (F3)**, ou pendant un essai sur ce secteur.

## 2. Secteur Généraliste

**Principe** : aucun module métier ; le client a le **socle RH complet** (manuel 01) et les **options** (manuel 02). C'est le secteur de toute TPE/PME qui n'est ni BTP, ni propreté, ni santé : commerce, restauration, conseil, transport, services…

**Ce que couvre le secteur Généraliste** (à maîtriser parfaitement car c'est le cœur du produit) :
1. Fiches salariés complètes, contrat automatique, période d'essai calculée, historique, intégration en 9 étapes, DPAE.
2. Congés (acquisition légale, anticipation, grand livre, calendrier avec jours fériés), absences spéciales, validation hiérarchique par manager.
3. Générateur de **documents** (contrats, avenants, fin de contrat, disciplinaire, remise de matériel/véhicule, dispense de mutuelle…), export Word/impression, signature.
4. **Alertes légales** (fin d'essai, fin de CDD, visite médicale, entretien professionnel, DUERP, DPAE, congés à solder, habilitations…).
5. **Santé et sécurité** : visites médicales (convocation, aptitude, conformité), **DUERP** (cotation gravité × fréquence, plan d'action, suivi d'avancement), registre du personnel.
6. **Habilitations** (CACES, électricité, SST, hauteur, amiante, gaz, incendie, ATEX…) avec pièces jointes et recyclage.
7. **Paie et frais** (options) : variables de paie, IKM, notes de frais, exports comptables dont Silae, arrêts maladie/AT.
8. **Recrutement** (simple ou Pro), **entretiens annuels et professionnels**, **parc véhicules**, **rupture conventionnelle**, **discipline**, **vérification des titres de travail**.
9. **Lexi**, assistante juridique (droit du travail français, liens Légifrance).
10. Messagerie avec le salarié, équipes et managers, import en masse, recherche globale (Ctrl+K), journal des événements.

**Message d'accueil de l'essai Généraliste** : « Retrouvez vos obligations au même endroit : DUERP, visites médicales et alertes légales. »

**Entretiens annuels** (menu RH, tous secteurs) : deux types — **entretien annuel** (bonne pratique, périodicité usuelle 12 mois) et **entretien professionnel** (obligatoire tous les 2 ans, art. L.6315-1, 24 mois). Pour chaque salarié : date, responsable, bilan, axes d'amélioration, objectifs de la période suivante, formation souhaitée, remarques du salarié ; historique par salarié ; statut (à jour / à planifier / en retard) et alertes.

**Parc véhicules** (menu RH, tous secteurs) : fiche véhicule (immatriculation obligatoire, marque, modèle, type de contrat **achat / leasing / LLD**, kilométrage actuel, date d'acquisition, fin de contrat, coût mensuel, **intervalle d'entretien 15 000 km et 12 mois par défaut**), **attribution** à un collaborateur (l'affectation précédente est clôturée), **relevé kilométrique**, enregistrement d'un entretien réalisé ; alertes : entretien dépassé (km ou date) en rouge, entretien dans ≤ 1 500 km ou ≤ 30 jours en orange, **fin de contrat** de leasing/LLD ≤ 90 jours (orange) ou expirée (rouge). Statuts « hors service » et « restitué » sortent le véhicule des alertes.

**Lecture intelligente de documents** : voir manuel 02 §14 et 03 §11 ; dans le code, elle est rattachée à l'offre BTP (F2/F3) ; pendant l'essai elle est verrouillée (démonstration animée).

## 3. Secteur Nettoyage / Propreté

**Offre dédiée « Nettoyage » (F4)** : 249 €/mois + 900 € de démarrage, engagement 12 mois ; logiciel RH complet, **salariés illimités**, **suivi EPI et véhicules inclus**, 17 documents légaux, hébergement Europe ; **Planning et Variables de paie ne sont pas inclus par défaut** (options à la carte). *(Voir §6 : les identifiants de paiement F4 sont provisoires dans le code.)*

**Ce que le secteur ajoute** (menu *Salariés & dossiers* et fiche salarié) :

### 3.1 Grille CCN Propreté (IDCC 3043) — onglet « 💶 Grille CCN » de la fiche salarié
- **Grille de salaires 2026 de la FEP**, entrée en vigueur le **1er avril 2026**. Mensualisation de référence : **151,67 h** (35 h × 52/12).
- **Filière Exploitation** : Maîtrise MP1 à MP5 (MP4 et MP5 assimilés cadres), Chef d'équipe CE1 à CE3, **ATQS 1 à 3** (agent technique qualifié de service), **AQS 1 à 3** (agent qualifié de service), **AS** (ASP, ASC, ASCS).
- **Filière Administrative** : Maîtrise MA1 à MA3, Employés EA1 à EA4.
- **Filière Cadres** : CA1 à CA6, avec un minimum **mensuel** (pas de taux horaire).
- **Catégories A / B** pour les niveaux ATQS, AQS et AS : **A = Propreté ou Prestations associées**, **B = Propreté et Prestations associées** (3 mois continus hors remplacement) ; les taux horaires diffèrent selon A ou B.
- Pour chaque salarié : choisir le niveau et la catégorie, l'application calcule le **minimum conventionnel mensuel**, le compare au **salaire actuel**, affiche « ✅ Conforme » ou « ⚠️ En-dessous du minimum conventionnel » et enregistre le niveau dans l'historique et le journal.
- **Alerte rouge** « 💶 Salaire sous le minimum CCN — [salarié] » (niveau, minimum, salaire actuel) dès qu'un salaire est inférieur.
- Valeurs de repère du code (taux horaires, catégorie A) : AS ASP 12,52 €, AQS1 12,70 €, ATQS1 13,17 €, chef d'équipe CE1 14,43 €, maîtrise MP1 15,52 €, employé EA1 12,63 €, cadre CA1 3 279,71 €/mois. À citer avec prudence : le client doit vérifier la grille en vigueur.
- Lien prévu vers une **formation recommandée** par niveau (agent de propreté, chef d'équipe, management propreté, hygiène-sécurité) ; **dans ce build, la liste de formations « Nettoyage » n'est pas définie, la ligne ne s'affiche donc pas** (voir §6).

### 3.2 EPI Nettoyage (menu *EPI Nettoyage*, visible uniquement en secteur Nettoyage)
- Espace de données **séparé** du module EPI BTP.
- **Types d'équipements** et durée de vie par défaut : **gants de protection (12 mois)**, **chaussures antidérapantes (24 mois)**, **masque de protection respiratoire (12 mois)**, **tenue de protection produits chimiques (24 mois)**, autre.
- Stock : référence, taille, quantité, date d'achat, **date de péremption** ; **remise à un salarié** (ou non attribué) avec date ; modification/suppression.
- Statut de péremption : **valide / expire dans ≤ 30 jours (orange) / expiré (rouge)** ; alertes correspondantes.

### 3.3 Autres éléments utiles au secteur propreté
- **Parc véhicules** et **Entretiens annuels** (voir §2) : fortement utiles aux entreprises de propreté (véhicules de service, encadrement d'équipes).
- **Habilitations** : CACES, SST, travail en hauteur, électricité, gaz, incendie, autres ; **registre du personnel** (fort turnover), **DPAE**, **période d'essai**, **CDD** (motifs, contrat d'usage…), **visites médicales** (suivi individuel renforcé), **DUERP** (risque chimique), **arrêts et AT**.
- **Messages d'accueil de l'essai Nettoyage** : « La grille de salaires de la convention Propreté (IDCC 3043) est déjà intégrée. »
- **Mention de l'offre** : « Pensée pour le secteur du nettoyage : sans Planning ni Variables de paie par défaut, à ajouter en option si besoin. »

## 4. Essai gratuit (tous secteurs)

- **Sur invitation uniquement**, **sans carte bancaire**. L'écran de connexion indique « L'essai se fait sur invitation — contactez support@rhproject.fr ». RHproject pose sur le contrat du client le **secteur d'essai** et une **date de fin**. Pendant l'essai, le module du secteur est ouvert ; à l'expiration, il se ferme, et l'accès entier est refusé si aucun paiement n'est enregistré (écran « Essai terminé » avec demande de rappel).
- **Bandeau permanent** en bas : « 🎁 Essai gratuit — il vous reste N jours » avec le mail et le téléphone du support.
- **Écran de bienvenue** (une seule fois) en 3 étapes : créer la fiche du premier salarié ; générer ses documents depuis sa fiche ; laisser les alertes légales prévenir. Message adapté au secteur.
- **Options payantes verrouillées 🔒** : l'écran peut être consulté mais il est **figé** (champs et boutons désactivés) avec le message « Option disponible — contactez-nous » ; un bouton « ▶ Voir comment ça marche (démonstration animée) » montre le principe sans coût. La **Lecture intelligente** est verrouillée pendant l'essai (elle utilise une IA payante).
- **Limites de l'essai** : **10 fiches salariés**, **2 chantiers**, **5 intérimaires**. Au-delà : « Limite de l'essai atteinte » avec les coordonnées du support.
- Les documents ouverts en nouvelle fenêtre portent la mention « Document généré pendant l'essai gratuit RH Project ».
- **Journal d'activité** : connexions et modules ouverts sont enregistrés côté RHproject (suivi commercial de l'essai) ; la première connexion est horodatée.
- **Conseil commercial** : l'essai est un outil de qualification — voir quels modules le prospect ouvre, s'il crée 10 fiches, s'il atteint la limite.

## 5. Parcours d'activation d'un client payant

1. Connexion (création du mot de passe si lien d'activation), acceptation de la **politique de confidentialité** (RGPD) à la première utilisation.
2. Assistant de premier lancement : entreprise (nom, SIRET, dirigeant, convention collective), premier salarié (facultatif), fin.
3. Étapes du tableau de bord : **configurer l'entreprise**, **ajouter les salariés** (ou import Excel), **cocher les jours travaillés** (nécessaire au planning).
4. Offres Sérénité/Pilotage : l'Expert RH **charge les données initiales** (import salariés + documents en masse), configure les paramètres (centre médical, comptable, échéance de paie, subrogation, carence, SMIC, 13e mois, logo, signature) et forme l'utilisateur (1 h incluse).
5. Choix possible de **plusieurs espaces** (sélecteur d'entreprise) : « Choisir un espace », « Créer un nouvel espace ».

## 6. Points d'attention relevés dans le code (à confirmer et corriger avec la fondatrice)

| # | Constat | Pourquoi c'est important |
|---|---|---|
| 1 | Prix **Recrutement Pro** : 39,00 €/mois dans le catalogue, **39,90 €** sur l'écran d'activation ; **Variables de paie** : 29,99 €/mois dans le catalogue, **19 €** dans l'écran teaser | Un prospect ou un client peut voir deux prix différents |
| 2 | **Offre Nettoyage (F4)** : identifiants de paiement provisoires (« à créer »), absente de la table qui relie formule et numéro d'offre, et la règle d'activation du module Nettoyage cite F2/F3 sans F4 | Ne pas promettre l'activation automatique de F4 avant vérification |
| 3 | **Option Planning** (49,90 €/mois) : identifiant de paiement provisoire ; l'entrée de menu *Planning* se trouve dans le groupe « Exploitation chantier » qui n'est affiché qu'en BTP (ou si des chantiers existent) | Vérifier comment un client Généraliste ou Nettoyage accède au Planning acheté |
| 4 | L'assistant s'appelle **Lexi** dans le menu mais **« Soraya IA »** dans son message système ; ses données de référence (SMIC 11,88 €, PMSS 2025) sont **datées** alors que les paramètres de l'application indiquent 12,02 €/h au 01/01/2026 | Cohérence de marque et fiabilité des réponses |
| 5 | La fenêtre RGPD dit « **logiciel local, données stockées exclusivement sur votre appareil** » alors que l'application synchronise dans un **cloud européen** | Message contradictoire : à corriger avant tout argument « sécurité/RGPD » en démonstration |
| 6 | Liste de formations « Nettoyage » (utilisée pour la formation recommandée par niveau CCN) non définie | La recommandation ne s'affiche pas |
| 7 | Les chiffres commerciaux « **17 documents légaux** » et « **21 alertes** » ne correspondent pas au décompte du code (le générateur propose 24 modèles avec les documents de remise ; les alertes sont plus nombreuses avec les modules) | Utiliser des formules robustes (« plus de 20 documents ») ou aligner le discours |
| 8 | **Messagerie salarié ↔ RH** : le mécanisme lu passe par un stockage local partagé avec un espace salarié de démonstration | Ne pas vendre l'espace salarié comme livré tant que non confirmé en production |
| 9 | **Activation des options** : paiement libre-service désactivé pendant la phase d'essai ; activation **manuelle** par RHproject | Dire « activation par notre équipe » au prospect |
| 10 | Les clés publiques de l'application (service de données et paiement) sont visibles dans le code client, ce qui est normal pour des clés publiques, mais la sécurité repose entièrement sur les **règles d'accès côté serveur** | Point technique à confirmer par un audit avant des clients sensibles |

## 7. Limites générales à annoncer honnêtement

- RHproject **ne remplace pas** le logiciel de paie : il prépare les **éléments variables** et les exports (Silae, CSV comptable) ; le calcul du bulletin reste chez le comptable ou le logiciel de paie.
- Il **ne transmet pas** automatiquement la DPAE, la DSN, les déclarations CIBTP ou TéléRC : il prépare les données, ouvre les sites officiels et suit les échéances.
- Les montants légaux (SMIC, barèmes IKM, planchers) sont des **paramètres** à tenir à jour ; l'application rappelle de vérifier la convention collective.
- Les textes générés (contrats, lettres) sont des **modèles** ; pour un licenciement ou un litige, consulter un juriste.
