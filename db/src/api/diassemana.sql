-- View: diassemana

-- DROP VIEW diassemana;

CREATE OR REPLACE VIEW diassemana AS 
 SELECT diassemana.id,

    diassemana.iddiasemana,
    diassemana.nomdiasemana,

    diassemana.private,
    diassemana.owner_id = request.user_id() AS mine
   FROM data.diassemana;