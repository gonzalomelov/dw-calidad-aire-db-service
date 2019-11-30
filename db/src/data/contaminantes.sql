-- Sequence: data.contaminantes_id_seq

-- DROP SEQUENCE data.contaminantes_id_seq;

CREATE SEQUENCE data.contaminantes_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.contaminantes

-- DROP TABLE data.contaminantes;

CREATE TABLE data.contaminantes
(
  id integer NOT NULL DEFAULT nextval('contaminantes_id_seq'::regclass),

  idcontaminante int NOT NULL UNIQUE,
  nomcontaminante varchar(4),
  idsubtipo int,
  nomsubtipo varchar(59),
  idtipo int,
  nomtipo varchar(23),
  muybuena real,
  buena real,
  aceptable real,
  inadecuada real,
  mala real,

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT contaminantes_pkey PRIMARY KEY (id),
  CONSTRAINT contaminantes_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.contaminantes

-- DROP TRIGGER send_change_event ON data.contaminantes;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.contaminantes
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');