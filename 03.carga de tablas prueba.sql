
-- Borrado de datos de todas las tablas usando TRUNCATE
TRUNCATE TABLE horarios_apertura;
TRUNCATE TABLE horarios_recorridos;
TRUNCATE TABLE zonas_por_recorrido;
TRUNCATE TABLE recorridos;
TRUNCATE TABLE guias;
TRUNCATE TABLE cuidadores_por_habitats;
TRUNCATE TABLE cuidadores;
TRUNCATE TABLE personas;
TRUNCATE TABLE animales_por_habitats;
TRUNCATE TABLE habitats_por_zonas;
TRUNCATE TABLE zonas;
TRUNCATE TABLE habitats;
TRUNCATE TABLE animales;
TRUNCATE TABLE especies;
TRUNCATE TABLE sexos;
TRUNCATE TABLE generos;
TRUNCATE TABLE reserva;
-- Inserción de datos
INSERT INTO reserva (nombre, ubicacion, descripcion, fecha_fundacion, area, horario_apertura, horario_cierre)
VALUES ('Reserva Natural X', 'Ubicación X', 'Descripción de la reserva X', '2023-01-01', 1000.00, '08:00:00', '18:00:00');

INSERT INTO generos (genero)
VALUES ('Macho'), ('Hembra');

INSERT INTO sexos (sexo)
VALUES ('Masculino'), ('Femenino'), ('Otro');

INSERT INTO especies (nombre_comun, nombre_cientifico, descripcion, estado_conservacion)
VALUES 
    ('Tigre', 'Panthera tigris', 'Descripción del tigre', 'En Peligro'),
    ('Elefante', 'Loxodonta africana', 'Descripción del elefante', 'Vulnerable'),
    ('León', 'Panthera leo', 'Descripción del león', 'Vulnerable'),
    ('Cebra', 'Equus quagga', 'Descripción de la cebra', 'Preocupación menor'),
    ('Jirafa', 'Giraffa camelopardalis', 'Descripción de la jirafa', 'Vulnerable'),
    ('Puma', 'Puma concolor', 'Descripción del puma', 'Preocupación menor'),
    ('Jaguar', 'Panthera onca', 'Descripción del jaguar', 'Casi amenazado'),
    ('Gorila', 'Gorilla gorilla', 'Descripción del gorila', 'En Peligro'),
    ('Pavo real', 'Pavo cristatus', 'Descripción del pavo real', 'No evaluado'),
    ('Avestruz', 'Struthio camelus', 'Descripción del avestruz', 'Preocupación menor');

INSERT INTO animales (nombre, fecha_nacimiento, fecha_fallecimiento, peso, altura, id_especie, id_genero)
VALUES 
    ('Tigre1', '2010-05-15', NULL, 200.5, 1.2, 1, 1),
    ('Tigre2', '2012-07-20', NULL, 180.0, 1.1, 1, 2),
    ('Elefante1', '2005-03-10', NULL, 3000.0, 3.0, 2, 1),
    ('León1', '2015-09-25', NULL, 190.0, 1.0, 3, 1),
    ('León2', '2016-02-12', NULL, 180.0, 0.9, 3, 2),
    ('Elefante2', '2010-12-01', NULL, 2800.0, 2.8, 2, 2),
    ('Tigre3', '2011-08-30', NULL, 190.0, 1.0, 1, 1),
    ('Cebra1', '2013-10-20', NULL, 200.0, 1.5, 4, 1),
    ('Cebra2', '2014-01-15', NULL, 190.0, 1.4, 4, 2),
    ('Jirafa1', '2010-07-01', NULL, 1500.0, 5.5, 5, 1),
    ('Jirafa2', '2012-09-05', NULL, 1400.0, 5.3, 5, 2),
    ('Puma1', '2015-04-10', NULL, 70.0, 0.8, 6, 1),
    ('Puma2', '2016-06-20', NULL, 65.0, 0.7, 6, 2),
    ('Jaguar1', '2014-03-15', NULL, 90.0, 0.9, 7, 1),
    ('Jaguar2', '2015-05-25', NULL, 85.0, 0.8, 7, 2),
    ('Gorila1', '2008-12-12', NULL, 180.0, 1.7, 8, 1),
    ('Gorila2', '2010-02-18', NULL, 170.0, 1.6, 8, 2),
    ('PavoReal1', '2019-06-05', NULL, 5.0, 0.4, 9, 1),
    ('PavoReal2', '2020-08-10', NULL, 4.5, 0.4, 9, 2),
    ('Avestruz1', '2017-04-01', NULL, 100.0, 2.0, 10, 1),
    ('Avestruz2', '2018-05-15', NULL, 95.0, 1.9, 10, 2);

INSERT INTO habitats (nombre, descripcion, tipo, superficie)
VALUES 
    ('Habitat Tigres', 'Habitat para tigres', 'Jaula', 100.00),
    ('Habitat Leones', 'Habitat para leones', 'Jaula', 120.00),
    ('Habitat Avestruces', 'Habitat para avestruces', 'Jaula', 80.00),
    ('Habitat Pumas', 'Habitat para pumas', 'Jaula', 90.00),
    ('Habitat Jirafas', 'Habitat para jirafas', 'Jaula', 200.00);

