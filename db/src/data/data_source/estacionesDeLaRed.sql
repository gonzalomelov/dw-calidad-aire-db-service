-- ##########################
-- data.estacionesDeLaRed
-- ##########################

-- ##########################
-- estaciones.csv -> barrios ine
-- Prado -> Prado, Nueva Savona
-- Maroñas -> Maroñas, Parque Guaraní
-- Colón -> Colón Centro y Noroeste
-- Goes -> Villa Muñoz, Retiro, Goes
-- ##########################

INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Ciudad Vieja 2', ST_GeomFromText('POINT (572452 6137044)', 32721), 'Ciudad Vieja 2', 'E1', 1, 'Ciudad Vieja', 1, 'CCZ1', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Ciudad Vieja 3', ST_GeomFromText('POINT (572796 6137122)', 32721), 'Ciudad Vieja 3', 'E1', 1, 'Ciudad Vieja', 1, 'CCZ1', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Ciudad Vieja 1', ST_GeomFromText('POINT (572832 6136774)', 32721), 'Ciudad Vieja 1', 'E1', 1, 'Ciudad Vieja', 1, 'CCZ1', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Centro', ST_GeomFromText('POINT (574385 6137072)', 32721), 'Centro', 'E2', 2, 'Centro', 2, 'CCZ2', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('La Teja 1', ST_GeomFromText('POINT (569843 6141519)', 32721), 'La Teja 1', 'E3', 38, 'La Teja', 14, 'CCZ14', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('La Teja 2', ST_GeomFromText('POINT (570883 6142541)', 32721), 'La Teja 2', 'E3', 38, 'La Teja', 14, 'CCZ14', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Prado', ST_GeomFromText('POINT (573289 6142937)', 32721), 'Prado', 'E4', 39, 'Prado, Nueva Savona', 15, 'CCZ15', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Tres Cruces 2', ST_GeomFromText('POINT (576214 6138373)', 32721), 'Tres Cruces 2', 'E5', 50, 'Tres Cruces', 4, 'CCZ4', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Tres Cruces', ST_GeomFromText('POINT (576888 6138953)', 32721), 'Tres Cruces', 'E5', 50, 'Tres Cruces', 4, 'CCZ4', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Curva de Maronas', ST_GeomFromText('POINT (579230 6142255)', 32721), 'Curva de Maronas', 'E6', 17, 'Maroñas, Parque Guaraní', 9, 'CCZ9', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Portones de Carrasco 2', ST_GeomFromText('POINT (583737 6139486)', 32721), 'Portones de Carrasco 2', 'E7', 14, 'Carrasco', 8, 'CCZ8', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Portones de Carrasco', ST_GeomFromText('POINT (583940 6139695)', 32721), 'Portones de Carrasco', 'E7', 14, 'Carrasco', 8, 'CCZ8', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Colon 1', ST_GeomFromText('POINT (570970 6149046)', 32721), 'Colon 1', 'E8', 59, 'Colón Centro y Noroeste', 12, 'CCZ12', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('Goes', ST_GeomFromText('POINT (574668 6139720)', 32721), 'Goes', 'E9', 48, 'Villa Muñoz, Retiro, Goes', 3, 'CCZ3', false, 1);
INSERT INTO data.estacionesDeLaRed(nomEstacionDeLaRed, ubicEstacionDeLaRed, descEstacionDeLaRed, idEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, private, owner_id) VALUES ('ANCAP La Teja', ST_GeomFromText('POINT (571121 6141282)',32721), 'ANCAP La Teja', NULL, 38, 'La Teja', 14, 'CCZ14', false, 1);