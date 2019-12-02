-- DROP TABLE dw.mediciones;
-- DROP TABLE dw.mediciones2;
-- DROP TABLE dw.mediciones3;

-- DROP TABLE dw.diasImportantes;
-- DROP TABLE dw.industrias;
-- DROP TABLE dw.camaras;
-- DROP TABLE dw.contaminantescategorias;
-- DROP TABLE dw.vientoVelocidad;
-- DROP TABLE dw.vientoDireccion;
-- DROP TABLE dw.temperaturaExterna;
-- DROP TABLE dw.humedadRelativa;
-- DROP TABLE dw.radiacionSolarGlobal;
-- DROP TABLE dw.contaminantes;
-- DROP TABLE dw.metodos;
-- DROP TABLE dw.estacionesDeLaRed;
-- DROP TABLE dw.fechas;
-- DROP TABLE dw.diasSemana;
-- DROP TABLE dw.estacionesDelAnio;
-- DROP TABLE dw.horas;

-- DELETE FROM dw.mediciones;
-- DELETE FROM dw.mediciones2;
-- DELETE FROM dw.mediciones3;

-- DELETE FROM dw.diasImportantes;
-- DELETE FROM dw.industrias;
-- DELETE FROM dw.camaras;
-- DELETE FROM dw.contaminantescategorias;
-- DELETE FROM dw.vientoVelocidad;
-- DELETE FROM dw.vientoDireccion;
-- DELETE FROM dw.temperaturaExterna;
-- DELETE FROM dw.humedadRelativa;
-- DELETE FROM dw.radiacionSolarGlobal;
-- DELETE FROM dw.contaminantes;
-- DELETE FROM dw.metodos;
-- DELETE FROM dw.estacionesDeLaRed;
-- DELETE FROM dw.fechas;
-- DELETE FROM dw.diasSemana;
-- DELETE FROM dw.estacionesDelAnio;
-- DELETE FROM dw.horas;

-- Dimensiones

CREATE TABLE dw.horas
(
  idHora INT
, hora VARCHAR(2)
, idRangoHoras INT
, descRangoHoras VARCHAR(10)
, PRIMARY KEY (idHora)
)
;CREATE INDEX idx_horas_idHora ON dw.horas(idHora)
;

CREATE TABLE dw.estacionesDelAnio
(
  idEstacionDelAnio INT
, nomEstacionDelAnio VARCHAR(10)
, PRIMARY KEY (idEstacionDelAnio)
)
;CREATE INDEX idx_estacionesDelAnio_idEstacionDelAnio ON dw.estacionesDelAnio(idEstacionDelAnio)
;

CREATE TABLE dw.diasSemana
(
  idDiaSemana INT
, nomDiaSemana VARCHAR(10)
, PRIMARY KEY (idDiaSemana)
)
;CREATE INDEX idx_diasSemana_idDiaSemana ON dw.diasSemana(idDiaSemana)
;

CREATE TABLE dw.fechas
(
  idFecha INT
, fecha VARCHAR(10)
, idMes INT
, mes VARCHAR(10)
, trimestre INT
, semestre INT
, anio INT
, PRIMARY KEY (idFecha)
)
;CREATE INDEX idx_fechas_idFecha ON dw.fechas(idFecha)
;

CREATE TABLE dw.estacionesDeLaRed
(
  nomEstacionDeLaRed VARCHAR(22)
, ubicEstacionDeLaRed geometry(Geometry,32721)
, descestaciondelared VARCHAR(25)
, idestaciondelared VARCHAR(3)
, nomidestaciondelared VARCHAR(25)
, idBarrio INT
, nomBarrio VARCHAR(25)
, idCCZ INT
, nomCCZ VARCHAR(5)
, PRIMARY KEY (nomestaciondelared)
)
;CREATE INDEX idx_estacionesDeLaRed_nomestaciondelared ON dw.estacionesDeLaRed(nomestaciondelared)
;

CREATE TABLE dw.metodos
(
  idMetodo INT
, nomMetodo VARCHAR(12)
, PRIMARY KEY (idMetodo)
)
;CREATE INDEX idx_metodos_idMetodo ON dw.metodos(idMetodo)
;

