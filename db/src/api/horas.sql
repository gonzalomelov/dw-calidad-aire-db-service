-- View: api.horas

-- DROP VIEW api.horas;

CREATE OR REPLACE VIEW api.horas AS 
 SELECT horas.id,

    horas.idhora,
    horas.hora,
    horas.idrangohoras,
    horas.descrangohoras,

    horas.private,
    horas.owner_id = request.user_id() AS mine
   FROM horas;