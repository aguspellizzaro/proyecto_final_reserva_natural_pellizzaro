-- Llamada a la función calcular_indice_biodiversidad
SELECT `calcular_indice_biodiversidad`(1) AS indice_biodiversidad;

-- Llamada a la función recorrido_mayor_duracion_promedio
SELECT `recorrido_mayor_duracion_promedio`() AS recorrido_mayor_duracion_promedio;

-- Llamada al procedimiento analisis_distribucion_animales_zona_estado_conservacion
CALL `analisis_distribucion_animales_zona_estado_conservacion`();

-- Llamada al procedimiento informe_detallado_recorridos_guia_animales
CALL `informe_detallado_recorridos_guia_animales`('2023-01-01', '2024-12-31');