CREATE TABLE dw.contaminantes
(
  idContaminante INT
, nomContaminante VARCHAR(4)
, idSubTipo INT
, nomSubTipo VARCHAR(59)
, idTipo INT
, nomTipo VARCHAR(23)
, muybuena REAL
, buena REAL
, aceptable REAL
, inadecuada REAL
, mala REAL
, PRIMARY KEY (idContaminante)
)
;CREATE INDEX idx_contaminantes_idContaminante ON dw.contaminantes(idContaminante)
;

CREATE TABLE dw.contaminantescategorias
(
  surrogatekey SERIAL
, idContaminante INT REFERENCES dw.contaminantes
, descRangoContaminantesCategorias VARCHAR(10)
, PRIMARY KEY (surrogatekey)
)
;CREATE INDEX idx_contaminantescategorias_surrogatekey ON dw.contaminantescategorias(surrogatekey)
;

CREATE TABLE dw.radiacionSolarGlobal
(
  idRangoRadiacionSolarGlobal INT
, descRangoRadiacionSolarGlobal VARCHAR(30)
, min REAL
, max REAL
, PRIMARY KEY (idRangoRadiacionSolarGlobal)
)
;CREATE INDEX idx_radiacionSolarGlobal_idRangoRadiacionSolarGlobal ON dw.radiacionSolarGlobal(idRangoRadiacionSolarGlobal)
;

CREATE TABLE dw.humedadRelativa
(
  idRangoHumedadRelativa INT
, descRangoHumedadRelativa VARCHAR(30)
, min REAL
, max REAL
, PRIMARY KEY (idRangoHumedadRelativa)
)
;CREATE INDEX idx_humedadRelativa_idRangoHumedadRelativa ON dw.humedadRelativa(idRangoHumedadRelativa)
;

CREATE TABLE dw.temperaturaExterna
(
  idRangoTemperaturaExterna INT
, descRangoTemperaturaExterna VARCHAR(30)
, min REAL
, max REAL
, PRIMARY KEY (idRangoTemperaturaExterna)
)
;CREATE INDEX idx_temperaturaExterna_idRangoTemperaturaExterna ON dw.temperaturaExterna(idRangoTemperaturaExterna)
;

CREATE TABLE dw.vientoDireccion
(
  idRangoVientoDireccion INT
, descRangoVientoDireccion VARCHAR(30)
, min REAL
, max REAL
, PRIMARY KEY (idRangoVientoDireccion)
)
;CREATE INDEX idx_vientoDireccion_idRangoVientoDireccion ON dw.vientoDireccion(idRangoVientoDireccion)
;

CREATE TABLE dw.vientoVelocidad
(
  idRangoVientoVelocidad INT
, descRangoVientoVelocidad VARCHAR(30)
, min REAL
, max REAL
, PRIMARY KEY (idRangoVientoVelocidad)
)
;CREATE INDEX idx_vientoVelocidad_idRangoVientoVelocidad ON dw.vientoVelocidad(idRangoVientoVelocidad)
;

CREATE TABLE dw.camaras
(
  idDetector INT
, idCarril INT
, dscAvenida VARCHAR(20)
, dscIntAnterior VARCHAR(20)
, dscIntSiguiente VARCHAR(20)
, dscubicacion VARCHAR(100)
, ubicCamara geometry(Geometry,32721)
, PRIMARY KEY (idDetector)
)
;CREATE INDEX idx_camaras_idDetector ON dw.camaras(idDetector)
;

CREATE TABLE dw.industrias
(
  idIndustria INT
, nomIndustria VARCHAR(20)
, ubicIndustria geometry(Geometry,32721)
, PRIMARY KEY (idIndustria)
)
;CREATE INDEX idx_industrias_idIndustria ON dw.industrias(idIndustria)
;

CREATE TABLE dw.diasImportantes
(
  idDiaImportante INT
, nomDiaImportante VARCHAR(20)
, idTipoDiaImportante INT
, nomTipoDiaImportante VARCHAR(20)
, idFecha INT
, idHora INT
, PRIMARY KEY (idDiaImportante)
)
;CREATE INDEX idx_diasImportantes_idDiaImportante ON dw.diasImportantes(idDiaImportante)
;

-- Medidas

