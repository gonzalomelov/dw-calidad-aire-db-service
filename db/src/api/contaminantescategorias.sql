-- View: contaminantescategorias

-- DROP VIEW contaminantescategorias;

CREATE OR REPLACE VIEW contaminantescategorias AS 
 SELECT contaminantescategorias.id,

    contaminantescategorias.idContaminante,
    contaminantescategorias.descRangoContaminantesCategorias,

    contaminantescategorias.private,
    contaminantescategorias.owner_id = request.user_id() AS mine
   FROM data.contaminantescategorias;