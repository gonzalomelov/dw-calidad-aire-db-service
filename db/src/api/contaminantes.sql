-- View: contaminantes

-- DROP VIEW contaminantes;

CREATE OR REPLACE VIEW contaminantes AS 
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
   FROM data.contaminantes;