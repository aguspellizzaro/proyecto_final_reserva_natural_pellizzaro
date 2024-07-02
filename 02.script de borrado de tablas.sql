USE reservas_naturales;

-- Deshabilitar las claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar tablas en orden inverso de creación para manejar las dependencias
DROP TABLE IF EXISTS horarios_recorridos;
DROP TABLE IF EXISTS zonas_por_recorrido;
DROP TABLE IF EXISTS recorridos;
DROP TABLE IF EXISTS guias;
DROP TABLE IF EXISTS cuidadores_por_habitats;
DROP TABLE IF EXISTS cuidadores;
DROP TABLE IF EXISTS personas;
DROP TABLE IF EXISTS sexos;
DROP TABLE IF EXISTS animales_por_habitats;
DROP TABLE IF EXISTS habitats_por_zonas;
DROP TABLE IF EXISTS zonas;
DROP TABLE IF EXISTS habitats;
DROP TABLE IF EXISTS animales;
DROP TABLE IF EXISTS especies;
DROP TABLE IF EXISTS generos;
DROP TABLE IF EXISTS reserva;
DROP TABLE IF EXISTS horarios_apertura;

-- Habilitar las claves foráneas nuevamente
SET FOREIGN_KEY_CHECKS = 1;
