-- View: api.categoriascontaminantes

-- DROP VIEW api.categoriascontaminantes;

CREATE OR REPLACE VIEW api.categoriascontaminantes AS 
 SELECT categoriascontaminantes.id,

    categoriascontaminantes.valor,
    categoriascontaminantes.idContaminante,
    categoriascontaminantes.idRangoContaminantesCategorias,
    categoriascontaminantes.descRangoContaminantesCategorias,

    categoriascontaminantes.private,
    categoriascontaminantes.owner_id = request.user_id() AS mine
   FROM categoriascontaminantes;