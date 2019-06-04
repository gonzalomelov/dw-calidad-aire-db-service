-- View: api.estacionesdelared

-- DROP VIEW api.estacionesdelared;

CREATE OR REPLACE VIEW api.estacionesdelared AS 
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
   FROM estacionesdelared;