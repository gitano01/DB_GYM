CREATE OR REPLACE FUNCTION insertarPersona(nombre varchar, apellido varchar, email varchar) RETURNS varchar AS $$
        BEGIN
			INSERT INTO Persona(nombre,apellido,correo) values(nombre,apellido,email);
			RETURN 'Inserción correcta';
        END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION modificarPersona(identificador integer,nombre varchar, apellido varchar, correo varchar) RETURNS varchar AS $$
        BEGIN
			UPDATE  persona SET nombre = $2, apellido = $3, correo = $4  WHERE persona.identificador = $1;
        	IF NOT FOUND THEN
				RAISE 'No existen registros, verifique el identificador';
		END IF;	
			RETURN 'Actualizacion correcta';
		END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION buscarPersona(ide integer) RETURNS SETOF persona AS 
$BODY$     
	DECLARE
		reg RECORD;
	BEGIN
		FOR REG IN SELECT * FROM persona WHERE persona.identificador = $1 LOOP RETURN NEXT reg;
		END LOOP;

		IF NOT FOUND THEN
			RAISE 'No existen registros';
		END IF;	

	END	
$BODY$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION mostrarPersonas() RETURNS SETOF persona AS 
$BODY$     
	DECLARE
		reg RECORD;
	BEGIN
		FOR REG IN SELECT * FROM persona LOOP RETURN NEXT reg;
		END LOOP;

		IF NOT FOUND THEN
			RAISE 'No existen registros';
		END IF;	

	END	
$BODY$ LANGUAGE 'plpgsql';


victor 12