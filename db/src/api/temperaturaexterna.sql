-- View: temperaturaexterna

-- DROP VIEW temperaturaexterna;

CREATE OR REPLACE VIEW temperaturaexterna AS 
 SELECT temperaturaexterna.id,

    temperaturaexterna.valorenc,
    temperaturaexterna.idrangotemperaturaexterna,
    temperaturaexterna.descrangotemperaturaexterna,

    temperaturaexterna.private,
    temperaturaexterna.owner_id = request.user_id() AS mine
   FROM data.temperaturaexterna;