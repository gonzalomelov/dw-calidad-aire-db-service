-- View: estacionesdelared

-- DROP VIEW estacionesdelared;

CREATE OR REPLACE VIEW estacionesdelared AS 
 SELECT estacionesdelared.id,

    estacionesdelared.idestaciondelared,
    estacionesdelared.nomestaciondelared,
    estacionesdelared.ubicestaciondelared,
    estacionesdelared.idbarrio,
    estacionesdelared.nombarrio,
    estacionesdelared.idccz,
    estacionesdelared.nomccz,

    estacionesdelared.private,
    estacionesdelared.owner_id = request.user_id() AS mine
   FROM data.estacionesdelared;