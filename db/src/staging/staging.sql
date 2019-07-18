-- DROP TABLE staging.mediciones2agrupadas;

-- DELETE FROM staging.mediciones2agrupadas;

CREATE TABLE staging.mediciones2agrupadas
(
  idEstacionDeLaRed INT
, idContaminante INT
, mean REAL
, min REAL
, max REAL
, percentile REAL
, PRIMARY KEY (
    idEstacionDeLaRed
    , idContaminante
  )
)
;CREATE INDEX idx_mediciones2agrupadas_pk ON staging.mediciones2agrupadas(
    idEstacionDeLaRed
    , idContaminante
  )
;CREATE INDEX idx_mediciones2agrupadas_idEstacionDeLaRed ON staging.mediciones2agrupadas(idEstacionDeLaRed)
;CREATE INDEX idx_mediciones2agrupadas_idContaminante ON staging.mediciones2agrupadas(idContaminante)
;