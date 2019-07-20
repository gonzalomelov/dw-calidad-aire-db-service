-- Sequence: data.metodos_id_seq

-- DROP SEQUENCE data.metodos_id_seq;

CREATE SEQUENCE data.metodos_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.metodos

-- DROP TABLE data.metodos;

CREATE TABLE data.metodos
(
  id integer NOT NULL DEFAULT nextval('metodos_id_seq'::regclass),

  idmetodo int NOT NULL,
  nommetodo varchar(12),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT metodos_pkey PRIMARY KEY (id),
  CONSTRAINT metodos_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.metodos

-- DROP TRIGGER send_change_event ON data.metodos;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.metodos
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');