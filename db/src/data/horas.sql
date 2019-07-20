-- Sequence: data.horas_id_seq

-- DROP SEQUENCE data.horas_id_seq;

CREATE SEQUENCE data.horas_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.horas

-- DROP TABLE data.horas;

CREATE TABLE data.horas
(
  id integer NOT NULL DEFAULT nextval('horas_id_seq'::regclass),

  idhora int,
  hora varchar(2),
  idrangohoras int,
  descrangohoras varchar(10),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT horas_pkey PRIMARY KEY (id),
  CONSTRAINT horas_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.horas

-- DROP TRIGGER send_change_event ON data.horas;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.horas
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id"]}');