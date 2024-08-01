CREATE OR REPLACE VIEW VT_animales_x_habitats_x_Zonas AS
SELECT
    a.id_animal,
    a.nombre AS "animal",
    e.nombre_comun AS "nombre comun especie",
    e.nombre_cientifico AS  "nombre cientifico especie",
    e.descripcion AS "descripcion especie",
    h.nombre AS "habitat",
    h.descripcion AS "descripcion habitat",
    z.nombre AS "zona"
FROM animales a
INNER JOIN especies e ON a.id_especie = e.id_especie
INNER JOIN animales_por_habitats ah ON a.id_animal = ah.id_animal
INNER JOIN habitats h ON ah.id_habitat = h.id_habitat
INNER JOIN habitats_por_zonas hz ON h.id_habitat = hz.id_habitat
INNER JOIN zonas z ON hz.id_zona = z.id_zona
WHERE a.fecha_fallecimiento IS NULL
ORDER BY z.id_zona;

CREATE OR REPLACE VIEW VT_zonas_animales AS
SELECT
    z.id_zona,
    z.nombre AS "zona",
    z.descripcion AS "descripcion",
    COUNT(a.id_animal) AS "cantidad de animales",
    GROUP_CONCAT(DISTINCT e.nombre_comun ORDER BY e.nombre_comun SEPARATOR ', ') AS "especies en zona"
FROM zonas z
LEFT JOIN habitats_por_zonas hz ON z.id_zona = hz.id_zona
LEFT JOIN habitats h ON hz.id_habitat = h.id_habitat
LEFT JOIN animales_por_habitats ah ON h.id_habitat = ah.id_habitat
LEFT JOIN animales a ON ah.id_animal = a.id_animal
LEFT JOIN especies e ON a.id_especie = e.id_especie
WHERE a.fecha_fallecimiento IS NULL 
GROUP BY z.id_zona, z.nombre, z.descripcion;


CREATE OR REPLACE VIEW vt_personas_guias_recorridos_horarios AS
SELECT
    p.id_persona,
    p.nombre AS nombre_persona,
    p.apellido AS apellido_persona,
    p.fecha_nacimiento,
    g.id_guia,
    g.fecha_ingreso AS fecha_ingreso_guia,
    g.especialidad AS especialidad_guia,
    r.id_recorrido,
    r.nombre AS nombre_recorrido,
    CONCAT(r.duracion_estimada, ' minutos') AS duracion_estimada,
    r.descripcion AS descripcion_recorrido,
    GROUP_CONCAT(DISTINCT CONCAT(hr.dia, ' ', hr.hora) ORDER BY hr.dia, hr.hora SEPARATOR ', ') AS horarios
FROM personas p
JOIN guias g ON p.id_persona = g.id_persona
JOIN horarios_recorridos hr ON hr.id_guia = g.id_guia
JOIN recorridos r ON hr.id_recorrido = r.id_recorrido
WHERE EXISTS (
    SELECT 1
    FROM cuidadores c
    WHERE c.id_persona = p.id_persona
)
GROUP BY p.id_persona, p.nombre, p.apellido, p.fecha_nacimiento, g.id_guia, g.fecha_ingreso, g.especialidad, r.id_recorrido, r.nombre, r.duracion_estimada, r.descripcion;
