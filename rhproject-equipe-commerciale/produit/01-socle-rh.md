# Manuel expert RHproject — 01. Socle RH (commun aux 3 secteurs)

> Source : lecture du code de l'application « RH Project — Espace client » (fichier `app.html`, build 2026-04-08). Tout ce qui est écrit ici décrit le comportement lu dans le code. Ce qui n'a pas pu être confirmé est marqué **(à vérifier à l'écran)**.
> Aucun identifiant technique, clé ou URL d'infrastructure n'est reproduit dans ce document.

## 0. Principes généraux de l'application

- **Application web** (navigateur, adaptée mobile : barre de navigation basse avec Accueil, Équipe, Congés, Alertes, Assistant). Marque : « RH PROJECT — Votre RH externalisée TPE/PME ».
- **Données** sauvegardées dans le cloud (hébergement Europe annoncé). Un badge de synchronisation apparaît si une sauvegarde échoue ; l'application garde alors une copie de secours locale et réessaie.
- **Comptes** : un compte est rattaché à une « entité » (l'entreprise cliente). Le rôle `admin` a accès à tout, dont les **Paramètres entreprise** (réservés à l'administrateur : un autre rôle reçoit « Accès réservé à l'administrateur de l'entreprise »). Un compte sans rattachement multi-utilisateur est administrateur de sa propre entité. En cas d'erreur de résolution, l'accès est refusé (sécurité « fail-closed »).
- **Accès** : connexion par email + mot de passe (8 caractères minimum, bouton Afficher/Masquer, mot de passe oublié). Un compte ne peut entrer que s'il a un contrat valide **payé** ou un **essai gratuit en cours** (essai sur invitation, sans carte bancaire). À la fin de l'essai : écran « Essai terminé / accès non activé » avec demande de rappel enregistrée côté RHproject. Contact affiché partout : support@rhproject.fr.
- **Sécurité** : le secteur et les options activées sont lus côté serveur (le client ne peut pas se les attribuer), toute donnée saisie est neutralisée avant affichage, les données envoyées à l'assistant IA sont pseudonymisées.
- **Assistant juridique** : nommé « Lexi » dans le menu ; son message système interne le nomme « Soraya IA » (incohérence de nom à corriger ou à connaître). Il répond en droit du travail français avec articles cités et liens Légifrance.
- **Recherche globale** : icône loupe en haut (ou Ctrl+K) : retrouve un salarié, un document, un congé.
- **Premier lancement** : l'accueil propose 3 étapes — (1) configurer l'entreprise (nom, SIRET, dirigeant, convention collective), (2) ajouter les salariés, (3) cocher les jours travaillés dans chaque fiche (nécessaire au planning). Puis « Accéder au tableau de bord ».

## 1. Offres, secteurs et options

| Offre (code interne) | Prix | Contenu annoncé |
|---|---|---|
| **Autonomie (F1)** | 199 €/mois + 900 € de démarrage, engagement 12 mois (3 288 € la 1re année, 2 388 € ensuite) | Logiciel RH complet, 17 documents légaux automatiques, 21 alertes légales, données cloud Europe, mises à jour légales, assistant IA RH. L'utilisateur configure seul. Options achetées à la carte. |
| **Sérénité (F2)** — recommandée | 390 €/mois + 900 € de démarrage (5 580 € la 1re année, 4 680 € ensuite) | Tout F1 + **toutes les options incluses**, configuration complète par l'Expert RH, saisie des données initiales, formation de 1 h incluse, support prioritaire, opérationnel en 48/72 h après réception des données. |
| **Pilotage (F3)** | 1 500 €/mois, engagement 12 mois (18 000 €/an) ; la fiche offre n'affiche pas de frais de démarrage alors que la configuration de paiement mentionne 900 € : **à confirmer** | Tout Sérénité + l'Expert RH gère tout chaque mois, réponse sous 24 h garantie, accompagnement illimité, veille juridique. |
| **Nettoyage (F4)** | 249 €/mois + 900 € de démarrage, engagement 12 mois (3 888 € la 1re année, 2 988 € ensuite) | Logiciel RH complet, salariés illimités, suivi EPI et véhicules inclus, 17 documents légaux, hébergement Europe, options à la carte (Planning, Variables de paie…). **Sans Planning ni Variables de paie par défaut.** |

**Options à la carte** (visibles dans Paramètres entreprise → section modules ; chaque option affiche un bouton « Activer … → » et passe, en principe, par un paiement sécurisé Stripe) :

| Option | Prix | Contenu |
|---|---|---|
| Variables de paie | 29,99 €/mois | Frais professionnels, IKM URSSAF, relevé mensuel comptable |
| Planning | 49,90 €/mois | Planning hebdomadaire/mensuel et temps de travail |
| Vérification Documents | 29,99 €/mois | Titres de travail, alertes d'expiration, conformité préfecture |
| Recrutement Pro | 39,00 €/mois | Pipeline candidats, guide d'entretien, grille d'évaluation, compte rendu Word |
| Notes de frais | 14,99 €/mois | Saisie, validation, export mensuel |
| Suivi arrêts & AT | 14,99 €/mois | Arrêts maladie, accidents du travail, IJSS, délais légaux |
| Rupture conventionnelle | 29,90 €/mois | Procédure guidée, calcul d'indemnité, CERFA, homologation DREETS |
| Module Disciplinaire | 29,90 €/mois | Convocations, sanctions, lettres légales, délais L1332-4 |

**Règles d'activation** (lues dans le code) :
- **Sérénité et Pilotage** : toutes les options sont actives d'office (recrutement pro, vérification de documents, variables de paie, disciplinaire, notes de frais, arrêts & AT, rupture conventionnelle).
- **Autonomie** : seules les options effectivement payées sont actives.
- **Secteur** (valeur posée par RHproject sur le contrat) : `GENERALISTE` (défaut, aucun module métier), `BTP`, `NETTOYAGE`, `MEDICAL` (hors périmètre de ce manuel). Le module métier BTP ou Nettoyage est actif si le secteur est payé en **F2 ou F3**, ou pendant un **essai** sur ce secteur (date de fin enregistrée ; à l'expiration il se ferme).
- **Activation en pratique pendant la phase d'essai** : le code indique que, tant que le paiement libre-service n'est pas ouvert, cliquer « Activer » affiche « Option disponible — contactez-nous » (support@rhproject.fr) : l'activation est alors **manuelle par RHproject**. L'ancien champ « code d'activation » est volontairement neutralisé (sécurité). Après un paiement, l'application relit les options payées depuis le serveur (3 relectures sur ~9 secondes). **(à vérifier à l'écran sur un compte réel)**
- **Point d'attention produit** (relevé dans le code, à confirmer avec la fondatrice) : la formule F4 « Nettoyage » apparaît dans le catalogue de prix mais ses identifiants de paiement sont encore des valeurs provisoires (« à créer »), l'option Planning aussi, et la règle d'activation du secteur Nettoyage cite F2/F3 sans citer F4. Ne jamais promettre à un prospect l'activation automatique de F4 ou du Planning en ligne avant vérification.

## 2. Menu (navigation latérale par rubriques)

| Rubrique | Entrées | Visible quand |
|---|---|---|
| Accueil | Tableau de bord | toujours |
| 🏗️ Exploitation chantier | Chantiers & intérim, Planning sem./mois, Relevés d'heures, EPI & harnais | secteur BTP actif (planning/relevés selon option) |
| 👥 Ressources humaines | Salariés & dossiers, Registre de sécurité, Registre de formation, Pipeline Formation, Contrats & documents, Congés & absences, DPAE | RH toujours ; registres/pipeline selon secteur |
| 💰 Paie & frais | Variables de paie, Notes de frais | si option active |
| 🛡️ Conformité & santé | Alertes légales, Visites médicales, Suivi arrêts & AT, DUERP, Disciplinaire, Journal des événements | selon options |
| 🎯 Recrutement | Vue d'ensemble, Fiches de poste, Annonces, Candidathèque, Vérif. documents, Postes & Pro | selon options |
| ⚙️ Assistant & config | Lexi — assistante juridique, Paramètres entreprise | toujours (paramètres : admin) |
| Entrées ajoutées par modules | Lecture intelligente de documents, Parc véhicules, Entretiens annuels, EPI Nettoyage, Registre du personnel, Messagerie | selon activation |

Le menu s'ouvre en rail + volet : cliquer une rubrique ouvre le volet, choisir une entrée le referme. Le fil d'Ariane « Accueil › … » apparaît en haut de chaque page.

## 3. Tableau de bord

- **4 indicateurs** : salariés actifs, congés en attente (à valider), alertes urgentes, masse salariale (somme des salaires bruts mensuels).
- **Actions rapides** : nouveau salarié, demande de congé, générer un document, visites médicales, question juridique (Lexi), DUERP.
- **Radar RH** (4 cartes cliquables, vert/orange/rouge) : visites médicales (planifiées / en retard), DUERP (âge du dernier Document Unique : orange à 330 jours, rouge à 365), périodes d'essai en cours, fins de CDD dans les 60 jours.
- **Intégrations en cours** : barre de progression par salarié sur 9 tâches (voir §5) et alerte « intégration non démarrée » pour les embauches de moins de 90 jours sans tâche cochée.
- **Congés à valider** (4 premiers, boutons ✅/❌), **Alertes urgentes** (4 premières), **Mon équipe** (5 premiers).
- **Tableau des soldes de congés payés** de tous les salariés actifs.
- En secteur BTP : un agrégat chantiers s'ajoute (voir manuel BTP).

## 4. Salariés — création et modification

**Champs obligatoires** : prénom, nom (mis en majuscules automatiquement), poste, **civilité** (M. / Mme). Tout le reste est facultatif.

Sections de la fiche :
1. **Identité** : prénom, nom, intitulé du poste, email, civilité, téléphone (formaté automatiquement), département/service, **catégorie** (Ouvrier, Employé, Agent de maîtrise, Technicien, Cadre), et en BTP le **rôle chantier** (Auto selon le poste / Monteur / Manutentionnaire / Ni l'un ni l'autre).
2. **Contrat** : type (CDI, CDD, Apprentissage, Professionnalisation, Stage), statut (Actif / Période d'essai), date d'embauche, fin de contrat (CDD et alternance), salaire brut mensuel, durée hebdomadaire (35, 37, 38, 39, 40, 17h30, 24, 28), **jours travaillés** (cases Lun→Dim, indispensables au planning), horaires d'arrivée/départ (8h30–17h30 par défaut). Alternance : CFA, diplôme, tuteur, année.
3. **Données légales** (repliable) : naissance, lieu, n° de sécurité sociale (formaté, validé à 15 chiffres), adresse, nationalité (liste mondiale), situation familiale, enfants à charge, mutuelle.
4. **Permis** : catégories A, B, BE, C, CE, D, CACES, date d'expiration. **Véhicule** : aucun / de fonction (pro + perso) / de service (pro) / personnel (indemnités kilométriques : puissance 3 à 7 CV, électrique +20 %), modèle, immatriculation, carte carburant.
5. **Visite médicale** : « Pas de VM — à planifier dans les 3 mois » ou « VM valide existante » (date et centre : enregistrée comme réalisée, aucune alerte).
6. **Contact d'urgence** : nom, lien, téléphone, groupe sanguin, allergies.

**Règles automatiques à la création** :
- Période d'essai calculée selon contrat et catégorie : CDI ouvrier/employé 2 mois, agent de maîtrise/technicien 3 mois, cadre 4 mois ; CDD 1 mois (règle 1 jour par semaine plafonnée à 2 semaines si contrat ≤ 6 mois, 1 mois au-delà) ; apprentissage/professionnalisation 45 jours ouvrés. La date de fin d'essai est stockée même si dépassée pour que l'alerte fonctionne.
- Le statut devient « essai » si la fin d'essai est future.
- Un **contrat est généré automatiquement** (CDI, CDD ou apprentissage selon le type) et classé dans Documents ; l'historique et le journal sont alimentés.
- Si le salarié vient du recrutement (« Recruter » depuis un candidat), le candidat passe à « embauché » et la fiche de poste liée à « pourvu ».
- À la modification du salaire : proposition de générer **automatiquement un avenant**.
- Le cache du planning du salarié est effacé pour recalculer à partir des jours cochés.
- **Archivage** (🗂) : réversible, propose de générer certificat de travail et solde de tout compte.

## 5. Dossier salarié (onglets)

Infos (photo, horaires, durée, soldes CP, permis, mutuelle, augmentation prévue) · Dossier/Documents (documents générés, bouton « Générer un document ») · Pièces scannées (types : pièce d'identité, carte vitale, RIB, permis, titre de séjour, diplôme, attestation PE précédent, arrêt maladie, autre ; 4 Mo max ; actions voir/imprimer/mail/télécharger/supprimer ; un **arrêt maladie** joint crée automatiquement l'absence dans Congés) · Congés · **DPAE** · Urgence · **Intégration** · Historique · Messages.

**Documents reçus à l'embauche** (case à cocher + liste imprimable « Documents à fournir ») : pièce d'identité, carte vitale + attestation, RIB, justificatif de domicile (< 3 mois), photo d'identité, diplômes/certifications, permis (si requis), titre de séjour (hors UE), attestation France Travail, attestation de mutuelle précédente (dispense).

**Intégration** — 9 tâches avec échéances automatiques : signature du contrat (J0), livret d'accueil (J0), accès informatiques (J+1), présentation de l'équipe (J+3), visite médicale d'embauche (J+90 = 3 mois), formation sécurité (J+7), configuration du poste (J+1), équipements/badges (J+1), entretien de fin de période d'essai (à la date de fin d'essai). Couleurs : vert fait, rouge en retard, orange à ≤ 2 jours. Pense-bête **VM d'embauche (VIP)** : « à planifier avant le [date] (3 mois après la prise de poste, art. R.4624-10) », boutons Planifier la VM / VM valide fournie.

**DPAE** : fiche pré-remplie (employeur, SIRET, NAF, salarié, naissance, lieu, NSS, nationalité, contrat, date et heure d'embauche) ; boutons imprimer, télécharger, **ouvrir Net-entreprises**, marquer envoyée. Rappel : à transmettre à l'URSSAF **au plus tard la veille de l'embauche** (art. L.1221-10), sinon risque de travail dissimulé.

## 6. Congés et absences

- **Acquisition** : période de référence du **1er juin au 31 mai** ; 2,5 jours par mois complet travaillé, plafond 25 jours ; « pris » = congés payés validés sur la période. Les soldes (acquis, pris, restants, date d'expiration) sont affichés par salarié.
- **RTT** : nombre annuel défini dans les paramètres ; solde = attribués − pris sur l'année civile.
- **Types d'absence** : Congés payés, RTT, CET, maladie, sans solde, maternité, paternité, formation, mariage (4 j), mariage enfant (1 j), naissance (3 j), décès conjoint/parent/fratrie (3 j), décès enfant (5 j + 7 j de deuil), absence injustifiée (retenue sur salaire, déclenche une alerte), activité partielle (APLD, à déclarer en DSN), grève (libellé neutre sur bulletin), ancienneté.
- **Cycle** : une demande est « en attente » → le dirigeant **valide ou refuse** → le salarié est notifié ; une annulation demandée par le salarié (statut « annulation demandée ») est acceptée (jours recrédités) ou refusée (congé maintenu). Un congé validé peut être modifié ou supprimé.
- **Vues** : Liste (avec actions), Calendrier du mois en cours (vert congé validé, orange attente, rouge refus/maladie), Vue annuelle (matrice salariés × 12 mois, couleur selon le nombre de jours : 1-4, 5-9, ≥ 10) avec Excel.
- **Alertes liées** : congés à solder avant le 31 mai (≥ 5 jours restants dans les 60 jours précédents), solde élevé en novembre-décembre (> 10 jours).
- **Import des soldes** (module générique) : voir manuel complémentaire.

## 7. Contrats et documents

**Génération** (Contrats & documents → « Générer », ou depuis la fiche) : choisir le type, le salarié (les champs se pré-remplissent), la date, le lieu, le salaire, le poste, le début, la durée hebdomadaire, la fin (CDD) et les champs propres au document, puis **⚡ Générer**. Sorties : **Imprimer**, **Word (.doc)**, **Modifier & sauvegarder** (éditeur de texte riche : gras, italique, souligné, alignement, taille), sauvegarde dans l'application.

Catalogue (17 documents légaux annoncés + documents de remise) :
- *Contrats d'embauche* : CDI, CDI temps partiel, CDD, apprentissage, professionnalisation, convention de stage.
- *Période d'essai* : confirmation de fin de PE, renouvellement, rupture de PE.
- *Avenants* : augmentation de salaire, changement de poste, passage à temps partiel, accord de télétravail.
- *Fin de contrat* : courrier de fin de CDD, certificat de travail, reçu pour solde de tout compte.
- *Disciplinaire* : avertissement, convocation à entretien préalable.
- *Divers* : attestation de travail, promesse d'embauche.
- *Documents de remise* : livret d'accueil, remise de matériel (liste), remise de véhicule (modèle, immat., kilométrage, assurance), dispense de mutuelle.

**CDD** : motif de recours **obligatoire** (remplacement d'un salarié absent / passé à temps partiel / avant prise de poste / parti définitivement, remplacement du chef d'entreprise, attente d'un CDI, accroissement temporaire d'activité, commande exceptionnelle à l'export, travaux urgents de sécurité, emploi saisonnier, contrat d'usage, vendanges, contrat senior, CUI-CIE, PEC, complément de formation, CDD d'insertion SIAE) avec nom du salarié remplacé si besoin. **Période d'essai** : suggestions de durée et rappel des plafonds (CDI ouvrier/employé 2 mois max 4 avec renouvellement ; technicien 3 max 6 ; cadre 4 max 8) avec avertissement « votre convention collective peut prévoir moins ».

## 8. Alertes légales (socle)

Chaque alerte a une sévérité : **rouge** (urgent), **orange** (à venir), **bleu** (à planifier). Le bouton **Traité / OK** la masque (les alertes marquées traitées sont mémorisées) ; certaines proposent un **Courrier** pré-rempli ou **Valider PE**.

| Alerte | Déclenchement |
|---|---|
| Fin de période d'essai | de 90 jours après dépassement jusqu'à 30 jours avant ; rouge si dépassée ou ≤ 7 jours |
| Fin de CDD | de −3 à +60 jours |
| Visite médicale d'embauche à planifier | dès l'embauche, bleu puis orange à ≤ 30 jours, rouge si > 3 mois (art. R.4624-10) ; « VM obligatoire manquante » si aucune VM planifiée après 3 mois |
| Visite médicale planifiée en retard / imminente | en retard = rouge ; imminente = ≤ 7 jours |
| Renouvellement de VM | 5 ans après la dernière visite réalisée, alerte à 90 jours (rouge ≤ 30) |
| Aucune visite médicale depuis l'embauche | > 30 jours (rouge après 90) |
| 1 an d'ancienneté | dans les 14 jours : entretien annuel recommandé |
| Entretien professionnel | tous les 2 ans (art. L.6315-1), à 60 jours (rouge ≤ 14) |
| Solde de congés | novembre-décembre > 10 jours ; avant le 31 mai ≥ 5 jours |
| Congé en attente | tout congé non traité |
| DUERP | non renseigné (rouge), renouvellement à 330 jours (orange), 365 jours (rouge) ; action en retard (échéance dépassée et avancement < 100 %) |
| DPAE manquante | de J−8 à J+3 de l'embauche si non marquée envoyée ; rouge à ≤ 1 jour |
| Semaines non validées | à 3 jours de la fin du mois si le planning n'est pas saisi |
| Augmentation à activer | 30 jours avant la date d'effet |
| 13e mois à préparer | avril-mai/octobre-novembre selon le mois de versement |
| Candidat sans avancement (option Recrutement Pro) | > 15 jours dans la même étape (rouge > 30) |

D'autres alertes sont ajoutées par les modules (documents expirés, habilitations, EPI, véhicules, chantiers, minima conventionnels…) : elles figurent dans les manuels de ces modules. Le total effectif d'alertes dépasse donc les « 21 alertes » du discours commercial, qui désigne le socle.

## 9. Journal des événements

Traçabilité de toutes les actions RH (documents, congés, alertes, dossiers) sur les 100 dernières entrées, regroupées par mois, avec un résumé mensuel (documents, congés traités, alertes, dossiers). Argument : valeur probante en cas de litige.
