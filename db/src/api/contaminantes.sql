-- View: api.contaminantes

-- DROP VIEW api.contaminantes;

CREATE OR REPLACE VIEW api.contaminantes AS 
 SELECT contaminantes.id,

    contaminantes.idcontaminante,
    contaminantes.nomcontaminante,
    contaminantes.idsubtipo,
    contaminantes.nomsubtipo,
    contaminantes.idtipo,
    contaminantes.nomtipo,
    contaminantes.muybuena,
    contaminantes.buena,
    contaminantes.aceptable,
    contaminantes.inadecuada,
    contaminantes.mala,

    contaminantes.private,
    contaminantes.owner_id = request.user_id() AS mine
   FROM contaminantes;