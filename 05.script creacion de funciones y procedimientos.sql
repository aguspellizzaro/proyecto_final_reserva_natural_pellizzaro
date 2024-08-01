USE `reservas_naturales`;
DROP FUNCTION IF EXISTS `calcular_indice_biodiversidad`;

DELIMITER $$

CREATE FUNCTION `calcular_indice_biodiversidad`(p_id_habitat INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_especies INT DEFAULT 0;
    DECLARE total_animales INT DEFAULT 0;
    DECLARE indice_biodiversidad DECIMAL(5, 2) DEFAULT 0;

    -- Calcular el número total de especies en el hábitat
    SELECT COUNT(DISTINCT a.id_especie) INTO total_especies
    FROM animales a
    JOIN animales_por_habitats ah ON a.id_animal = ah.id_animal
    WHERE ah.id_habitat = p_id_habitat
      AND a.fecha_fallecimiento IS NULL;

    -- Calcular el número total de animales en el hábitat
    SELECT COUNT(a.id_animal) INTO total_animales
    FROM animales a
    JOIN animales_por_habitats ah ON a.id_animal = ah.id_animal
    WHERE ah.id_habitat = p_id_habitat
      AND a.fecha_fallecimiento IS NULL;

    -- Calcular el índice de biodiversidad
    IF total_animales > 0 THEN
        SET indice_biodiversidad = (total_especies / total_animales) * 100;
    ELSE
        SET indice_biodiversidad = 0;
    END IF;

    RETURN indice_biodiversidad;
END$$

DELIMITER ;

USE `reservas_naturales`;
DROP FUNCTION IF EXISTS `recorrido_mayor_duracion_promedio`;

DELIMITER $$

CREATE FUNCTION `recorrido_mayor_duracion_promedio`()
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE recorrido_nombre VARCHAR(100);
    DECLARE max_duracion_promedio DECIMAL(5, 2);

    -- Encontrar el recorrido con la mayor duración promedio
    SELECT r.nombre INTO recorrido_nombre
    FROM recorridos r
    JOIN horarios_recorridos hr ON r.id_recorrido = hr.id_recorrido
    GROUP BY r.id_recorrido, r.nombre
    ORDER BY AVG(TIME_TO_SEC(hr.hora) / 60) DESC
    LIMIT 1;

    RETURN recorrido_nombre;
END$$

DELIMITER ;

USE `reservas_naturales`;
DROP PROCEDURE IF EXISTS `analisis_distribucion_animales_zona_estado_conservacion`;

DELIMITER $$

CREATE PROCEDURE `analisis_distribucion_animales_zona_estado_conservacion`()
BEGIN
    -- Consultar el número total de animales en cada zona y el desglose por estado de conservación
    SELECT
        z.id_zona,
        z.nombre AS nombre_zona,
        COUNT(a.id_animal) AS total_animales,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'En Peligro' THEN 1 ELSE 0 END), 0) AS animales_en_peligro,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'Vulnerable' THEN 1 ELSE 0 END), 0) AS animales_vulnerables,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'Preocupación Menor' THEN 1 ELSE 0 END), 0) AS animales_preocupacion_menor,
        COALESCE(SUM(CASE WHEN e.estado_conservacion = 'No Evaluado' THEN 1 ELSE 0 END), 0) AS animales_no_evaluado
    FROM zonas z
    LEFT JOIN habitats_por_zonas hz ON z.id_zona = hz.id_zona
    LEFT JOIN habitats h ON hz.id_habitat = h.id_habitat
    LEFT JOIN animales_por_habitats ah ON h.id_habitat = ah.id_habitat
    LEFT JOIN animales a ON ah.id_animal = a.id_animal
    LEFT JOIN especies e ON a.id_especie = e.id_especie
    WHERE a.fecha_fallecimiento IS NULL
    GROUP BY z.id_zona, z.nombre;
END$$

DELIMITER ;

USE `reservas_naturales`;
DROP PROCEDURE IF EXISTS `informe_detallado_recorridos_guia_animales`;

DELIMITER $$

CREATE PROCEDURE `informe_detallado_recorridos_guia_animales`(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT
        r.id_recorrido,
        r.nombre AS nombre_recorrido,
        r.duracion_estimada,
        r.descripcion AS descripcion_recorrido,
        CONCAT(p.nombre, ' ', p.apellido) AS nombre_guia,
        g.especialidad AS especialidad_guia,
        COUNT(hr.id_recorrido) AS cantidad_recorridos_guiados,
        -- Detalle de zonas y hábitats
        GROUP_CONCAT(DISTINCT CONCAT(z.nombre, ' (ID: ', z.id_zona, ')') ORDER BY z.nombre SEPARATOR ', ') AS zonas_concatenadas,
        GROUP_CONCAT(DISTINCT CONCAT(h.nombre, ' (ID: ', h.id_habitat, ')') ORDER BY h.nombre SEPARATOR ', ') AS habitats_concatenados,
        -- Detalle de animales con su estado de conservación
        GROUP_CONCAT(DISTINCT CONCAT(
            a.nombre, ' (Estado: ', e.estado_conservacion, ')'
        ) ORDER BY a.nombre SEPARATOR '; ') AS detalles_animales_concatenados
    FROM recorridos r
    JOIN horarios_recorridos hr ON r.id_recorrido = hr.id_recorrido
    JOIN guias g ON hr.id_guia = g.id_guia
    JOIN personas p ON g.id_persona = p.id_persona
    JOIN zonas_por_recorrido zr ON r.id_recorrido = zr.id_recorrido
    JOIN zonas z ON zr.id_zona = z.id_zona
    JOIN habitats_por_zonas hz ON z.id_zona = hz.id_zona
    JOIN habitats h ON hz.id_habitat = h.id_habitat
    LEFT JOIN animales_por_habitats ah ON h.id_habitat = ah.id_habitat
    LEFT JOIN animales a ON ah.id_animal = a.id_animal
    LEFT JOIN especies e ON a.id_especie = e.id_especie
    WHERE hr.dia BETWEEN p_fecha_inicio AND p_fecha_fin
    GROUP BY r.id_recorrido, r.nombre, r.duracion_estimada, r.descripcion, g.id_guia, p.nombre, p.apellido
    ORDER BY r.id_recorrido;

END$$

DELIMITER ;