CREATE TABLE dw.mediciones
(
  idHora INT REFERENCES dw.horas
, idEstacionDelAnio INT REFERENCES dw.estacionesDelAnio
, idDiaSemana INT REFERENCES dw.diasSemana
, idFecha INT REFERENCES dw.fechas
, nomestaciondelared VARCHAR(22) REFERENCES dw.estacionesDeLaRed
, idMetodo INT REFERENCES dw.metodos
, idContaminante INT REFERENCES dw.contaminantes
, idRangoRadiacionSolarGlobal INT REFERENCES dw.radiacionSolarGlobal
, idRangoHumedadRelativa INT REFERENCES dw.humedadRelativa
, idRangoTemperaturaExterna INT REFERENCES dw.temperaturaExterna
, idRangoVientoDireccion INT REFERENCES dw.vientoDireccion
, idRangoVientoVelocidad INT REFERENCES dw.vientoVelocidad
, idDetector INT REFERENCES dw.camaras
, contaminacion REAL
, volumenVehiculos INT
, PRIMARY KEY (
    idHora
    , idEstacionDelAnio
    , idDiaSemana
    , idFecha
    , nomestaciondelared
    , idMetodo
    , idContaminante
    , idRangoRadiacionSolarGlobal
    , idRangoHumedadRelativa
    , idRangoTemperaturaExterna
    , idRangoVientoDireccion
    , idRangoVientoVelocidad
    , idDetector
  )
)
;CREATE INDEX idx_mediciones_pk ON dw.mediciones(
    idHora
    , idEstacionDelAnio
    , idDiaSemana
    , idFecha
    , nomestaciondelared
    , idMetodo
    , idContaminante
    , idRangoRadiacionSolarGlobal
    , idRangoHumedadRelativa
    , idRangoTemperaturaExterna
    , idRangoVientoDireccion
    , idRangoVientoVelocidad
    , idDetector
  )
;CREATE INDEX idx_mediciones_idHora ON dw.mediciones(idHora)
;CREATE INDEX idx_mediciones_idEstacionDelAnio ON dw.mediciones(idEstacionDelAnio)
;CREATE INDEX idx_mediciones_idDiaSemana ON dw.mediciones(idDiaSemana)
;CREATE INDEX idx_mediciones_idFecha ON dw.mediciones(idFecha)
;CREATE INDEX idx_mediciones_nomestaciondelared ON dw.mediciones(nomestaciondelared)
;CREATE INDEX idx_mediciones_idMetodo ON dw.mediciones(idMetodo)
;CREATE INDEX idx_mediciones_idContaminante ON dw.mediciones(idContaminante)
;CREATE INDEX idx_mediciones_idRangoRadiacionSolarGlobal ON dw.mediciones(idRangoRadiacionSolarGlobal)
;CREATE INDEX idx_mediciones_idRangoHumedadRelativa ON dw.mediciones(idRangoHumedadRelativa)
;CREATE INDEX idx_mediciones_idRangoTemperaturaExterna ON dw.mediciones(idRangoTemperaturaExterna)
;CREATE INDEX idx_mediciones_idRangoVientoDireccion ON dw.mediciones(idRangoVientoDireccion)
;CREATE INDEX idx_mediciones_idRangoVientoVelocidad ON dw.mediciones(idRangoVientoVelocidad)
;CREATE INDEX idx_mediciones_idDetector ON dw.mediciones(idDetector)
;

CREATE TABLE dw.mediciones2
(
  idHora INT REFERENCES dw.horas
, idEstacionDelAnio INT REFERENCES dw.estacionesDelAnio
, idDiaSemana INT REFERENCES dw.diasSemana
, idFecha INT REFERENCES dw.fechas
, nomestaciondelared VARCHAR(22) REFERENCES dw.estacionesDeLaRed
, idMetodo INT REFERENCES dw.metodos
, idContaminante INT REFERENCES dw.contaminantes
, surrogatekey INT REFERENCES dw.contaminantescategorias
, idRangoRadiacionSolarGlobal INT REFERENCES dw.radiacionSolarGlobal
, idRangoHumedadRelativa INT REFERENCES dw.humedadRelativa
, idRangoTemperaturaExterna INT REFERENCES dw.temperaturaExterna
, idRangoVientoDireccion INT REFERENCES dw.vientoDireccion
, idRangoVientoVelocidad INT REFERENCES dw.vientoVelocidad
, idDiaImportante INT REFERENCES dw.diasImportantes
, contaminacion REAL
, PRIMARY KEY (
    idHora
    , idEstacionDelAnio
    , idDiaSemana
    , idFecha
    , nomestaciondelared
    , idMetodo
    , idContaminante
    , surrogatekey
    , idRangoRadiacionSolarGlobal
    , idRangoHumedadRelativa
    , idRangoTemperaturaExterna
    , idRangoVientoDireccion
    , idRangoVientoVelocidad
    , idDiaImportante
  )
)
;CREATE INDEX idx_mediciones2_pk ON dw.mediciones2(
    idHora
    , idEstacionDelAnio
    , idDiaSemana
    , idFecha
    , nomestaciondelared
    , idMetodo
    , idContaminante
    , surrogatekey
    , idRangoRadiacionSolarGlobal
    , idRangoHumedadRelativa
    , idRangoTemperaturaExterna
    , idRangoVientoDireccion
    , idRangoVientoVelocidad
    , idDiaImportante
  )
