-- View: horas

-- DROP VIEW horas;

CREATE OR REPLACE VIEW horas AS 
 SELECT horas.id,

    horas.idhora,
    horas.hora,
    horas.idrangohoras,
    horas.descrangohoras,

    horas.private,
    horas.owner_id = request.user_id() AS mine
   FROM data.horas;