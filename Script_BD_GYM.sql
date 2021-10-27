CREATE OR REPLACE FUNCTION insertar_Persona(nombre varchar, apellido varchar, correo varchar) RETURNS void AS $$

        BEGIN

		INSERT INTO Persona(nombres,apellidos,email) values(nombre,apellido,correo);
                
        END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION modificar_Persona(id int,nombre varchar, apellido varchar, correo varchar) RETURNS void AS $$

        BEGIN

		UPDATE  Persona SET Persona.nombres = nombre, Persona.apellidos = apellido, Persona.email = correo  WHERE Persona.id = id;
                
        END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION buscar_Persona(id int) RETURNS varchar AS $$

        BEGIN

		 SELECT * FROM PERSONA WHERE Persona.id = id;

		IF NOT FOUND THEN
			RAISE 'No se encontro informacion de la persona';
		END IF;	
                
        END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION mostrar_Persona() RETURNS varchar AS $$

        BEGIN

		 SELECT * FROM PERSONA;

		IF NOT FOUND THEN
			RAISE 'No existen registros';
		END IF;	
                
        END;
$$ LANGUAGE plpgsql;