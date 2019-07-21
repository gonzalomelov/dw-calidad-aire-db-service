-- View: estacionesdelared

-- DROP VIEW estacionesdelared;

CREATE OR REPLACE VIEW estacionesdelared AS 
 SELECT estacionesdelared.id,

    estacionesdelared.nomestaciondelared,
    estacionesdelared.ubicestaciondelared,
    estacionesdelared.descestaciondelared,
    estacionesdelared.idestaciondelared,
    estacionesdelared.idbarrio,
    estacionesdelared.nombarrio,
    estacionesdelared.idccz,
    estacionesdelared.nomccz,

    estacionesdelared.private,
    estacionesdelared.owner_id = request.user_id() AS mine
   FROM data.estacionesdelared;