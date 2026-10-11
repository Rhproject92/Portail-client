# Manuel expert RHproject — 02. Options et modules transverses

> Suite du manuel 01. Source : lecture du code de l'application (build 2026-04-08). Les points marqués **(à vérifier à l'écran)** n'ont pas été confirmés en situation réelle.

## 1. Planning hebdomadaire et temps de travail (option « Planning », 49,90 €/mois)

**Prérequis** : cocher les jours travaillés dans chaque fiche salarié (sinon le planning affiche « Configuration requise » avec la liste des salariés concernés) et renseigner la durée hebdomadaire.

**Planning de la semaine** (menu *Planning sem./mois*) :
- 4 indicateurs : effectif actif, heures supplémentaires, absences (jours), couverture.
- Navigation semaine par semaine ; deux vues : *Planning semaine* (tous les collaborateurs) et *Synthèse mensuelle*.
- Chaque cellule jour affiche les heures ; clic = édition rapide (début, fin, saisie au quart d'heure ; « Repos » ; bouton « + » pour forcer un jour non contractuel). Week-end marqué « WE ».
- Calcul : durée arrondie au quart d'heure, **pause de 1 h déduite au-delà de 6 h** (art. L.3121-16) ; pause paramétrable par salarié (60 min par défaut).
- Un congé validé injecte automatiquement l'absence dans le planning.
- **Validation de semaine** : bouton « ✅ Normale » (valide la semaine aux heures contractuelles) ou « ✏ Heures » (saisie rapide). Alerte de fin de mois si des semaines ne sont pas saisies.
- Exports : CSV du planning, relevé hebdomadaire (HTML imprimable).

**Alertes légales du planning** : journée > 10 h ; semaine > 48 h (erreur) ; heures supplémentaires > base + 8 ; solde CP < 5 jours ; forfait cadre ≥ 200 jours sur 218 ; ≥ 2 absences injustifiées dans le mois (« vérifier procédure disciplinaire ») ; RTT non pris > 3 jours après octobre ; **temps partiel à 35 h ou plus dans la semaine (risque de requalification en temps plein)**.

**Heures supplémentaires** : majoration 25 % pour les 8 premières, 50 % au-delà (art. L.3121-36). Base mensuelle = durée hebdomadaire × 52 / 12.

**Synthèse mensuelle** : par salarié, heures contractuelles / réelles / HS 25 % / HS 50 % / absences CP, RTT, maladie ; primes multiples ; 13e mois automatique si activé (juin+décembre : moitié/moitié, ou décembre) ; augmentation active ce mois ; note pour le comptable ; total brut estimé et coût employeur approximatif ; export CSV comptable ; relevés mensuels (individuel ou tous).

**Relevés d'heures** (menu dédié) : relevé mensuel individuel à signer (salarié + employeur), conservation 5 ans rappelée.

**Augmentation de salaire** (bouton depuis la fiche) : salaire actuel, nouveau salaire, motif (ancienneté, mérite, revalorisation SMIC, promotion, autre), **date d'effet = 1er du mois suivant**, note pour le comptable ; génère l'**avenant**. Le salaire est activé à la date d'effet ; alerte 30 jours avant.

## 2. Congés — fonctions avancées

- **Acquisition automatique** des CP (2,5 j/mois, période du 1er juin au 31 mai), resynchronisée au chargement et toutes les heures.
- **Contrôles avant validation** : salarié existant, **doublon de période** (seul vrai blocage), cohérence planning (avertissement).
- **Demi-journée** : proposée quand un seul jour ouvré est demandé (minimum 0,5 j).
- **Solde insuffisant ou négatif** : jamais bloquant. Une fenêtre à 3 choix s'ouvre : *valider avec anticipation* (prélèvement sur la période suivante N+1), *valider quand même* (solde négatif accepté) ou *annuler*. Tout est tracé au journal.
- **Fiche salarié → onglet Congés** : solde réel (peut être négatif), demandes en attente, historique, « nouvelle demande » ou « valider directement » (workflow express), **grand livre CP** mois par mois (crédits/débits, jusqu'au 31 mai, passé/présent/futur) et **projection** à une date choisie.
- **Calendrier** : cercles par jour, sélecteur de mois (±6 mois), **jours fériés** (dont Pâques calculé), clic sur un jour = demande pré-remplie, mini-popup détail ; onglet **Synthèse** (soldes + projection jusqu'au 31 mai) ; liste avec filtres rapides et compteurs.
- **Bloc « Aujourd'hui »** du tableau de bord : qui est absent/en congé ce jour ; encart soldes ; alertes de solde négatif/anticipation.
- **Validation hiérarchique (Équipes & Managers)** : dans Paramètres, créer des équipes avec un manager responsable et des membres ; une demande d'un salarié ayant un manager passe « en attente manager » avant la RH (la RH peut court-circuiter) ; le manager est notifié ; le compteur du tableau de bord inclut ces demandes.
- **Annulation** : annulation demandée → acceptée (jours recrédités, statut « annulé ») ou refusée (congé maintenu).
- **Messagerie salarié ↔ RH** : onglet *Messages* dans la fiche + boîte de réception (menu *Messagerie*) ; badge des messages non lus ; message automatique au salarié à la validation/refus. **(à vérifier à l'écran : dans le code, l'échange passe par un stockage local partagé avec l'espace salarié ; confirmer le fonctionnement en production)**
- **Import des soldes de congés** (module générique, accès par un bouton dédié).

## 3. Visites médicales (enrichies)

- **Paramètres** (entreprise) : centre médical du travail, adresse, téléphone, heure habituelle, médecin référent, périodicité par défaut.
- **Planification** : types (visite d'embauche / information et prévention VIP, périodique, reprise, à la demande, suivi individuel renforcé, avec périodicité par défaut selon le type), date, heure, centre, médecin, notes.
- **Convocation** imprimable/Word (référence VM-AAAA-NNN, rappel des pièces à apporter, signatures employeur et salarié) enrichie du médecin, du téléphone et des mentions légales selon le type.
- **Avis d'aptitude** à la clôture : apte / apte avec réserves / inapte, réserves, pièce jointe (rattachée aux pièces du salarié), prochaine échéance calculée. Un bandeau s'affiche dans la fiche si réserves ou inaptitude.
- **Tableau de conformité** : statut par salarié (à jour, proche, urgent, en retard, absent) trié par urgence, export.
- **Alertes** : réserves actives, inapte non traité, périodicité réelle.
- **Visite de reprise** (via Suivi arrêts & AT) : obligatoire selon la durée de l'arrêt, échéance 8 jours ouvrés après la reprise, raccourci « planifier ».

## 4. Habilitations et formations (fiche salarié → onglet 🎓 Habilitations) — tous secteurs

- **Types proposés** : CACES R489 (chariots élévateurs), R482 (engins de chantier), R486 (nacelles/PEMP), R484 (ponts roulants), R485 (chariots à conducteur porté) ; habilitation électrique ; SST ; travail en hauteur ; amiante ; gaz/fluides frigorigènes ; formation incendie/EPI ; ATEX ; **échafaudages fixes (R408)**, **échafaudages roulants (R457)** ; **carte BTP / CIBTP** ; **certificat de spécialisation Échafaudeur** ; **CQP Monteur d'échafaudage** ; autre.
- **Champs** : type, précision (catégorie, B2V…), dates d'obtention et d'**expiration (obligatoire)**, organisme, n° de certificat, pièces jointes PDF/images (8 Mo max chacune).
- **Statuts de recyclage** : valide > 90 j ; à surveiller ≤ 90 j (bleu) ; à programmer ≤ 60 j (orange) ; urgent ≤ 30 j (rouge) ; expiré (rouge, « à recycler avant reprise du poste »).
- **Types « gradués »** (R408, R457, travail en hauteur) : jamais « expirés » ni rouges ; paliers progressifs — « Recyclage dans N j », « Recyclage à programmer » (jusqu'à 2 ans de dépassement), « Recyclage fortement recommandé » (au-delà).
- **Types sans expiration légale** : certificat de spécialisation échafaudeur, CQP monteur.
- Ces habilitations alimentent les alertes (section « 🔵 À surveiller ») et, en BTP, le **registre de formation**, le **pipeline formation** et le **blocage souple à l'affectation** (voir manuel BTP).

## 5. Registre du personnel (art. L.1221-13)

Génération 100 % automatique à partir des fiches : ordre chronologique d'entrée, nom, prénom, naissance, sexe (dérivé de la civilité), nationalité, poste, contrat, dates d'entrée et de sortie, **motif de sortie** (collecté à l'archivage : démission, fin de CDD, licenciement pour motif personnel, licenciement économique, rupture conventionnelle, fin de période d'essai…), type et numéro du titre de travail (si l'option Vérification de documents est active). Filtres (actifs/sortis/incomplets), recherche, **ancienneté**, alerte « fiche incomplète » (champs légaux manquants) avec clic vers la fiche. Exports : **Excel 4 onglets** (tous, actifs, sortis, incomplets avec champs manquants), **impression**, **envoi par email** (texte copié ou messagerie). Mention légale : conservation 5 ans minimum après le départ du dernier salarié inscrit. Le tableau de bord affiche aussi **masse salariale** et **ETP mensuel** (les salariés « en essai » comptent comme actifs).

## 6. Importations en masse (Paramètres → Import de données)

- **Salariés (Excel)** : modèle à télécharger, colonnes obligatoires *Civilité, Prénom, Nom, Poste, Type_Contrat, Date_Embauche* ; formats stricts (dates AAAA-MM-JJ, contrats CDI/CDD/Apprentissage/Professionnalisation/Stage, civilité M./Mme, catégorie Ouvrier/Employé/Agent de maîtrise/Technicien/Cadre, statut actif/essai). Contrôle avant import : lignes valides, doublons détectés (nom+prénom), lignes en erreur non importées.
- **Documents en masse** : fichiers nommés `NOM_Prenom_TypeDocument.extension` (ex. DUPONT_Marie_CNI.pdf) associés automatiquement au bon salarié ; association manuelle possible ; types reconnus incluant CNI, titre de séjour, permis, visite médicale, attestation CPAM, certificat de travail, solde de tout compte, promesse d'embauche.
- **Export** des données en JSON ; **suppression RGPD** de toutes les données ; vider les salariés ; tout réinitialiser (actions irréversibles).
- C'est la fonction clé de la **mise en place initiale** par l'Expert RH (offres Sérénité/Pilotage).

## 7. Option Variables de paie (29,99 €/mois ; incluse en F2/F3)

- **Tableau de bord du mois** : salariés *validés / en cours / non commencés*, alerte « à transmettre avant le [date limite] » (échéance paramétrée : 15, 20 ou 25 du mois), badge de menu dans les 10 jours qui précèdent.
- **Saisie par salarié** : temps de travail (contractuel, réel, HS ; heures de nuit ; jours fériés travaillés ; CP pris du mois repris automatiquement ; dates d'arrêt maladie), **véhicule** (fonction : avantage en nature + carburant ; service ; personnel : indemnités kilométriques), **frais professionnels** (lignes date / nature / montant / justificatif joint), **éléments variables** (primes multiples, tickets restaurant en nombre de jours, avance sur salaire, sortie en cours de mois = solde de tout compte), note pour le comptable ; bouton **Valider**.
- **IKM** : barème URSSAF 2025 reconduit pour 2026 selon la puissance fiscale (3 à 7 CV) et tranches 0-5 000 km, 5 001-20 000 km, au-delà ; **+20 % pour un véhicule électrique**.
- **Relevé kilométrique** : fiche mensuelle vierge à remettre au salarié (20 lignes), export Excel, **envoi Outlook**, **import du fichier Excel retourné** par le salarié (2 Mo max).
- **Bannière SMIC** : 15 jours après une revalorisation, vérifier les salaires (taux et dates dans Paramètres ; valeurs par défaut du code : 12,02 €/h au 01/01/2026 ; mensuel 35 h = taux × 151,67).
- **Transmission au comptable** : *Fiche de transmission PDF*, **Export comptable** (CSV/Excel avec colonne frais remboursés hors brut), **Export Silae** (CSV d'import : préfixes EV- éléments variables, HS- heures sup, AB- absences, AC- acomptes ; **matricule Silae** par salarié et **mapping des codes rubriques** à configurer une fois), **justificatifs** en ZIP ou **bibliothèque** (consultation, PDF, envoi comptable).
- **Passerelle Notes de frais → Variables de paie** : encart « notes de frais du mois » en tête de la section frais, bouton de report des notes **validées** (sans doublon), pastille rouge « X € à reporter » sur la liste.

## 8. Option Notes de frais (14,99 €/mois)

Saisie (date, salarié, motif, montant TTC, justificatif réel stocké), liste par mois avec sélecteur, **validation / annulation de validation**, suppression ; total des frais validés ; intégration à l'export comptable (colonne FRAIS.REMB, hors brut). Le justificatif voyage jusqu'au comptable (voir §7).

## 9. Option Suivi arrêts & AT (14,99 €/mois)

- Déclaration d'un arrêt : type (**arrêt maladie / accident du travail / maladie professionnelle**), début, fin prévue, **date de réception** (déclenche le compte à rebours DSN).
- **Signalement DSN « arrêt de travail » : 5 jours ouvrés** à compter de la connaissance de l'arrêt (week-ends et fériés exclus) ; compteurs *en cours / DSN à faire / DSN en retard* ; boutons *DSN transmise, prolonger, clôturer, supprimer*.
- **Impact paie du mois** : jours d'arrêt, **carence** (CPAM pour la maladie ; défaut légal 3 jours, paramétrable ; AT/MP selon réglage), jours IJSS nets, **maintien de salaire employeur** (ancienneté mini 12 mois, 90 % puis 66,66 % pendant 30 jours chacun — valeurs par défaut légales, paramétrables dans Paramètres), colonne **VM de reprise** (obligatoire selon seuils, échéance 8 jours ouvrés). Le calcul exact reste sur le bulletin de paie : l'outil prépare les colonnes dédiées de l'export CSV.
- **Subrogation** et **délai de carence** généraux : réglés dans Paramètres entreprise (subrogation non/oui ; carence 3/1/0 jour).

## 10. Option Rupture conventionnelle (29,90 €/mois)

Parcours guidé (menu *Conformité & santé*) : choix du salarié (CDI uniquement ; ancienneté calculée), case **salarié protégé** (alors procédure via l'inspection du travail, CERFA 14599, et non homologation DREETS), **indemnité légale minimale indicative** (¼ de mois par année jusqu'à 10 ans, ⅓ au-delà ; art. R.1234-2 ; sur salaire de base hors primes), saisie du montant retenu communiqué par la paie avec **alerte si inférieur au minimum**, dates (1er entretien, signature), calcul automatique de la **frise des délais** : fin de rétractation 15 jours calendaires, dépôt DREETS possible au plus tôt, instruction 15 jours ouvrables (reports si samedi/dimanche/férié), rupture possible au plus tôt. Génération de la **convocation à l'entretien** (L.1237-11 et suivants) et préparation de la convention ; lien vers **TéléRC** ; aide « attestation employeur France Travail » (DSN sous 5 jours ouvrés). Les documents restent en **BROUILLON** tant que la case « je confirme le montant définitif » n'est pas cochée.

## 11. Option Module Disciplinaire (29,90 €/mois)

Procédure en 3 temps : (1) identification (salarié, date des faits, catégorie — absences injustifiées, retards répétés, insubordination, faute professionnelle, négligence, violence, vol, harcèlement, divulgation…, description, témoins) ; (2) **sanction envisagée** : avertissement, blâme (pas d'entretien obligatoire), mise à pied disciplinaire (entretien préalable obligatoire ; date de début, durée en jours calendaires, 1 à 10 ; rend le salarié indisponible au planning), licenciement pour faute simple (préavis), faute grave (ni préavis ni indemnité), faute lourde (ni préavis, ni indemnité, ni CP) ; (3) **suivi d'étapes** : faits constatés → convocation envoyée → entretien tenu → sanction notifiée → clôturée.
**Délais surveillés** : notification dans les 2 mois des faits (alerte dès 55 jours, dépassement à 60), convocation sans entretien tenu après 30 jours, **notification dans le mois après l'entretien** (alerte à 28 jours). Génération Word de la **convocation** (entretien à ≥ 5 jours ouvrables, assistance possible) et de la **lettre de sanction** adaptée au type. Rappel : consulter un juriste avant tout licenciement. La procédure s'inscrit dans l'historique du salarié et le journal.

## 12. Option Recrutement Pro (39,00 €/mois ; l'écran d'activation affiche 39,90 € — incohérence de prix à corriger)

- **Onglets** : Tableau de bord, Postes, Pipeline, Refusés, Recrutés.
- **Fiches de poste** : intitulé, contrat, statut (ouvert / pourvu / suspendu), salaire, lieu, date de début souhaitée, motif (création, accroissement d'activité…), compétences, description ; **Word « fiche de poste »** et **« annonce d'emploi »**. Alerte poste ouvert depuis plus de 60 jours.
- **Pipeline candidat** : *Nouveau → Présélection → Entretien → Entretien 2 → Offre envoyée → Retenu → Recruté* (ou *Refusé*), source, disponibilité, prétentions, CV et lettre jointes, jours dans l'étape, alerte à 15 jours sans avancement (rouge à 30), vue **Kanban** et vue **Comparaison** côte à côte, comparatif par poste, statistiques de sourcing et taux de conversion.
- **Grille d'évaluation** (note /5 par critère : présentation/communication, compétences techniques, adéquation culturelle, prétentions salariales…) avec score cumulé et recommandation.
- **Guide d'entretien en 5 phases** : accueil, parcours, compétences (méthode STAR), présentation honnête du poste, clôture avec date de retour précise ; **liste des questions interdites** (religion, situation familiale, santé, origine, appartenance syndicale, âge).
- **Courriers** : convocation, refus, offre par mail ; **promesse d'embauche** Word (rappel : vaut contrat si emploi, date d'entrée et rémunération précisés) ; **compte rendu d'entretien** Word ; **DPAE** depuis le candidat.
- **Création de la fiche salarié en un clic** depuis un candidat retenu : période d'essai calculée, historique, puis fenêtre « Démarrer l'intégration » (9 étapes + livret d'accueil).
- Une version « Recrutement » plus simple (suivi, 3 onglets, grilles d'entretien téléphone/visio/présentiel) existe dans le socle, avec Fiches de poste, Annonces et Candidathèque.

## 13. Option Vérification de documents (29,99 €/mois) — titres de travail

- Fiche salarié (onglet Infos) : **type de document** (CNI française, passeport français, carte d'identité UE/EEE, passeport UE/EEE, titre de séjour, attestation provisoire de séjour, récépissé de renouvellement), numéro, expiration.
- **Documents UE/EEE** : vérification du **TIN européen** sur le site officiel (ouverture + confirmation valide/invalide).
- **Titres hors UE** : génération de la **demande d'authentification à la préfecture** (modèle par département, email préfecture paramétrable, envoi par la messagerie de son choix ou impression) avec **date limite de 48 heures ouvrables**. Passé ce délai sans réponse : action « valider le titre » ; si la préfecture signale un faux : « refuser ».
- **Alertes** : document expiré, expiration sous 60 jours, demande préfecture en attente / non envoyée, titre à valider (délai écoulé), TIN non vérifié.
- **Vue récapitulative** triée refusés → expirés → en attente → TIN → à jour ; paramètres entreprise : n° URSSAF, email préfecture, interlocuteur.

## 14. Autres modules disponibles dans l'application (à documenter en détail avec la fondatrice)

Lecture intelligente de documents (menu *docai*), Parc véhicules, Entretiens annuels, Matrice d'exigences par rôle, CCP entreprise, Indicateur SFECE, Corrections universelles (édition des modules), Import des soldes de congés — voir les manuels sectoriels BTP et Nettoyage pour ceux qui en dépendent.

## 15. Signature et classement des documents

Chaque document généré peut être **visualisé, imprimé, exporté en Word, envoyé par email** (le fichier est téléchargé puis le client mail s'ouvre avec le sujet pré-rempli ; il faut joindre le fichier), **marqué signé** ou remplacé par la **version signée importée** (PDF/image). Une pièce jointe est limitée à 4 Mo dans le dossier salarié, 8 Mo pour une habilitation.