;CREATE INDEX idx_mediciones2_idHora ON dw.mediciones2(idHora)
;CREATE INDEX idx_mediciones2_idEstacionDelAnio ON dw.mediciones2(idEstacionDelAnio)
;CREATE INDEX idx_mediciones2_idDiaSemana ON dw.mediciones2(idDiaSemana)
;CREATE INDEX idx_mediciones2_idFecha ON dw.mediciones2(idFecha)
;CREATE INDEX idx_mediciones2_nomestaciondelared ON dw.mediciones2(nomestaciondelared)
;CREATE INDEX idx_mediciones2_idMetodo ON dw.mediciones2(idMetodo)
;CREATE INDEX idx_mediciones2_idContaminante ON dw.mediciones2(idContaminante)
;CREATE INDEX idx_mediciones2_surrogatekey ON dw.mediciones2(surrogatekey)
;CREATE INDEX idx_mediciones2_idRangoRadiacionSolarGlobal ON dw.mediciones2(idRangoRadiacionSolarGlobal)
;CREATE INDEX idx_mediciones2_idRangoHumedadRelativa ON dw.mediciones2(idRangoHumedadRelativa)
;CREATE INDEX idx_mediciones2_idRangoTemperaturaExterna ON dw.mediciones2(idRangoTemperaturaExterna)
;CREATE INDEX idx_mediciones2_idRangoVientoDireccion ON dw.mediciones2(idRangoVientoDireccion)
;CREATE INDEX idx_mediciones2_idRangoVientoVelocidad ON dw.mediciones2(idRangoVientoVelocidad)
;CREATE INDEX idx_mediciones2_idDiaImportante ON dw.mediciones2(idDiaImportante)
;

CREATE TABLE dw.mediciones3
(
  idEstacionDelAnio INT REFERENCES estacionesDelAnio
, idDiaSemana INT REFERENCES diasSemana
, idFecha INT REFERENCES fechas
, nomestaciondelared VARCHAR(22) REFERENCES estacionesDeLaRed
, idMetodo INT REFERENCES metodos
, idContaminante INT REFERENCES contaminantes
, idIndustria INT REFERENCES industrias
, contaminacion REAL
, energiaGenerada REAL
, PRIMARY KEY (
    idEstacionDelAnio
    , idDiaSemana
    , idFecha
    , nomestaciondelared
    , idMetodo
    , idContaminante
    , idIndustria
  )
)
;CREATE INDEX idx_mediciones3_pk ON mediciones3(
    idEstacionDelAnio
    , idDiaSemana
    , idFecha
    , nomestaciondelared
    , idMetodo
    , idContaminante
    , idIndustria
  )
;CREATE INDEX idx_mediciones3_idEstacionDelAnio ON mediciones3(idEstacionDelAnio)
;CREATE INDEX idx_mediciones3_idDiaSemana ON mediciones3(idDiaSemana)
;CREATE INDEX idx_mediciones3_idFecha ON mediciones3(idFecha)
;CREATE INDEX idx_mediciones3_nomestaciondelared ON mediciones3(nomestaciondelared)
;CREATE INDEX idx_mediciones3_idMetodo ON mediciones3(idMetodo)
;CREATE INDEX idx_mediciones3_idContaminante ON mediciones3(idContaminante)
;CREATE INDEX idx_mediciones3_idIndustria ON mediciones3(idIndustria)
;