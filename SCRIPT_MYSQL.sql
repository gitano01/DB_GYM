DELIMITER $$

	CREATE FUNCTION insertarPersona(nombres VARCHAR(40), apellidos VARCHAR(50), email VARCHAR(50)) RETURNS VARCHAR(50) DETERMINISTIC

        BEGIN
			DECLARE mensaje VARCHAR(50);
			INSERT INTO persona(nombre,apellido,correo) values(nombres,apellidos,email);
            SET mensaje = 'Insercion exitosa';
			RETURN (mensaje);
        END$$
DELIMITER ;


DELIMITER $$
CREATE FUNCTION modificarPersona(in_id int,in_nombre varchar(40), in_apellido varchar(50), in_correo varchar(50)) RETURNS varchar(50) DETERMINISTIC
        BEGIN
			UPDATE  persona SET nombre = in_nombre, apellido = in_apellido, correo = in_correo  WHERE persona.identificador = in_id; 	
			RETURN 'Actualizacion correcta';
		END
$$ 
DELIMITER;

DELIMITER $$
CREATE FUNCTION buscarPersona(id int)

        BEGIN

		 SELECT * FROM PERSONA WHERE persona.id = id;
                
        END$$
DELIMITER ;        

DELIMITER $$
CREATE PROCEDURE mostrarPersonas()

        BEGIN

		 SELECT * FROM persona;
                
        END$$
DELIMITER ;    