INSERT INTO zonas (nombre, descripcion)
VALUES 
    ('Zona Africana', 'Zona de animales africanos'),
    ('Zona Asiática', 'Zona de animales asiáticos'),
    ('Zona Americana', 'Zona de animales americanos');

INSERT INTO habitats_por_zonas (id_habitat, id_zona)
VALUES 
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 1);

INSERT INTO animales_por_habitats (id_animal, id_habitat, fecha_ingreso)
VALUES 
    (1, 1, '2014-01-01'),
    (2, 1, '2015-03-01'),
    (3, 2, '2016-06-15'),
    (4, 2, '2017-08-01'),
    (5, 3, '2018-10-15'),
    (6, 3, '2019-12-01'),
    (7, 1, '2020-02-15'),
    (8, 1, '2021-04-01'),
    (9, 4, '2014-05-01'),
    (10, 4, '2015-07-01'),
    (11, 5, '2016-08-01'),
    (12, 5, '2017-10-01'),
    (13, 5, '2018-11-01'),
    (14, 5, '2019-12-01'),
    (15, 5, '2020-01-01'),
    (16, 5, '2021-02-01'),
    (17, 5, '2022-03-01'),
    (18, 5, '2023-04-01'),
    (19, 5, '2024-05-01'),
    (20, 5, '2025-06-01');

INSERT INTO personas (nombre, apellido, fecha_nacimiento, direccion, telefono, email, dni, id_sexo)
VALUES 
    ('Juan', 'Pérez', '1980-05-10', 'Calle Principal 123', '123456789', 'juanperez@email.com', '12345678', 1),
    ('María', 'Gómez', '1985-07-15', 'Avenida Central 456', '987654321', 'mariagomez@email.com', '87654321', 2),
    ('Carlos', 'López', '1990-09-20', 'Av. Libertador 789', '456789123', 'carloslopez@email.com', '56789123', 1),
    ('Ana', 'Martínez', '1995-11-25', 'Rue de Rivoli 321', '654321987', 'anamartinez@email.com', '34567891', 2);

INSERT INTO cuidadores (id_persona, fecha_ingreso, especialidad)
VALUES 
    (1, '2010-01-01', 'Felinos'),
    (2, '2012-03-15', 'Grandes herbívoros'),
    (3, '2015-06-01', 'Aves'),
    (4, '2018-09-01', 'Primates');

INSERT INTO cuidadores_por_habitats (id_cuidador, id_habitat)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO guias (id_persona, fecha_ingreso, especialidad)
VALUES 
    (1, '2010-01-01', 'Safari africano'),
    (2, '2012-03-15', 'Jirafas y elefantes'),
    (3, '2015-06-01', 'Aves exóticas'),
    (4, '2018-09-01', 'Primates americanos');

INSERT INTO recorridos (nombre, duracion_estimada, descripcion)
VALUES 
    ('Safari Africano', 120, 'Recorrido en vehículo por la zona africana'),
    ('Paseo por la Sabana', 90, 'Caminata entre jirafas y elefantes'),
    ('Sendero de las Aves', 60, 'Visita guiada por el aviario'),
    ('Exploración de Primates', 75, 'Observación de primates en su hábitat');

INSERT INTO zonas_por_recorrido (id_recorrido, id_zona, orden)
VALUES 
    (1, 1, 1),
    (1, 2, 2),
    (2, 1, 1),
    (2, 2, 2),
    (3, 3, 1),
    (4, 1, 1),
    (4, 3, 2);

INSERT INTO horarios_apertura (dia_semana, horario_apertura, horario_cierre)
VALUES 
    ('Lunes', '08:00:00', '18:00:00'),
    ('Martes', '08:00:00', '18:00:00'),
    ('Miércoles', '08:00:00', '18:00:00'),
    ('Jueves', '08:00:00', '18:00:00'),
    ('Viernes', '08:00:00', '18:00:00'),
    ('Sábado', '08:00:00', '20:00:00'),
    ('Domingo', '08:00:00', '20:00:00');

INSERT INTO horarios_recorridos (id_recorrido, id_guia, dia, hora)
VALUES 
    (1, 1, '2023-01-01', '10:00:00'),
    (1, 1, '2023-01-01', '14:00:00'),
    (1, 2, '2023-01-01', '12:00:00'),
    (1, 2, '2023-01-01', '16:00:00'),
    (2, 3, '2023-01-01', '09:00:00'),
    (2, 3, '2023-01-01', '11:00:00'),
    (2, 4, '2023-01-01', '13:00:00'),
    (2, 4, '2023-01-01', '15:00:00'),
    (3, 1, '2023-01-01', '11:00:00'),
    (3, 1, '2023-01-01', '13:00:00'),
    (3, 2, '2023-01-01', '10:00:00'),
    (3, 2, '2023-01-01', '12:00:00'),
    (4, 3, '2023-01-01', '10:30:00'),
    (4, 3, '2023-01-01', '12:00:00'),
    (4, 4, '2023-01-01', '11:00:00'),
    (4, 4, '2023-01-01', '13:00:00');
