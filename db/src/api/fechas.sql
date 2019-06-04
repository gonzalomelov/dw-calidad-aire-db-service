-- View: api.fechas

-- DROP VIEW api.fechas;

CREATE OR REPLACE VIEW api.fechas AS 
 SELECT fechas.id,

    fechas.idfecha,
    fechas.fecha,
    fechas.idmes,
    fechas.mes,
    fechas.trimestre,
    fechas.semestre,
    fechas.anio,

    fechas.private,
    fechas.owner_id = request.user_id() AS mine
   FROM fechas;