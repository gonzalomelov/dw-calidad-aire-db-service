-- View: api.diassemana

-- DROP VIEW api.diassemana;

CREATE OR REPLACE VIEW api.diassemana AS 
 SELECT diassemana.id,

    diassemana.iddiasemana,
    diassemana.nomdiasemana,

    diassemana.private,
    diassemana.owner_id = request.user_id() AS mine
   FROM diassemana;