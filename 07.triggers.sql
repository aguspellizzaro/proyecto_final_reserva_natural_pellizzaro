USE reservas_naturales;

-- Tabla de Animales
CREATE TABLE IF NOT EXISTS historico_animales (
    id_historico_animal INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    peso DECIMAL(10, 2), -- Peso del animal en kg
    altura DECIMAL(5, 2), -- Altura del animal en metros
    CONSTRAINT fk_animales_historicos FOREIGN KEY (id_animal) REFERENCES animales(id_animal)
);

-- Tabla de Animales
CREATE TABLE IF NOT EXISTS historico_personas (
    id_historico_persona INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    email VARCHAR(100),
    CONSTRAINT fk_personas_historicos FOREIGN KEY (id_persona) REFERENCES personas(id_persona)
);

DELIMITER //

CREATE TRIGGER after_animales_update
AFTER UPDATE ON animales
FOR EACH ROW
BEGIN
    INSERT INTO historico_animales (id_animal, peso, altura)
    VALUES (OLD.id_animal, OLD.peso, OLD.altura);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_personas_update
AFTER UPDATE ON personas
FOR EACH ROW
BEGIN
    INSERT INTO historico_personas (id_persona, direccion, telefono, email)
    VALUES (OLD.id_persona, OLD.direccion, OLD.telefono, OLD.email);
END //

DELIMITER ;


-- pruebas triggers
UPDATE `reservas_naturales`.`animales`
SET
`peso` = 220,
`altura` = 1.5
WHERE `id_animal` = 1;

UPDATE `reservas_naturales`.`personas`
SET
`direccion` = '78 Mccormick Parkway',
`telefono` = 5113433817,
`email` = 'rmowat3@gmail.net'
WHERE `id_persona` = 1;
