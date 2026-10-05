# PROMPT ESSAI V2 — RH Project (suite, nouvelle session)

## AVANT DE COMMENCER (pour Soraya)
1. Démarre la session avec le dépôt Rhproject92/Portail-client sélectionné.
2. Vérifie que GitHub est connecté (https://claude.ai/connect-github) et que l'app Claude est installée sur le dépôt. Sinon le push échoue en 403.
3. Joins à ce message : essai.html, admin.html, app.html (les versions de PRODUCTION actuelles).
4. Joins aussi les résultats des requêtes S1 à S9 (fichier backup/requetes-sauvegarde.sql) et le code des Edge Functions.

---

## CONTEXTE
Je suis Soraya, fondatrice de RH Project (SaaS RH B2B : BTP/échafaudage, Nettoyage, Médical, Généraliste). Je ne code pas : tu es mon architecte et développeur. Explique-moi tout en français simple, sans jargon, en phrases courtes.

Fichiers du dépôt : essai.html (inscription à l'essai), admin.html (mon back-office), app.html (application client, très gros fichier). Site en production sur www.rhproject.fr (GitHub Pages : ce qui arrive sur la branche principale part EN PRODUCTION). Supabase : projet trnfewfobndbzdhzwqnc (Paris). Stripe en mode LIVE.

Accès Supabase : tu n'as PAS d'accès direct.
- Tu écris les requêtes SQL ; je les colle dans Supabase > SQL Editor ; je te renvoie le résultat.
- Edge Functions : tu écris le code dans le dépôt (supabase/functions/<nom>/index.ts), puis tu me guides pas à pas pour le coller et le déployer dans le tableau de bord Supabase.
- Si tu as besoin du code d'une Edge Function existante, demande-le-moi.

## RÈGLES (non négociables)
1. SAUVEGARDE D'ABORD. Avant toute modification Supabase : requêtes SQL de sauvegarde (déjà dans backup/requetes-sauvegarde.sql, S1 à S9), résultats rangés dans backup/AAAA-MM-JJ/. Code de chaque Edge Function rangé dans supabase/functions/. Le dossier backup/ contient des données clients : ne JAMAIS le pousser sur la branche principale.
2. Git : travaille sur la branche de travail imposée par la session. Ne pousse JAMAIS sur la branche principale sans mon OK écrit. Un commit par étape, message clair en français. Si le push échoue en 403, ne boucle pas : dis-moi que c'est un problème de droits GitHub.
3. Supabase : chaque changement de base dans un fichier supabase/migrations/. Montre le SQL, explique-le simplement, donne le SQL de retour arrière. J'applique moi-même.
4. Ne supprime jamais de données ni de comptes réels. Seuls les comptes de test peuvent l'être.
5. Modifications ADDITIVES : ne supprime ni ne réécris de grandes parties sans mon accord. Pour désactiver une fonction, contourne-la.
6. Aucun secret (service_role, clé Stripe secrète) dans un fichier HTML. Les secrets vont dans les secrets des Edge Functions.
7. Stripe LIVE : aucune modification sans mon OK.
8. Brevo : ne plus l'utiliser dans le parcours d'essai. Laisse son code, ne l'appelle plus.
9. Un lot à la fois. Avant chaque lot : plan court (quoi, où, pourquoi, risques), puis ATTENDS mon OK.
10. Preuve avant chaque livraison : node --check sur tous les blocs <script> inline, diff, tests Playwright en 1280px et 375px (sans réseau Supabase si besoin). Puis un test réel pas à pas avec un compte test (soraya.proux+testN@rhproject.fr).

## DÉCISIONS (validées)
- D1 Essai : 7 jours.
- D2 Inscription UNIQUEMENT sur invitation : lien avec code unique généré dans admin. Pas d'inscription libre.
- D3 Un seul utilisateur pendant l'essai : ajout de membres bloqué par toutes les voies.
- D4 Contenu : formule F1 Autonomie + module métier du secteur. Options non payées visibles avec cadenas 🔒 : écran consultable, champs et boutons désactivés, message « Option disponible — contactez-nous : support@rhproject.fr / 06 07 50 61 13 ».
- D5 Fin d'essai : écran « Votre essai est terminé — vos données sont conservées 30 jours — nous vous recontactons », avec email, téléphone et bouton « Être recontacté ». AUCUN paiement en libre-service, ni pendant ni après l'essai.
- D6 Conversion toujours manuelle, par moi. Stripe sert UNIQUEMENT au prélèvement automatique SEPA. C'est moi qui active le client.
- D7 Prélèvement via Stripe (pas d'ICS propre) : adapter le texte du mandat SEPA du contrat généré par admin.
- D8 Liens d'essai et de prélèvement : bouton « Copier le lien » uniquement. Ni Brevo, ni messagerie.

## CE QUE LE LOT 0 A DÉJÀ ÉTABLI (sur les copies reçues ; REVÉRIFIE sur les versions de production)
Lignes indicatives, à revérifier.

Confirmés :
- P1/P3 essai.html : la fiche 'contrat' est écrite AVANT la connexion, sans contrôle d'erreur (l.335-350). Mot de passe aléatoire jamais communiqué (l.296), alors que le texte dit « identifiants envoyés par email ». Demande-moi si la production est déjà corrigée.
- P2 essai.html : statut, trial, formule, paiement_confirme fixés dans le navigateur (l.320-334).
- P5 app.html : _verifierAbonnement() (l.4164) renvoie false si essai fini, puis ouvrirSouscriptionOuSelection() (l.243) affiche showFormuleSelection() (l.51) qui mène à goToStripe() (l.308). Appelé en ~8 endroits (l.827, 1068, 1113, 1137, 1514, 1666, 4232, 4235).
- P6 app.html : registerUser / signUp (l.836-880), appelé l.1192, puis envoie vers la sélection d'offre.
- P7 app.html : upsert de cle='contrat' (l.686) qui ÉCRASE la fiche (trial, secteur, email, statut, paiement_confirme). À confirmer côté règles de sécurité avec S1.
- P8 app.html : S._trial calculé (l.1559) jamais affiché.
- P9 admin.html : lienEssai() (l.1820) sans code unique. envoyerLienPaiement (l.2354) et beaucoup d'envois passent par Brevo (envoyerMailBrevo l.2127, Edge Function send-brevo).
- P10 admin.html : renderTabActivite (l.1519) ne lit que les données de l'app, ni connexions ni modules ouverts.
- P4 à vérifier (SMTP / mot de passe oublié) : app.html appelle resetPasswordForEmail (l.971).

Nouveaux :
- N1 Durée d'essai codée à 5 jours dans essai.html (l.317, textes) et admin.html (lancerEssai) : passer à 7 (D1).
- N2 admin.html écrit la fiche contrat à plusieurs endroits avec upsert (l.1146, 1750, 3914, 4136, 4407) : vérifier qu'ils ne s'écrasent pas entre eux, et qu'ils restent permis après les nouvelles règles.
- N3 admin.html l.4831 : « solution provisoire à remplacer par create-account ».
- N4 Ajout d'utilisateurs : Edge Function create-membre (admin l.4597) + table membres_entite (lue par app.html l.1466). Trouver l'écran d'ajout d'utilisateurs dans app.html avant de bloquer (D3).
- N5 Les CGV d'app.html (l.483) citent soraya.proux@rhproject.fr au lieu de support@rhproject.fr : à harmoniser avec mon accord.
- N6 Aucun secret service_role / sk_live / clé Brevo trouvé dans les HTML (la clé anon publique est normale).
- Edge Functions appelées par les HTML : inscription-essai, create-account, create-membre, create-checkout, send-brevo, admin-impersonate-client, admin-toggle-client-access, ai-chat, extract-demo-document, plus stripe-webhook.
- Tables vues dans les HTML : donnees_rh, employees, membres_entite.

## TA MISSION, DANS L'ORDRE

### LOT 0 (à terminer, aucune modification)
1. Range les résultats S1-S9 dans backup/AAAA-MM-JJ/ (jamais sur main) et les Edge Functions dans supabase/functions/.
2. Analyse les règles de sécurité (RLS). Dis-moi en français simple : qui peut lire/écrire quoi dans donnees_rh, membres_entite, employees. Confirme ou infirme P7.
3. Rends un rapport confirmé / infirmé / nouveau pour P1 à P11, puis le plan détaillé du LOT 1. STOP : attends mon OK.

### LOT 1 — Sécuriser et fiabiliser l'inscription
a) Nouvelles règles sur donnees_rh (P7) : le client LIT sa fiche contrat, seuls admin et service_role l'écrivent ; les autres clés restent écrivables par le client. Neutraliser l'upsert contrat de app.html (contournement, pas suppression). Vérifier admin.html, stripe-webhook et les autres écritures légitimes.
b) Table essai_invitations : code unique, email, entreprise, secteur, id prospect, dates (créé / ouvert / inscrit / première connexion), client_id. Aucun accès anonyme direct.
c) Edge Function inscription-essai, tout côté serveur : vérifie le code, crée le compte avec le mot de passe choisi, écrit la fiche contrat (statut essai, dates calculées par le serveur, 7 jours, F1, secteur), écrit l'historique admin (cle='admin_notes'), marque l'invitation « inscrit ». Anti-robots : champ piège + limite de tentatives.
d) Edge Function d'enregistrement de l'ouverture du lien.
e) essai.html : lecture du code, formulaire pré-rempli, mot de passe + confirmation, case obligatoire « J'accepte les conditions de l'essai ; l'utilisation est mesurée pour m'accompagner », messages clairs (lien invalide, déjà utilisé, email existant avec lien « Me connecter »).
f) app.html : désactiver la 2e porte d'inscription (P6) avec le message « L'essai se fait sur invitation — contactez support@rhproject.fr ».
g) SMTP personnalisé avec support@rhproject.fr (P4) : guide pas à pas (je te donnerai les réglages de mon hébergeur mail), puis test « mot de passe oublié ».
Réussite : invitation → inscription → client « En essai » dans admin → déconnexion → reconnexion avec MON mot de passe → « mot de passe oublié » reçu.

