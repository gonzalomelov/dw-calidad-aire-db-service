-- Sequence: data.diasimportantes_id_seq

-- DROP SEQUENCE data.diasimportantes_id_seq;

CREATE SEQUENCE data.diasimportantes_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.diasimportantes

-- DROP TABLE data.diasimportantes;

CREATE TABLE data.diasimportantes
(
  id integer NOT NULL DEFAULT nextval('diasimportantes_id_seq'::regclass),

  iddiaimportante integer NOT NULL,
  nomdiaimportante character varying(20),
  idtipodiaimportante integer,
  nomtipodiaimportante character varying(20),
  idfecha integer,
  idhora integer,

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT diasimportantes_pkey PRIMARY KEY (id),
  CONSTRAINT diasimportantes_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.diasimportantes

-- DROP TRIGGER send_change_event ON data.diasimportantes;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.diasimportantes
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');