# Manuel expert RHproject — 03. Secteur BTP / échafaudage

> Source : lecture du code de l'application (build 2026-04-08), blocs « chantiers/BTP », « échafaudage », « EPI », « registres », « formation ». Les valeurs chiffrées citées sont les **valeurs par défaut du code** (paramétrables). Les points de droit sont ceux affichés par l'application : à faire valider par un juriste avant de les affirmer à un prospect.

## 1. Activation et périmètre

- Le module BTP est actif si le secteur du contrat est **BTP** et la formule **Sérénité (F2) ou Pilotage (F3)**, ou pendant un **essai** sur le secteur BTP. EPI & harnais est **inclus** dans l'offre BTP (pas d'achat séparé).
- Pendant l'essai : limites à **2 chantiers** et **5 intérimaires** (et 10 salariés au total).
- Le socle RH (manuels 01 et 02) reste disponible : fiches salariés, congés, documents, alertes, DUERP, visites médicales, habilitations, etc. Le module BTP s'y **ajoute** et se relie à lui (congés, arrêts, visites médicales, mises à pied disciplinaires, variables de paie, habilitations).
- Dans la fiche salarié, un champ **Rôle chantier** (Auto selon le poste / Monteur / Manutentionnaire / Ni l'un ni l'autre) distingue les **monteurs** (personnel productif) du personnel administratif. L'estimation des effectifs ne compte que les monteurs.

## 2. Vocabulaire du module

**Permanent** = salarié de l'entreprise ; **intérimaire** = mission fournie par une **agence** ; **intervenant** = l'un ou l'autre ; **créneau** = une plage horaire d'un intervenant sur un chantier un jour donné ; **sous-chantier** = partie d'un chantier avec son tonnage et sa phase (montage, location, démontage) ; **imprévu** = alerte de planning (disponibilité, conformité, chevauchement, absence, météo) ; **VGP** = vérification générale périodique ; **accréditation/badge** = autorisation d'accès d'une personne à un chantier.

## 3. Menu et organisation en trois « univers »

Menu **🏗️ Exploitation chantier** : *Chantiers & intérim*, *Planning sem./mois*, *Relevés d'heures*, *EPI & harnais*, plus *Chantier du jour* (module échafaudage). Dans *Chantiers & intérim*, une barre à deux niveaux :

