-- View: diasImportantes

-- DROP VIEW diasImportantes;

CREATE OR REPLACE VIEW diasImportantes AS 
 SELECT diasImportantes.id,

    diasImportantes.iddiaimportante,
    diasImportantes.nomdiaimportante,
    diasImportantes.idtipodiaimportante,
    diasImportantes.nomtipodiaimportante,
    diasImportantes.idfecha,
    diasImportantes.idhora,

    diasImportantes.private,
    diasImportantes.owner_id = request.user_id() AS mine
   FROM data.diasImportantes;