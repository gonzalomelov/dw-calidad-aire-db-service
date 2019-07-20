-- Sequence: data.estacionesdelanio_id_seq

-- DROP SEQUENCE data.estacionesdelanio_id_seq;

CREATE SEQUENCE data.estacionesdelanio_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.estacionesdelanio

-- DROP TABLE data.estacionesdelanio;

CREATE TABLE data.estacionesdelanio
(
  id integer NOT NULL DEFAULT nextval('estacionesdelanio_id_seq'::regclass),

  idestaciondelanio int,
  nomestaciondelanio varchar(10),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT estacionesdelanio_pkey PRIMARY KEY (id),
  CONSTRAINT estacionesdelanio_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.estacionesdelanio

-- DROP TRIGGER send_change_event ON data.estacionesdelanio;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.estacionesdelanio
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');