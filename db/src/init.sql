-- some setting to make the output less verbose
\set QUIET on
\set ON_ERROR_STOP on
set client_min_messages to warning;

-- load some variables from the env
\setenv base_dir :DIR
\set base_dir `if [ $base_dir != ":"DIR ]; then echo $base_dir; else echo "/docker-entrypoint-initdb.d"; fi`
\set anonymous `echo $DB_ANON_ROLE`
\set authenticator `echo $DB_USER`
\set authenticator_pass `echo $DB_PASS`
\set jwt_secret `echo $JWT_SECRET`
\set quoted_jwt_secret '\'' :jwt_secret '\''


\echo # Loading database definition
begin;

\echo # Loading dependencies
-- functions for storing different settins in a table
\ir libs/settings/schema.sql
-- functions implementing authentication (parts of the lib are included in data and api schema)
\ir libs/auth/schema.sql
-- functions for reading different http request properties exposed by PostgREST
\ir libs/request/schema.sql
-- functions for sending messages to RabbitMQ entities
\ir libs/rabbitmq/schema.sql

-- save app settings
select settings.set('jwt_secret', :quoted_jwt_secret);
select settings.set('jwt_lifetime', '3600');
select settings.set('auth.default-role', 'webuser');


\echo # Loading application definitions
-- private schema where all tables will be defined
-- you can use othere names besides "data" or even spread the tables
-- between different schemas. The schema name "data" is just a convention
\ir data/schema.sql
-- entities inside this schema (which should be only views and stored procedures) will be 
-- exposed as API endpoints. Access to them however is still governed by the 
-- privileges defined for the current PostgreSQL role making the requests
\ir api/schema.sql
-- entities inside this schema  will be 
-- used by the Data Warehouse
\ir dw/schema.sql
-- entities inside this schema  will be 
-- used by the ETLs
\ir staging/schema.sql

\echo # Loading roles and privilege settings
\ir authorization/roles.sql
\ir authorization/privileges.sql

\ir authorization/camaras.sql
\ir authorization/contaminantescategorias.sql
\ir authorization/contaminantes.sql
\ir authorization/diasimportantes.sql
\ir authorization/diassemana.sql
\ir authorization/estacionesdelanio.sql
\ir authorization/estacionesdelared.sql
\ir authorization/fechas.sql
\ir authorization/horas.sql
\ir authorization/industrias.sql
\ir authorization/metodos.sql
\ir authorization/temperaturaexterna.sql

\echo # Loading sample data
\ir sample_data/data.sql

\echo # Loading data sources
\ir data/data_source/data.sql

\echo # Loading dw as data sources
\ir dw/data_source/data.sql

commit;
\echo # ==========================================
