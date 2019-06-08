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

INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (11, 'Ciudad Vieja 2', 1, 'Ciudad Vieja', 1, 'CCZ1', ST_GeomFromText('POINT (572452 6137044)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (12, 'Ciudad Vieja 3', 1, 'Ciudad Vieja', 1, 'CCZ1', ST_GeomFromText('POINT (572796 6137122)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (13, 'Ciudad Vieja 1', 1, 'Ciudad Vieja', 1, 'CCZ1', ST_GeomFromText('POINT (572832 6136774)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (21, 'Centro', 2, 'Centro', 2, 'CCZ2', ST_GeomFromText('POINT (574385 6137072)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (31, 'La Teja 1', 38, 'La Teja', 14, 'CCZ14', ST_GeomFromText('POINT (569843 6141519)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (32, 'La Teja 2', 38, 'La Teja', 14, 'CCZ14', ST_GeomFromText('POINT (570883 6142541)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (41, 'Prado', 39, 'Prado, Nueva Savona', 15, 'CCZ15', ST_GeomFromText('POINT (573289 6142937)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (51, 'Tres Cruces 2', 50, 'Tres Cruces', 4, 'CCZ4', ST_GeomFromText('POINT (576214 6138373)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (52, 'Tres Cruces', 50, 'Tres Cruces', 4, 'CCZ4', ST_GeomFromText('POINT (576888 6138953)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (61, 'Curva de Maronas', 17, 'Maroñas, Parque Guaraní', 9, 'CCZ9', ST_GeomFromText('POINT (579230 6142255)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (71, 'Portones de Carrasco 2', 14, 'Carrasco', 8, 'CCZ8', ST_GeomFromText('POINT (583737 6139486)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (72, 'Portones de Carrasco', 14, 'Carrasco', 8, 'CCZ8', ST_GeomFromText('POINT (583940 6139695)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (81, 'Colon 1', 59, 'Colón Centro y Noroeste', 12, 'CCZ12', ST_GeomFromText('POINT (570970 6149046)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (91, 'Goes', 48, 'Villa Muñoz, Retiro, Goes', 3, 'CCZ3', ST_GeomFromText('POINT (574668 6139720)', 32721), false, 1);
INSERT INTO data.estacionesDeLaRed(idEstacionDeLaRed, nomEstacionDeLaRed, idbarrio, nombarrio, idCCZ, nomCCZ, ubicEstacionDeLaRed, private, owner_id) VALUES (101, 'ANCAP La Teja', 38, 'La Teja', 14, 'CCZ14', ST_GeomFromText('POINT (571121 6141282)',32721), false, 1);