### LOT 2 — Lien d'essai et suivi dans admin
- Fiches prospect et client : bouton « Générer et copier le lien d'essai ».
- Statut visible avec dates : Lien copié → Ouvert → Inscrit → Connecté. Passage automatique du prospect à « En essai ».
- Tableau de bord, liste « À appeler aujourd'hui » : lien non ouvert après 48 h ; inscrit jamais connecté après 24 h ; J+2 ; 2 jours avant la fin ; essai terminé.
- Boutons « Prolonger l'essai (+X jours) » et « Annuler l'essai », qui passent par le serveur.

### LOT 3 — Expérience client pendant l'essai
- Bandeau permanent « Essai gratuit — il vous reste X jours » + contact.
- Écran de bienvenue au premier accès : 3 premières actions par secteur. Montre-moi les textes avant de coder.
- Cadenas sur les options (D4).
- Blocage de l'ajout d'utilisateurs (D3), par toutes les voies.
- Table de journal d'activité : connexions et modules ouverts. Le client ne peut qu'ajouter des lignes pour lui-même ; l'admin lit tout.
- admin.html, onglet Activité : dernière connexion, nombre de connexions, modules ouverts, salariés créés.
- Fin d'essai selon D5, à la place de tout parcours de paiement (P5). Vérifie qu'AUCUN chemin ne mène à Stripe en libre-service.

