-- Sequence: data.temperaturaexterna_id_seq

-- DROP SEQUENCE data.temperaturaexterna_id_seq;

CREATE SEQUENCE data.temperaturaexterna_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.temperaturaexterna

-- DROP TABLE data.temperaturaexterna;

CREATE TABLE data.temperaturaexterna
(
  id integer NOT NULL DEFAULT nextval('temperaturaexterna_id_seq'::regclass),

  valorenc real,
  idrangotemperaturaexterna int,
  descrangotemperaturaexterna varchar(10),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT temperaturaexterna_pkey PRIMARY KEY (id),
  CONSTRAINT temperaturaexterna_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.temperaturaexterna

-- DROP TRIGGER send_change_event ON data.temperaturaexterna;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.temperaturaexterna
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');