-- ============================================================
-- RH Project — REQUÊTES DE SAUVEGARDE (LECTURE SEULE)
-- Elles ne modifient RIEN. Elles affichent seulement.
-- À coller dans Supabase > SQL Editor, UNE PAR UNE.
-- Pour chaque requête : clique sur la case du résultat (colonne "resultat"),
-- copie tout le texte, et renvoie-le-moi en indiquant le numéro (S1, S2...).
-- ============================================================

-- S1 — Règles de sécurité (RLS) : toutes les règles de toutes les tables
select coalesce(json_agg(p order by p.schemaname, p.tablename, p.policyname), '[]'::json) as resultat
from (
  select schemaname, tablename, policyname, permissive, roles, cmd, qual, with_check
  from pg_policies
  where schemaname in ('public','storage')
) p;

-- S2 — Quelles tables ont la sécurité (RLS) activée ?
select coalesce(json_agg(t order by t.table_name), '[]'::json) as resultat
from (
  select n.nspname as schema, c.relname as table_name,
         c.relrowsecurity as rls_active, c.relforcerowsecurity as rls_forcee
  from pg_class c
  join pg_namespace n on n.oid = c.relnamespace
  where c.relkind = 'r' and n.nspname = 'public'
) t;

-- S3 — Structure des tables (colonnes)
select coalesce(json_agg(c order by c.table_name, c.ordinal_position), '[]'::json) as resultat
from (
  select table_name, ordinal_position, column_name, data_type, is_nullable, column_default
  from information_schema.columns
  where table_schema = 'public'
) c;

-- S4 — Contraintes (clés primaires, uniques, étrangères) et index
select coalesce(json_agg(x), '[]'::json) as resultat
from (
  select 'contrainte' as type, conrelid::regclass::text as table_name,
         conname as nom, pg_get_constraintdef(oid) as definition
  from pg_constraint
  where connamespace = 'public'::regnamespace
  union all
  select 'index', tablename, indexname, indexdef
  from pg_indexes
  where schemaname = 'public'
) x;

-- S5 — Droits donnés aux rôles anon / authenticated sur les tables
select coalesce(json_agg(g order by g.table_name, g.grantee, g.privilege_type), '[]'::json) as resultat
from (
  select table_name, grantee, privilege_type
  from information_schema.role_table_grants
  where table_schema = 'public' and grantee in ('anon','authenticated')
) g;

-- S6 — Fonctions SQL et déclencheurs (triggers) de la base
select coalesce(json_agg(f), '[]'::json) as resultat
from (
  select 'fonction' as type, p.proname as nom, pg_get_functiondef(p.oid) as definition
  from pg_proc p
  where p.pronamespace = 'public'::regnamespace
  union all
  select 'trigger', tgname, pg_get_triggerdef(oid)
  from pg_trigger
  where not tgisinternal
) f;

-- S7 — Copie des fiches contrat (donnees_rh où cle = 'contrat')
-- ATTENTION : contient des données de clients. Garde ce fichier PRIVÉ.
select coalesce(json_agg(d order by d.updated_at), '[]'::json) as resultat
from (
  select client_id, cle, valeur, updated_at
  from donnees_rh
  where cle = 'contrat'
) d;

-- S8 — Combien de lignes par type de clé dans donnees_rh (pour comprendre)
select cle, count(*) as nb from donnees_rh group by cle order by nb desc;

-- S9 — Réglages Auth utiles à savoir : combien de comptes, confirmés ou non
select count(*) as nb_comptes,
       count(*) filter (where email_confirmed_at is not null) as confirmes,
       count(*) filter (where last_sign_in_at is null) as jamais_connectes
from auth.users;
