CREATE DATABASE IF NOT EXISTS trabajo_final_pellizzaro;
USE trabajo_final_pellizzaro;

CREATE SCHEMA IF NOT EXISTS reservas_naturales;
USE reservas_naturales;

-- Tabla de Reserva
CREATE TABLE IF NOT EXISTS reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_fundacion DATE,
    area DECIMAL(10, 2) -- Área en metros cuadrados
);

-- Tabla de Generos
CREATE TABLE IF NOT EXISTS generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR(10) NOT NULL
);

-- Tabla de Sexos
CREATE TABLE IF NOT EXISTS sexos (
    id_sexo INT AUTO_INCREMENT PRIMARY KEY,
    sexo VARCHAR(10) NOT NULL
);

-- Tabla de Especies de Animales
CREATE TABLE IF NOT EXISTS especies (
    id_especie INT AUTO_INCREMENT PRIMARY KEY,
    nombre_comun VARCHAR(100) NOT NULL,
    nombre_cientifico VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado_conservacion VARCHAR(50)
);

CREATE INDEX idx_especies_nombre_comun ON especies(nombre_comun);
CREATE INDEX idx_especies_nombre_cientifico ON especies(nombre_cientifico);

-- Tabla de Animales
CREATE TABLE IF NOT EXISTS animales (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    fecha_fallecimiento DATE,
    peso DECIMAL(10, 2), -- Peso del animal en kg
    altura DECIMAL(5, 2), -- Altura del animal en metros
    id_especie INT NOT NULL,
    id_genero INT NOT NULL,
    CONSTRAINT fk_animales_especie FOREIGN KEY (id_especie) REFERENCES especies(id_especie),
    CONSTRAINT fk_animales_genero FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);

CREATE INDEX idx_animales_nombre ON animales(nombre);

-- Tabla de Habitats
CREATE TABLE IF NOT EXISTS habitats (
    id_habitat INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(50),
    superficie DECIMAL(10, 2) -- Superficie en metros cuadrados
);

CREATE INDEX idx_habitats_nombre ON habitats(nombre);

-- Tabla de Zonas
CREATE TABLE IF NOT EXISTS zonas (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE INDEX idx_zonas_nombre ON zonas(nombre);

-- Tabla de Habitats por Zonas
CREATE TABLE IF NOT EXISTS habitats_por_zonas (
    id_habitat INT,
    id_zona INT,
    PRIMARY KEY (id_habitat, id_zona),
    CONSTRAINT fk_habitats_por_zonas_habitat FOREIGN KEY (id_habitat) REFERENCES habitats(id_habitat),
    CONSTRAINT fk_habitats_por_zonas_zona FOREIGN KEY (id_zona) REFERENCES zonas(id_zona)
);

-- Tabla de Animales por Habitats
CREATE TABLE IF NOT EXISTS animales_por_habitats (
    id_animal INT,
    id_habitat INT,
    fecha_ingreso DATE,
    PRIMARY KEY (id_animal, id_habitat),
    CONSTRAINT fk_animales_por_habitats_animal FOREIGN KEY (id_animal) REFERENCES animales(id_animal),
    CONSTRAINT fk_animales_por_habitats_habitat FOREIGN KEY (id_habitat) REFERENCES habitats(id_habitat)
);

-- Tabla de Personas
CREATE TABLE IF NOT EXISTS personas (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100),
    dni VARCHAR(20) UNIQUE NOT NULL,
    id_sexo INT NOT NULL,
    CONSTRAINT fk_personas_sexo FOREIGN KEY (id_sexo) REFERENCES sexos(id_sexo)
);

CREATE INDEX idx_personas_dni ON personas(dni);

-- Tabla de Cuidadores
CREATE TABLE IF NOT EXISTS cuidadores (
    id_cuidador INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    fecha_ingreso DATE,
    especialidad VARCHAR(100),
    CONSTRAINT fk_cuidadores_persona FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

-- Tabla de Cuidadores por Habitats
CREATE TABLE IF NOT EXISTS cuidadores_por_habitats (
    id_cuidador INT,
    id_habitat INT,
    PRIMARY KEY (id_cuidador, id_habitat),
    CONSTRAINT fk_cuidadores_por_habitats_cuidador FOREIGN KEY (id_cuidador) REFERENCES cuidadores(id_cuidador),
    CONSTRAINT fk_cuidadores_por_habitats_habitat FOREIGN KEY (id_habitat) REFERENCES habitats(id_habitat)
);

-- Tabla de Guias
CREATE TABLE IF NOT EXISTS guias (
    id_guia INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    fecha_ingreso DATE,
    especialidad VARCHAR(100),
    CONSTRAINT fk_guias_persona FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

-- Tabla de Recorridos
CREATE TABLE IF NOT EXISTS recorridos (
    id_recorrido INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    duracion_estimada INT, -- en minutos
    descripcion TEXT
);

CREATE INDEX idx_recorridos_nombre ON recorridos(nombre);

-- Tabla de Zonas por Recorrido
CREATE TABLE IF NOT EXISTS zonas_por_recorrido (
    id_recorrido INT,
    id_zona INT,
    orden INT,
    PRIMARY KEY (id_recorrido, id_zona),
    CONSTRAINT fk_zonas_por_recorrido_recorrido FOREIGN KEY (id_recorrido) REFERENCES recorridos(id_recorrido),
    CONSTRAINT fk_zonas_por_recorrido_zona FOREIGN KEY (id_zona) REFERENCES zonas(id_zona)
);

-- Tabla de Horarios de Apertura
CREATE TABLE IF NOT EXISTS horarios_apertura (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(20) NOT NULL,
    horario_apertura TIME,
    horario_cierre TIME,
    id_reserva INT NOT NULL,
    CONSTRAINT fk_horarios_apertura_reserva FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
);

CREATE INDEX idx_horarios_apertura_dia_semana ON horarios_apertura(dia_semana);

-- Tabla de Horarios de Recorridos
CREATE TABLE IF NOT EXISTS horarios_recorridos (
    id_recorrido INT,
    id_guia INT,
    dia DATE,
    hora TIME,
    PRIMARY KEY (id_recorrido, id_guia, dia, hora),
    CONSTRAINT fk_horarios_recorridos_recorrido FOREIGN KEY (id_recorrido) REFERENCES recorridos(id_recorrido),
    CONSTRAINT fk_horarios_recorridos_guia FOREIGN KEY (id_guia) REFERENCES guias(id_guia)
);

CREATE INDEX idx_horarios_recorridos_dia_hora ON horarios_recorridos(dia, hora);