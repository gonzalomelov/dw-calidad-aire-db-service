-- Sequence: data.contaminantescategorias_id_seq

-- DROP SEQUENCE data.contaminantescategorias_id_seq;

CREATE SEQUENCE data.contaminantescategorias_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.contaminantescategorias

-- DROP TABLE data.contaminantescategorias;

CREATE TABLE data.contaminantescategorias
(
  id integer NOT NULL DEFAULT nextval('contaminantescategorias_id_seq'::regclass),

  valor INT,
  idContaminante INT,
  idRangoContaminantesCategorias INT,
  descRangoContaminantesCategorias VARCHAR(10),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT contaminantescategorias_pkey PRIMARY KEY (id),
  CONSTRAINT contaminantescategorias_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT contaminantescategorias_contaminantes_fkey FOREIGN KEY (idContaminante)
      REFERENCES data."contaminantes" (idcontaminante) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.contaminantescategorias

-- DROP TRIGGER send_change_event ON data.contaminantescategorias;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.contaminantescategorias
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');