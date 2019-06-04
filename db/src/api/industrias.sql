-- View: api.industrias

-- DROP VIEW api.industrias;

CREATE OR REPLACE VIEW api.industrias AS 
 SELECT industrias.id,

    industrias.idindustria,
    industrias.nomindustria,
    industrias.ubicindustria,

    industrias.private,
    industrias.owner_id = request.user_id() AS mine
   FROM industrias;