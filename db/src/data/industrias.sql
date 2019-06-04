-- Sequence: data.industrias_id_seq

-- DROP SEQUENCE data.industrias_id_seq;

CREATE SEQUENCE data.industrias_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.industrias

-- DROP TABLE data.industrias;

CREATE TABLE data.industrias
(
  id integer NOT NULL DEFAULT nextval('industrias_id_seq'::regclass),

  idindustria int,
  nomindustria varchar(20),
  ubicindustria geometry(geometry,32721),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT industrias_pkey PRIMARY KEY (id),
  CONSTRAINT industrias_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.industrias

-- DROP TRIGGER send_change_event ON data.industrias;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.industrias
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id","nomindustria"]}');