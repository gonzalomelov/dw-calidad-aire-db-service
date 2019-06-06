-- Sequence: data.categoriascontaminantes_id_seq

-- DROP SEQUENCE data.categoriascontaminantes_id_seq;

CREATE SEQUENCE data.categoriascontaminantes_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.categoriascontaminantes

-- DROP TABLE data.categoriascontaminantes;

CREATE TABLE data.categoriascontaminantes
(
  id integer NOT NULL DEFAULT nextval('categoriascontaminantes_id_seq'::regclass),

  valor INT,
  idContaminante INT REFERENCES data.contaminantes,
  idRangoContaminantesCategorias INT,
  descRangoContaminantesCategorias VARCHAR(10),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT categoriascontaminantes_pkey PRIMARY KEY (id),
  CONSTRAINT categoriascontaminantes_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.categoriascontaminantes

-- DROP TRIGGER send_change_event ON data.categoriascontaminantes;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.categoriascontaminantes
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id","nomcamara"]}');