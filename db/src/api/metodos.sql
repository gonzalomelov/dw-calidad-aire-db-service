-- View: api.metodos

-- DROP VIEW api.metodos;

CREATE OR REPLACE VIEW api.metodos AS 
 SELECT metodos.id,

    metodos.idmetodo,
    metodos.nommetodo,

    metodos.private,
    metodos.owner_id = request.user_id() AS mine
   FROM metodos;