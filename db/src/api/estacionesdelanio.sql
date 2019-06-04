-- View: api.estacionesdelanio

-- DROP VIEW api.estacionesdelanio;

CREATE OR REPLACE VIEW api.estacionesdelanio AS 
 SELECT estacionesdelanio.id,

    estacionesdelanio.idestaciondelanio,
    estacionesdelanio.nomestaciondelanio,

    estacionesdelanio.private,
    estacionesdelanio.owner_id = request.user_id() AS mine
   FROM estacionesdelanio;