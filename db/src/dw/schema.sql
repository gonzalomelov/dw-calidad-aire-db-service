drop schema if exists dw cascade;
create schema dw;
set search_path = dw, public;

-- import our dw models
\ir dw.sql