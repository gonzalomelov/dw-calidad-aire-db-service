-- View: temperaturaexterna

-- DROP VIEW temperaturaexterna;

CREATE OR REPLACE VIEW temperaturaexterna AS 
 SELECT temperaturaexterna.id,

    temperaturaexterna.idrangotemperaturaexterna,
    temperaturaexterna.descrangotemperaturaexterna,
    temperaturaexterna.min,
    temperaturaexterna.max,

    temperaturaexterna.private,
    temperaturaexterna.owner_id = request.user_id() AS mine
   FROM data.temperaturaexterna;