### LOT 4 — Conversion et sortie
- « Copier le lien de prélèvement » par formule. Dis-moi comment vérifier dans Stripe que SEPA est activé et que les 900 € de frais d'installation sont inclus.
- Fiche client : état du mandat (en attente / signé) via stripe-webhook.
- « Paiement reçu (hors-ligne) » devient « Activer le client » : formule appliquée, essai retiré, statut actif, données conservées, historique.
- Texte du mandat SEPA adapté (D7).
- Prospect « Perdu » avec motif obligatoire, désactivation du compte (admin-toggle-client-access), alerte « Données à supprimer » 30 jours après la fin d'essai.

## MISE EN PRODUCTION (après chaque lot, avec mon OK)
Ordre : migrations SQL (par moi) → Edge Functions (par moi, guidée) → fichiers HTML (merge sur la branche principale après mon OK). Juste après : test réel de bout en bout en production avec un compte test. Si ça casse : retour arrière immédiat (SQL de retour + revert Git), puis explication.

## TEST FINAL (décris-le étape par étape)
1. Lien généré et copié pour un compte test
2. Ouverture en navigation privée → « Ouvert » dans admin
3. Inscription → « En essai » dans admin
4. Déconnexion / reconnexion avec mon mot de passe
5. « Mot de passe oublié » → email reçu
6. Option payante : cadenas, rien de saisissable
7. Ajout d'un utilisateur → bloqué
8. Modules ouverts → visibles dans l'onglet Activité
9. Fin d'essai forcée → écran de blocage, aucun paiement
10. Lien de prélèvement, mandat test, « Activer le client » → accès complet, données intactes
11. Le même parcours sur mobile (375px)

Commence par vérifier que tu peux pousser sur la branche de travail, puis reprends le LOT 0.
