-- View: api.camaras

-- DROP VIEW api.camaras;

CREATE OR REPLACE VIEW api.camaras AS 
 SELECT camaras.id,

    camaras.iddetector,
    camaras.idcarril,
    camaras.dscavenida,
    camaras.dscintanterior,
    camaras.dscintsiguiente,
    camaras.dscubicacion,
    camaras.ubiccamara,

    camaras.private,
    camaras.owner_id = request.user_id() AS mine
   FROM camaras;