-- View: api.temperaturaexterna

-- DROP VIEW api.temperaturaexterna;

CREATE OR REPLACE VIEW api.temperaturaexterna AS 
 SELECT temperaturaexterna.id,

    temperaturaexterna.valorenc,
    temperaturaexterna.idrangotemperaturaexterna,
    temperaturaexterna.descrangotemperaturaexterna,

    temperaturaexterna.private,
    temperaturaexterna.owner_id = request.user_id() AS mine
   FROM temperaturaexterna;