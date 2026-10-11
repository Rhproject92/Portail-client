# Manuel expert RHproject — 05. Guide de formation des utilisateurs

> À l'usage de l'**Expert RHproject** (agent formateur) et du **Directeur**. Chaque fiche décrit le chemin réel dans l'application, étape par étape, tel que lu dans le code. En cas de doute sur un écran, dire « je vérifie » et ne pas inventer.

## 1. Les profils d'utilisateurs et ce qu'ils doivent savoir faire

| Profil | Objectif de la formation | Modules prioritaires |
|---|---|---|
| **Dirigeant / gérant** | Savoir lire l'état de son entreprise en 5 minutes et décider | Tableau de bord, Radar RH, Alertes, validation des congés, documents, paramètres |
| **Responsable administratif / RH** | Tout saisir, tout générer, ne rien oublier | Salariés, dossiers, documents, congés, DPAE, visites médicales, DUERP, paie et frais |
| **Chef d'équipe / responsable d'exploitation** (BTP) | Affecter, contrôler, remplacer | Chantiers, Planning, Imprévus, Chantier du jour, badges, EPI |
| **Responsable agence / intérim** (BTP) | Gérer missions, conformité, relevés | Intérimaires, Agences, Envois, Relevés & facturation |
| **Encadrant propreté** | Suivre niveaux CCN, EPI, véhicules | Grille CCN, EPI Nettoyage, Parc véhicules, Entretiens |
| **Comptable / cabinet** | Récupérer les variables sans ressaisie | Variables de paie, exports (CSV, Silae, justificatifs) |

## 2. Séance type de formation (1 heure — incluse en offre Sérénité)

| Minutes | Contenu | Résultat attendu |
|---|---|---|
| 0-10 | Connexion, tour du menu (6 rubriques), recherche globale (Ctrl+K), alertes | L'utilisateur sait où est chaque chose |
| 10-20 | **Premier salarié** : fiche, jours travaillés, contrat généré automatiquement | Une fiche complète et un contrat |
| 20-30 | **Congés** : demande, validation, solde, calendrier | Un congé validé de bout en bout |
| 30-40 | **Alertes et obligations** : DPAE, visite médicale, DUERP, essai | L'utilisateur lit et traite une alerte |
| 40-50 | Module du **secteur** (chantier / grille CCN) et habilitations | Une affectation ou un niveau CCN saisi |
| 50-60 | Questions, exercice libre, rappel des limites de l'outil | Autonomie validée par un petit test |

## 3. Fiches « Comment faire » — socle RH (tous secteurs)

### F1. Créer un salarié
1. Menu **👥 Ressources humaines → Salariés & dossiers** → bouton **+ Salarié** (haut de page) ou **Nouveau salarié** sur l'accueil.
2. Renseigner au minimum **Prénom, Nom, Poste, Civilité**. Le nom passe en majuscules.
3. Section **Contrat** : type, statut, date d'embauche, salaire brut, durée hebdomadaire, **cocher les jours travaillés** (sinon pas de planning), horaires. Alternance : CFA, diplôme, tuteur.
4. Facultatif : section **Données légales** (naissance, NSS à 15 chiffres, adresse, nationalité), permis, véhicule, **visite médicale** (« VM valide existante » = aucune alerte), contact d'urgence.
5. **✅ Créer le salarié** : la période d'essai, le statut et un **contrat** sont générés automatiquement ; vérifier dans **Contrats & documents**.
*Piège courant* : oublier les jours travaillés → le planning affiche « Configuration requise ».

### F2. Importer tous les salariés d'un coup
**Paramètres entreprise → Import de données → 📥 Importer des salariés (Excel)** : télécharger le modèle, le remplir **sans modifier les en-têtes** (colonnes obligatoires Civilité, Prénom, Nom, Poste, Type_Contrat, Date_Embauche ; dates AAAA-MM-JJ), choisir le fichier, lire le contrôle (valides, doublons, erreurs), cliquer **Importer**. Puis **📎 Déposer des documents en masse** avec des fichiers nommés `NOM_Prenom_TypeDocument.extension`.

