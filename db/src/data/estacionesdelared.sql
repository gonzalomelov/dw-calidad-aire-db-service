-- Sequence: data.estacionesdelared_id_seq

-- DROP SEQUENCE data.estacionesdelared_id_seq;

CREATE SEQUENCE data.estacionesdelared_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.estacionesdelared

-- DROP TABLE data.estacionesdelared;

CREATE TABLE data.estacionesdelared
(
  id integer NOT NULL DEFAULT nextval('estacionesdelared_id_seq'::regclass),

  idestaciondelared int,
  nomestaciondelared varchar(22),
  ubicestaciondelared geometry(geometry,32721),
  idbarrio int,
  nombarrio varchar(25),
  idccz int,
  nomccz varchar(5),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT estacionesdelared_pkey PRIMARY KEY (id),
  CONSTRAINT estacionesdelared_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.estacionesdelared

-- DROP TRIGGER send_change_event ON data.estacionesdelared;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.estacionesdelared
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');