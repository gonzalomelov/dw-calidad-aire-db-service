-- View: industrias

-- DROP VIEW industrias;

CREATE OR REPLACE VIEW industrias AS 
 SELECT industrias.id,

    industrias.idindustria,
    industrias.nomindustria,
    industrias.ubicindustria,

    industrias.private,
    industrias.owner_id = request.user_id() AS mine
   FROM data.industrias;