### F3. Poser un congé et le valider
1. **Congés & absences → + Demande** (ou depuis la fiche, onglet Congés).
2. Choisir le salarié (les soldes CP/RTT s'affichent), le **type**, les dates ; pour une journée unique, possibilité de **demi-journée**. **✅ Enregistrer** : statut « en attente ».
3. Valider : **✅** sur la ligne, sur le tableau de bord ou dans la fiche. Si le solde est insuffisant, choisir entre **valider avec anticipation** (période suivante), **valider quand même** ou **annuler**.
4. Le salarié est notifié ; le congé apparaît au calendrier et dans le planning.
*Annulation* : si une annulation est demandée, l'accepter recrédite les jours ; la refuser maintient le congé.

### F4. Générer un contrat, un avenant ou une lettre
**Contrats & documents → + Générer** (ou fiche salarié → **📄 Générer doc**) : type de document, salarié (champs préremplis), date, lieu, informations propres au document (CDD : **motif obligatoire** ; période d'essai : durée) puis **⚡ Générer**. Ensuite **🖨 Imprimer**, **Word**, **Modifier & sauvegarder** ou envoi par email. Pour faire signer : « marquer signé » ou importer la **version signée**.

### F5. Augmenter un salaire
Fiche salarié → **⬆️ Augmentation** : nouveau salaire, motif, note comptable ; la **date d'effet est le 1er du mois suivant** ; **Enregistrer et générer l'avenant**. Une alerte prévient 30 jours avant l'activation.

### F6. Traiter une fin de période d'essai
Menu **Alertes légales** : sur « Fin période d'essai — [nom] », **✅ Valider PE** (le salarié devient actif) ou **📄 Courrier** (confirmation, renouvellement, rupture). Rappel des durées maximales affichées dans le formulaire de document.

### F7. Déclarer une embauche (DPAE)
Menu **DPAE** ou fiche salarié → onglet **DPAE** : vérifier SIRET, NAF, naissance, lieu de naissance, NSS ; choisir l'heure ; **🖨 Imprimer / ⬇ Télécharger** ou **🔗 Ouvrir Net-entreprises** (copier les données) puis **✅ Marquer envoyée**. À faire **au plus tard la veille de l'embauche**.

### F8. Planifier une visite médicale et enregistrer l'aptitude
**Visites médicales → + Planifier VM** : salarié, type, date, heure, centre (préremplis depuis les Paramètres), médecin ; **📄 Convocation** à imprimer ; après la visite, **✅ Marquer réalisée** et renseigner l'**avis d'aptitude** (apte / avec réserves / inapte, pièce jointe). Le tableau de conformité montre qui est à jour.

### F9. Tenir le DUERP
**DUERP → + Ajouter risque** : poste, danger, risque, **gravité (1-5) × fréquence (1-5)** = niveau (≥ 12 élevé, 6-11 moyen, < 6 faible), action corrective, responsable, échéance, avancement (curseur). Exporter en CSV ou imprimer. **Le document doit être remis à jour au moins une fois par an** (alerte à 330 puis 365 jours).

### F10. Enregistrer une habilitation (CACES, hauteur, SST, R408…)
Fiche salarié → onglet **🎓 Habilitations** → type, précision, **date d'expiration (obligatoire)**, organisme, n° de certificat, pièces jointes → **✅ Enregistrer**. Les alertes de recyclage se déclenchent à 90, 60 et 30 jours.

### F11. Lire et traiter les alertes
**Alertes légales** : trois niveaux (rouge urgent, orange à venir, bleu à planifier/à surveiller). Chaque ligne propose **👤 Fiche**, **📄 Courrier**, **Traité**. Une alerte « Traitée » est masquée mais reste tracée au **Journal des événements**.

### F12. Suivre un arrêt maladie / AT (option)
**Suivi arrêts & AT** : type, début, fin prévue, **date de réception** ; l'outil compte **5 jours ouvrés pour le signalement DSN** ; cliquer **DSN transmise** une fois fait ; **Prolonger** ou **Clôturer** ; planifier la **visite de reprise** quand elle est requise ; lire l'impact paie du mois.

### F13. Préparer la paie du mois (option)
**Paie & frais → Variables de paie** : choisir le mois ; pour chaque salarié ouvrir la saisie (heures, nuit, jours fériés, primes, tickets restaurant, avance, véhicule/IKM, frais avec justificatifs), puis **Valider**. Transmettre au comptable depuis la carte *Transmission comptable* : **fiche PDF**, **export comptable**, **export Silae**, **justificatifs**. Respecter l'échéance (15, 20 ou 25 du mois).

### F14. Notes de frais (option)
**Notes de frais** : date, salarié, motif, montant TTC, justificatif → **valider** ; reporter dans les variables de paie via le bouton de l'encart ; les justificatifs partent avec l'export.

### F15. Rupture conventionnelle (option)
**Rupture conventionnelle** : salarié (CDI), case « salarié protégé » si besoin, montant retenu communiqué par la paie (l'outil alerte s'il est sous le minimum légal), dates → générer la **convocation**, préparer la **convention**, suivre la **frise des délais**, déposer sur **TéléRC**, cocher la confirmation pour sortir du mode « brouillon ».

### F16. Procédure disciplinaire (option)
**Disciplinaire → + Nouvelle procédure** : salarié, date des faits, catégorie, description, sanction ; suivre les 5 étapes ; générer **convocation** puis **lettre de sanction** ; respecter les délais affichés (2 mois pour notifier ; 1 mois après l'entretien) ; **clôturer**.

### F17. Recruter (option Recrutement Pro)
**Recrutement → Fiches de poste** (créer, **Word fiche de poste / annonce**) → **Pipeline** (+ Candidat, source, prétentions) → **Guide d'entretien** en 5 phases et **grille d'évaluation** → courriers (convocation, refus, offre) → **Promesse d'embauche** → **DPAE** → **Créer fiche salarié** puis démarrer l'intégration.

### F18. Vérifier un titre de travail (option)
Fiche salarié → section document : type, numéro, expiration. **UE/EEE** : vérifier le TIN sur le site officiel. **Hors UE** : générer la **demande d'authentification à la préfecture** (délai de réponse 48 h ouvrables), l'envoyer, puis valider ou refuser selon la réponse.

### F19. Éditer le registre du personnel
**Registre du personnel** : vérifier les fiches « incomplètes » (clic sur la ligne), exporter en **Excel (4 onglets)**, imprimer ou envoyer. L'archivage d'un salarié demande son **motif de sortie**.

## 4. Fiches « Comment faire » — secteur BTP / échafaudage

### B1. Créer un chantier et connaître l'effectif nécessaire
**Chantiers & intérim → Terrain → Chantiers** : régler une fois la **cadence** (2,5 t/j/équipe, équipe de 3) ; **Nouveau chantier** (nom, client, zone 1-5, dates, budget, quantité en tonnes ou m², adresse, chef, responsable, effectif requis, consignes, horaires) ; ajouter des **sous-chantiers** (tonnage, phase). Aller dans **Planning** : « il te faut X monteurs/jour ».

### B2. Affecter des monteurs
**Planning → ajout rapide** : intervenant, chantier, jour, début, fin, pause, nuit. L'outil vérifie congés, arrêts, mise à pied, aptitude, badge, documents, chevauchement. Si une **habilitation obligatoire manque** : choisir une **mesure compensatoire** et un **validateur** (tracé). Possibilité de **glisser-déposer** et d'affecter en masse via **Période**.

### B3. Gérer l'intérim
**Ressources → Agences** (créer l'agence avec email) → **Intérimaires** (fiche, taux, mission, qualification) → **Conformité** (documents exigés par agence et par qualification) → affecter sur le planning. Chaque **lundi** : **Envois → Relevé d'heures** de la semaine passée, puis **Relevés & facturation** pour comparer à la facture reçue.

### B4. Remplacer un absent le jour même
**Imprévus** (ou Planning) : « ❌ Absent » → **🔍 Proposer un remplaçant** → comparer les scores → **Simuler** → **✅ Appliquer** ; en cas d'erreur, **↩️ Annuler le dernier remplacement**.

### B5. Gérer badges et accréditations
**Gestion → Badges** (ou **Chantier du jour → Équipes et badges**) : saisir le n° de badge et l'expiration pour chaque personne affectée à un chantier ; traiter « badge à faire » avant l'arrivée de l'équipe.

### B6. Tenir le registre de sécurité
**Registre de sécurité → + Ajouter un contrôle** : type (journalière, mise en service, périodique ≤ 3 mois, VPG matériel EPI annuelle), chantier, date, auteur, résultat conforme / non conforme, observations. Un chantier sans contrôle trimestriel depuis 90 jours déclenche une alerte.

### B7. Gérer les EPI et les harnais
**EPI & harnais** : fournisseurs → articles (seuil d'alerte) → commande → **réception** (le stock augmente) → **remise** à un salarié (le stock baisse, bon de remise signé) ; antichute : fiche individuelle, **Vérifier** (VGP), **Changer** (retour physique), campagnes de vérification.

### B8. Organiser les formations
**Registre de formation** (qui est à jour) → **Pipeline Formation** (besoins détectés → devis demandé centre par centre → devis reçu → planifié → réalisé → facturé) ; compléter les **Centres de formation agréés** dans Paramètres ; à « Réalisé », l'habilitation est créée dans la fiche du salarié.

### B9. Déclarer des intempéries
**Imprévus → météo** : configurer les seuils et le géocodage du chantier ; en cas d'arrêt, **🌧️ Déclarer un arrêt intempéries** (salariés et jours) ; contrôler le calcul indicatif ; les lignes arrivent dans les **variables de paie** ; faire la déclaration sur l'espace CIBTP.

### B10. Payer paniers, trajets et nuits
**Gestion → Indemnités paie** : choisir le mois, vérifier le barème (panier, trajet par zone, grand déplacement, majoration nuit) ; les montants alimentent les variables de paie des permanents.

## 5. Fiches « Comment faire » — secteur Nettoyage

### N1. Renseigner le niveau CCN d'un agent
Fiche salarié → onglet **💶 Grille CCN** : choisir le niveau (filière Exploitation, Administrative ou Cadres) et, si demandé, la catégorie A ou B ; lire le **minimum conventionnel**, comparer au salaire, **✅ Enregistrer**. Si le salaire est inférieur : alerte rouge.

### N2. Gérer les EPI de propreté
Menu **EPI Nettoyage** : **➕ Ajouter un équipement** (gants, chaussures, masque, tenue chimique), quantité, achat, péremption ; **remettre** à un salarié ; surveiller les péremptions.

### N3. Suivre les véhicules et les entretiens
**Parc véhicules** : ajouter, attribuer, relever le kilométrage, enregistrer l'entretien ; **Entretiens annuels** : réaliser l'entretien annuel ou professionnel et suivre l'historique.

## 6. Questions fréquentes (réponses prêtes)

| Question | Réponse fondée sur l'application |
|---|---|
| « Mes données sont-elles sécurisées ? » | Elles sont synchronisées dans le cloud (hébergement Europe annoncé), chiffrées en transit ; chaque client n'accède qu'à ses données ; l'assistant IA pseudonymise noms, emails, NSS, IBAN et téléphones avant envoi. **Ne pas dire « tout reste sur votre ordinateur »** (voir point d'attention n°5 du manuel 04). |
| « L'outil fait-il la paie ? » | Non : il prépare les variables de paie et les exports ; le bulletin reste chez le comptable. |
| « Envoie-t-il la DPAE tout seul ? » | Non : il prépare la fiche, ouvre Net-entreprises et suit l'échéance. |
| « Puis-je importer mes salariés ? » | Oui : modèle Excel + import de documents en masse. |
| « Combien de salariés ? » | Pas de plafond affiché pour les offres payantes ; l'offre Nettoyage indique « salariés illimités » ; l'essai est limité à 10 fiches. |
| « Puis-je tester ? » | Essai gratuit sur invitation, sans carte, avec options verrouillées et démonstrations animées. |
| « Quel engagement ? » | L'écran des offres indique « Engagement 12 mois · Toutes formules » ; les frais de démarrage de 900 € s'ajoutent aux offres Autonomie, Sérénité et Nettoyage (Pilotage : à confirmer). |
| « Et si mon salarié est en intérim ? » | Module BTP : fiche intérimaire, conformité par agence, envois cloisonnés, relevés ; la DPAE incombe à l'agence. |
| « Mon planning est sur Excel » | Import de salariés, puis planning chantier à créneaux ou planning RH hebdomadaire (option Planning). |

## 7. Questions de test pour valider qu'un agent maîtrise le produit

1. Quelle est la période d'acquisition des congés payés et le rythme d'acquisition ? *(1er juin → 31 mai ; 2,5 j par mois ; plafond 25 j)*
2. Que se passe-t-il quand on valide un congé alors que le solde est insuffisant ? *(fenêtre à trois choix, jamais bloquant)*
3. Quel délai pour la DPAE et que fait l'outil ? *(au plus tard la veille ; prépare, ouvre Net-entreprises, suit)*
4. Que veut dire un niveau de risque DUERP de 15 ? *(gravité × fréquence ≥ 12 = élevé)*
5. Quelles habilitations sont « graduées » en échafaudage et que cela change-t-il ? *(R408, R457, hauteur : jamais « expirées », paliers de recyclage)*
6. Comment l'outil estime-t-il l'effectif d'un chantier ? *(tonnage ÷ cadence, équipe de 3, déduction des monteurs déjà engagés)*
7. Que se passe-t-il à l'affectation d'un monteur sans R408 ? *(mesure compensatoire + validateur, tracé, jamais de blocage dur)*
8. Qu'est-ce qui distingue la catégorie A et B de la grille CCN Propreté ? *(Propreté ou prestations associées / Propreté et prestations associées, 3 mois continus)*
9. Combien de jours pour le signalement DSN d'un arrêt ? *(5 jours ouvrés)*
10. Quelles sont les limites de l'essai ? *(10 salariés, 2 chantiers, 5 intérimaires ; options verrouillées)*
