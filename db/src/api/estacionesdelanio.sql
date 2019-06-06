-- View: estacionesdelanio

-- DROP VIEW estacionesdelanio;

CREATE OR REPLACE VIEW estacionesdelanio AS 
 SELECT estacionesdelanio.id,

    estacionesdelanio.idestaciondelanio,
    estacionesdelanio.nomestaciondelanio,

    estacionesdelanio.private,
    estacionesdelanio.owner_id = request.user_id() AS mine
   FROM data.estacionesdelanio;