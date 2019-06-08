-- some setting to make the output less verbose
\set QUIET on
\set ON_ERROR_STOP on
set client_min_messages to warning;

\echo # Loading database definition
begin;

\echo # Loading roles and privilege settings
\ir horas.sql
\ir estacionesDelAnio.sql
\ir diasSemana.sql
-- \ir fechas.sql

\ir metodos.sql
\ir contaminantes.sql
-- \ir contaminantescategorias.sql
\ir estacionesDeLaRed.sql
\ir diasImportantes.sql
\ir industrias.sql

commit;
\echo # ==========================================