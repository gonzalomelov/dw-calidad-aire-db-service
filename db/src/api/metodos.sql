-- View: metodos

-- DROP VIEW metodos;

CREATE OR REPLACE VIEW metodos AS 
 SELECT metodos.id,

    metodos.idmetodo,
    metodos.nommetodo,

    metodos.private,
    metodos.owner_id = request.user_id() AS mine
   FROM data.metodos;