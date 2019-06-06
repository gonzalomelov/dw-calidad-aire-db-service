-- View: camaras

-- DROP VIEW camaras;

CREATE OR REPLACE VIEW camaras AS 
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
   FROM data.camaras;