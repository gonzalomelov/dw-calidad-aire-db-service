drop schema if exists staging cascade;
create schema staging;
set search_path = staging, public;

-- import our staging models
\ir staging.sql