| Univers | Onglets |
|---|---|
| **🏗️ Terrain** | Chantiers · Planning · Plan de charge · Imprévus (badge du nombre d'imprévus ouverts) · Période (affectation en masse) |
| **👷 Ressources** | Permanents · Intérimaires · Agences · Envois · Conformité |
| **💼 Gestion** | Relevés & facturation (agence) · Indemnités paie · Badges · Grille BTP |

Un **guide « Par où commencer »** (masquable, rouvrable) propose quatre étapes : régler la cadence, créer le chantier, lire l'effectif estimé dans le Planning, placer les intervenants (glisser-déposer possible). Un bouton « ? » flottant ouvre le tutoriel intégré (étapes cochées).

## 4. Chantiers et sous-chantiers

**Fiche chantier** : nom, client, **zone de trajet (1 à 5)**, dates de début et fin prévue, **budget main-d'œuvre**, **quantité à monter** (en **tonnes** ou en **m²**, convertie en tonnes avec 1 t ≈ 10 m² par défaut), grand déplacement (oui/non), adresse complète (**géocodée automatiquement** via la Base Adresse Nationale), chef d'équipe (parmi les permanents ou « autre » avec nom et téléphone), responsable sur site (nom, téléphone, email), **effectif requis**, consignes d'accès, heures de début/fin par défaut, **type d'horaire** (jour, nuit, 2×8, 3×8), distance dépôt→chantier en km, **pause repas par défaut**, **documents intérim exigés par le client** (exemple dans le code : Structura BTP). Chaque chantier a au minimum un sous-chantier ; on peut en ajouter (ex. « Façade nord », « Pignon ») avec nom, tonnage et **phase** (montage / location / démontage).

**Statut et indicateurs** : *feu tricolore* par chantier (effectif, budget, délai), **avancement** (tonnage réalisé saisi en priorité, sinon heures pointées ÷ heures estimées), coût main-d'œuvre estimé (permanents chargés + intérim facturé), budget consommé. Fermeture d'un chantier = « clore » (date de fin mise à aujourd'hui).

**Estimation automatique des ressources** : tonnage ÷ cadence. Cadences par défaut : **montage 2,5 t/jour/équipe**, **démontage 4,5 t/jour/équipe**, location 0 ; **équipe de 3 monteurs**. Le Planning affiche « il te faut X monteurs/jour », déduit les monteurs déjà engagés sur d'autres chantiers sur la période, signale l'écart à combler par de l'intérim, et le bouton **« Planifier cet effectif »** pré-remplit l'ajout rapide. Paramètres réglables : cadences, taille d'équipe, conversion m²↔tonnes.

## 5. Planning chantier

- **Vues** : *Par chantier* (grouper par chantier et sous-chantier, couleur stable par chantier) et *Par personne* ; **semaine ou mois** (la vue mois est une frise façon planning d'équipes : une ligne par intervenant, une colonne par jour, légende chantiers et permanent/intérim).
- **Créneau** : intervenant, chantier, sous-chantier, jour, début, fin, pause (minutes), option **nuit 🌙**, **horaires réels** facultatifs (si saisis ils remplacent le prévu). **Heures nettes = durée − pause** ; si aucune pause n'est saisie : pause du chantier, sinon **60 min si la journée dépasse 6 h** (art. L.3121-16).
- **Glisser-déposer** d'un créneau vers une autre cellule (change date, chantier, sous-chantier) avec contrôle des doublons.
- **Contrôles à l'affectation** (non bloquants par défaut, avec confirmation) : congé validé ou arrêt (maladie, AT/MP) sur la période ; **mise à pied disciplinaire** en cours ; **aptitude médicale** couvrant toute la période (visite + périodicité) ; chevauchement horaire ; double affectation ; **documents chantier exigés** manquants ; **badge** du chantier absent/expiré/expirant ; mission intérim hors période ; documents d'intérim manquants/expirés.
- **Report vers le planning RH** : bouton « Valider → RH/paie » qui reporte les heures des **permanents** de la semaine vers le Planning RH (donc relevés d'heures et variables de paie) ; les intérimaires sont exclus.
- **Période (Smart Planner)** : affecter en masse un intervenant sur une période (jours ouvrés lun-ven, 8h-17h par défaut) ; l'analyse indique « Plaçable » ou « Écarté » avec le **motif exact**, puis **+Affecter** ; **transfert ou duplication d'équipe** d'un chantier à un autre sur une période.
- **Plan de charge** : vue consolidée **multi-chantiers sur 6 semaines** (heures planifiées vs capacité des permanents disponibles), avec budget.

## 6. Imprévus, remplacement et météo

- **Journal des imprévus** (jamais bloquant) : disponibilité (congé, arrêt, visite médicale, inaptitude), conformité (documents, badge), chevauchement horaire, **absence signalée le jour même (no-show)**, météo. Statuts : ouvert / résolu / ignoré. Le badge de l'onglet compte les imprévus ouverts.
- **Présence du jour** : « ✅ Présent / ❌ Absent » par intervenant ; « Absent » crée un imprévu et propose un remplaçant.
- **Remplaçants** : « 🔍 Proposer un remplaçant » classe les candidats par **score sur 100** (aide à la décision : la validation reste humaine), permet de **simuler** (besoin monteurs du jour, écart intérim), d'**appliquer** ou d'**annuler le dernier remplacement** (historique de replanification).
- **Météo chantier** : coordonnées du chantier (géocodage), seuils réglables (par défaut **vent 50 km/h, gel 0 °C, canicule 35 °C**), vérification quotidienne automatique avec **anticipation** (alerte seulement si une équipe est planifiée ce jour-là). Information et alerte, jamais décision automatique.
- **Déclarer un arrêt intempéries** : sélection des salariés et des jours ; calcul **indicatif** : indemnité = heures indemnisables × taux horaire × **75 %**, **1re heure d'arrêt de la semaine non indemnisée**, plafonds **9 h/jour, 45 h/semaine, 55 jours (≈495 h) par an** ; crée les lignes dans les **variables de paie**. L'application rappelle que la déclaration CIBTP se fait sur l'espace entreprise CIBTP (elle ne la transmet pas) et que le calcul est à faire valider (expert-comptable/CIBTP).

## 7. Intérimaires et agences

- **Agences** (onglet Agences) : référentiel nom, email, contact, téléphone. Chaque agence sert à envoyer **ses seuls intérimaires** (cloisonnement). Les intérimaires sans agence sont signalés.
- **Fiche intérimaire** : prénom, nom, agence, qualification, **taux facturé (€/h)**, taux brut, statut de facturation (délégation / gestion), n° de badge, panier, transport, chantier d'affectation, mobile, email, début et fin de mission ; statut de **disponibilité déclaratif** (disponible / indisponible / à confirmer, à tenir à jour après contact avec l'agence).
- **Conformité documentaire** : les documents requis d'un intérimaire = **exigences de son agence ∪ exigences de sa qualification** (sans doublon) ; chaque document a un type, un fichier, une date d'expiration ; état « conforme / manquant / expire ». Alertes : documents expirés ou manquants, fins de mission ≤ 7 jours (« renouveler ou désaffecter »), chantier sans équipe.
- **Note DPAE** : pour l'intérim, la DPAE relève de l'agence (« aucune action requise de votre côté »).
- **Envois** : choisir *Planning prévisionnel* (semaine suivante) ou *Relevé d'heures* (semaine passée), la semaine, puis **envoyer à une agence ou à toutes** : génération d'un **PDF en couleurs** par chantier (adresse, chef, téléphone, personnes et jours), partage natif sur mobile ou, sur ordinateur, PDF téléchargé et fenêtre de choix **WhatsApp / email**. Journal des 20 derniers envois. **Rappel du lundi** : relevés S-1 à envoyer.
- **Relevé agence « aveugle »** : heures par jour **sans montants HT**. **Relevés & facturation** : conditions négociées par agence (secteur appliqué BTP/logistique ou pétrochimie, SMIC de référence, taux facturé par défaut, **majoration heures supplémentaires**, seuil hebdomadaire), saisie de la **facture reçue** (montant HT, date de réception, fichier PDF/photo) et **réconciliation** avec le relevé ; impression et **Excel** mis en forme.
- **Plannings des permanents** : envoi individuel (PDF, WhatsApp, email) avec chantiers, adresses, chefs et téléphones.

## 8. Indemnités chantier → paie (permanents)

Calcul à partir des créneaux du mois (jours en congé ou en arrêt écartés) : **panier** (10,50 €/jour par défaut), **trajet par zone** (zones 1 à 5 : 0 / 1,50 / 3,00 / 5,50 / 8,50 / 12,00 €), **grand déplacement** (remplace panier + trajet ce jour-là), **majoration nuit** (×1,20 par défaut), coefficient de charges 1,42 pour le coût chantier. Reporté dans les **variables de paie** et dans l'export comptable. Les intérimaires restent hors paie.
**Grille BTP** (onglet) : trajet / transport / repas par zone, « valeurs indicatives Île-de-France, modifiables » ; zone proposée selon la distance dépôt→chantier (≤ 10 km zone 1, ≤ 20 zone 2, ≤ 30 zone 3, ≤ 40 zone 4, au-delà zone 5) ; choix **grille BTP conventionnelle** ou **grille interne**.

## 9. Badges et accréditations

- **Badges par chantier** : n° de badge et expiration par personne ; groupement par chantier (en cours d'abord), avertissement si un badge non expiré existe déjà.
- Alertes : « aucun badge enregistré pour ce chantier », « badge expiré », « badge expire dans N jours ».
- **Module Chantier du jour** (menu *Chantier du jour*), trois onglets :
  - **📆 Aujourd'hui** : planning du jour avec **glisser-déposer des noms** vers les chantiers, absents du jour, qui est « faite aujourd'hui », **fiche chantier imprimable** (version client ou version interne), bandeau d'alertes (badges à faire, VGP en retard, absents, personnes en heures sup).
  - **🪪 Équipes et badges** : accréditations par chantier avec filtres (problèmes, bientôt expirées) et action Accréditer/Renouveler.
  - **🌙 Contrôles** : heures supplémentaires et de nuit, intérim du jour, matériel et VGP.
- **Heures de nuit** : plage par défaut **21h00 → 06h00**, majoration **25 %** ; un créneau à cheval est **découpé automatiquement** en heures de jour et de nuit. **Seuil d'heures supplémentaires hebdomadaire par défaut : 39 h** ; colonnes HS +25 %, HS +50 %, heures de nuit, créneaux mixtes. Paramètres « à régler selon votre convention collective BTP / accord d'entreprise ».
- **Intérim du jour** : disponibilités du jour par agence, avec un **avis de reprise** basé uniquement sur des critères professionnels (respect des consignes de sécurité, autonomie au montage, travail en équipe, qualité du travail) et la mention « ⛔ Ne pas reprendre ».
- **Matériel & VGP** : suivi de treuils, nacelles, plates-formes, autres ; **dernière VGP** et périodicité (3, 6 ou 12 mois) ; « VGP en retard » avec action « Faite aujourd'hui ». Rappel : la vérification est réalisée par un organisme ou une personne compétente, l'outil rappelle les échéances.
- Un **tableau de bord BTP** « Mon activité du jour » s'ajoute à l'accueil (cartes et indicateurs en anneaux).

## 10. Habilitations spécifiques à l'échafaudage et exigences par rôle

- **Types dédiés** : échafaudages fixes **R408**, échafaudages roulants **R457**, travail en hauteur, **carte BTP/CIBTP**, **certificat de spécialisation Échafaudeur**, **CQP Monteur d'échafaudage**, CACES (dont R486 nacelles), SST, etc. (voir manuel 02 §4 pour les statuts de recyclage).
- **Matrice d'exigences par rôle** (Paramètres, éditable) : pour **Manutentionnaire / Aide-monteur / Monteur** et pour chaque habilitation (R408 ou R457, travail en hauteur, CQP Monteur, Certificat Échafaudeur) : *Rien / Recommandée / Obligatoire*. Valeurs par défaut : manutentionnaire — hauteur recommandée ; aide-monteur — R408/R457 recommandée, hauteur obligatoire, CQP recommandé ; monteur — R408/R457 obligatoire, hauteur obligatoire, CQP et certificat recommandés.
- **Blocage souple à l'affectation** : si une habilitation obligatoire manque ou est dépassée, l'application **ne bloque jamais durement** mais exige une **mesure compensatoire** (accompagné par un monteur habilité ; renouvellement déjà planifié ; remplacement exceptionnel encadré ; autre à préciser) et un **validateur** choisi parmi les responsables autorisés (dirigeant, chargé d'affaires, responsable d'exploitation, directeur d'exploitation, chargé de planning — liste à configurer dans Paramètres). La **dérogation est journalisée**.

## 11. Registres, formation et certifications

- **Registre de sécurité** (menu RH ; art. R.4534-15 à 20) : vérifications d'échafaudage **journalière**, **de mise en service**, **contrôle périodique ≤ 3 mois**, et **VPG matériel EPI annuelle** (harnais/longes) ; date, chantier lié, objet, auteur, résultat *conforme / non conforme*, observations ; alerte « chantier actif sans contrôle trimestriel depuis plus de 90 jours ».
- **Registre de formation** : vue d'ensemble de **toutes les habilitations de tous les salariés**, filtrable par salarié, type, statut (à jour / à surveiller ≤ 90 j / échéance dépassée), triée par urgence.
- **Centres de formation agréés** (Paramètres) : nom, référent, email (obligatoire), téléphone, adresse, **agréé SFECE**, formations dispensées ; livré **pré-rempli avec des centres réels de l'annuaire SFECE** (emails à compléter).
- **Pipeline Formation** : besoins **détectés automatiquement** depuis les échéances d'habilitations, puis suivi par statuts **Identifié → Devis demandé → Devis reçu → Planifié → Réalisé → Facturé** ; demande de devis par email **centre par centre** (jamais groupée) ; devis joints (PDF/image, 5 Mo) avec **analyse IA optionnelle** (montant, centre) ; devis retenu ; financement ; indicateurs **budget engagé / budget consommé** ; passage à « Réalisé » = création de l'habilitation dans la fiche du salarié.
- **CCP entreprise** (Paramètres) : Certificats de Compétence Professionnelle **au niveau de l'entreprise**, 6 domaines — 1 échafaudages fixes (classes A/B/C), 2 étaiements (B/C), 3 plates-formes suspendues, 4 structures événementielles, 5 plates-formes de travail, 6 transport/monte-matériaux/monte-charge/ascenseurs pour grue ; cumul possible ; **dossier annuel** et **renouvellement à 4 ans**, alertes colorées (expiré rouge, ≤ 90 jours orange).
- **Indicateur SFECE** : compteur « X/Y habilitations R408/R457 SFECE-agréées » en tête de la vue Équipe.

## 12. EPI & harnais (menu *EPI & harnais*)

- **Fournisseurs** (nom, contact, email, téléphone, adresse) ; **articles** (casque, gilet avec couleur, gants, lunettes, chaussures avec pointure ; désignation, référence, prix HT, TVA, quantité, **seuil d'alerte**, **quantité cible**, validité) ; **valeur totale du stock**.
- **Commandes fournisseur** avec lignes dynamiques ; **réception = incrémentation du stock** ; **bon de commande PDF** (aperçu, impression, envoi par email).
- **Remises aux salariés** : décrémentent le stock, trace horodatée, **bon de remise PDF** avec signatures salarié et responsable.
- **Antichute individuel** : harnais, longe, connecteur, absorbeur, avec code QR, marque, modèle, taille, dates de fabrication et de mise en service, **historique des VGP**, prochaine VGP, indicateur « a arrêté une chute », photos ; actions **Vérifier** (ajoute une ligne d'historique) et **Changer** (réforme avec motif, attend le **retour physique** de l'ancien équipement, crée le nouveau) ; **campagnes de vérification groupée** (date, lieu, nom du vérificateur).
- **Fiche salarié → onglet EPI** ; **formation port du harnais** suivie séparément de la VGP équipement ; **alerte au départ** d'un salarié dont l'EPI n'est pas récupéré ; items EPI ajoutés à la checklist d'intégration en BTP.
- **Exports** : registre Excel et PDF. **Alertes** : VGP à prévoir, équipement réformé à récupérer, stock EPI bas, formation harnais manquante.
- **Lecture intelligente** : le bon de livraison EPI est volontairement en simulation (non branché au stock).

## 13. Alertes spécifiques BTP (en plus du socle)

Chantier sans équipe ; fin de mission intérim ≤ 7 jours ; relevé intérim S-1 à envoyer (lundi) ; document intérimaire expiré ; imprévus ouverts ; badge manquant/expiré ; VGP en retard ; stock EPI bas ; équipement réformé à récupérer ; formation harnais manquante ; habilitation expirée/à recycler ; absence de contrôle trimestriel au registre de sécurité.

## 14. Ce que ce module répond aux vraies douleurs d'une entreprise d'échafaudage

| Douleur terrain | Réponse dans RHproject |
|---|---|
| Savoir qui a quelle habilitation (R408/R457, hauteur, CACES) et quand elle tombe | Fiche habilitations + registre de formation + alertes par paliers + pipeline formation |
| Affecter quelqu'un sans papier valable sur un chantier | Contrôles à l'affectation, matrice par rôle, dérogation tracée |
| Pilotage monteurs/intérim sur plusieurs chantiers | Planning par chantier, plan de charge, estimation tonnage ÷ cadence, remplaçants scorés |
| Intérim : documents, relevés, factures | Conformité par agence/qualification, envois PDF cloisonnés, réconciliation des factures |
| Paniers, trajets, grands déplacements, nuit, intempéries | Barèmes réglables, report en variables de paie, déclaration d'intempéries indicative |
| EPI antichute à tracer et vérifier | Module EPI & harnais, VGP, campagnes, retour physique |
| Preuves en cas de contrôle ou d'accident | Registre de sécurité, journal des événements, registre du personnel, documents horodatés |

> Limites à dire clairement à un prospect : les barèmes et seuils sont des valeurs par défaut à adapter à la convention collective de l'entreprise ; le calcul d'intempéries est indicatif ; l'application ne transmet pas les déclarations CIBTP/DSN/DPAE à la place de l'employeur.
