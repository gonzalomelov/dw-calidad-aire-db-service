-- Sequence: data.diassemana_id_seq

-- DROP SEQUENCE data.diassemana_id_seq;

CREATE SEQUENCE data.diassemana_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 7
  CACHE 1;

-- Table: data.diassemana

-- DROP TABLE data.diassemana;

CREATE TABLE data.diassemana
(
  id integer NOT NULL DEFAULT nextval('diassemana_id_seq'::regclass),

  iddiasemana int,
  nomdiasemana varchar(10),

  private boolean DEFAULT false,
  owner_id integer DEFAULT request.user_id(),
  CONSTRAINT diassemana_pkey PRIMARY KEY (id),
  CONSTRAINT diassemana_owner_id_fkey FOREIGN KEY (owner_id)
      REFERENCES data."user" (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

-- Trigger: send_change_event on data.diassemana

-- DROP TRIGGER send_change_event ON data.diassemana;

CREATE TRIGGER send_change_event
  AFTER INSERT OR UPDATE OR DELETE
  ON data.diassemana
  FOR EACH ROW
  EXECUTE PROCEDURE rabbitmq.on_row_change('{"include":["id","nomdiasemana"]}');