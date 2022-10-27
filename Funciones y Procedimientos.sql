
#--------------------------------------------------------------------- CARRERA ---------------------------------------------------------------------
#DROP TRIGGER ingresarCarrera
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "CARRERA"
	DELIMITER $$
	CREATE TRIGGER ingresarCarrera
	AFTER INSERT ON carrera
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha ingresado una nueva carrera.", "INSERT", "CARRERA");
	END $$
     
#DROP FUNCTION validarLetras;
#FUNCION PARA VALIDAR QUE UN VARCHAR SOLO SON LETRAS
	DELIMITER $$
	CREATE FUNCTION validarLetras (
		cadena VARCHAR(100)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^a-zA-ZáéíóúÁÉÍÓÚ ]')) THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF;
        
        RETURN (valido);
    END $$

#DROP FUNCTION buscarCarrera;
#FUNCION PARA BUSCAR CARRERA
	 DELIMITER $$
	 CREATE FUNCTION buscarCarrera(
		nombre VARCHAR(100)
	 )
	 RETURNS BOOLEAN
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM carrera c WHERE c.nombre = nombre) INTO exist;
        RETURN (exist);
	 END $$
  
#DROP PROCEDURE addCarrera;
#PROCEDIMINETO PARA AGREGAR CARRERAS
	DELIMITER $$
    CREATE PROCEDURE addCarrera(
		IN nombre_in VARCHAR(100)
    )
    add_carrera: BEGIN
    
        /*VALIDAR LETRAS*/
        IF(NOT validarLetras(nombre_in)) THEN
			SELECT 'EL NOMBRE SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_carrera;
        END IF;
        
		/*YA EXISTE*/
        IF(buscarCarrera(nombre_in)) THEN
			SELECT 'LA CARRERA YA EXISTE' AS ERROR;
            LEAVE add_carrera;
		END IF;
        
		INSERT INTO carrera (nombre) values (nombre_in);
        /* MENSAJE */
        SELECT CONCAT("Se ha creado la carrera '", nombre_in, "' exitosamente. :D") AS MENSAJE;
    END $$

#--------------------------------------------------------------------- ESTUDIANTE ---------------------------------------------------------------------
#DROP TRIGGER ingresarEstudiante
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "ESTUDIANTE"
	DELIMITER $$
	CREATE TRIGGER ingresarEstudiante
	AFTER INSERT ON estudiante
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha ingresado un nuevo estudiante.", "INSERT", "ESTUDIANTE");
	END $$

#DROP TRIGGER actualizarEstudiante
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "ESTUDIANTE"
	DELIMITER $$
	CREATE TRIGGER actualizarEstudiante
	AFTER UPDATE ON estudiante
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los datos de un estudiante", "UPDATE", "ESTUDIANTE");
	END $$

#DROP FUNCTION validarCorreo;
#FUNCION PARA VALIDAR LA ESTRUCTURA DE UN CORREO
	DELIMITER $$
	CREATE FUNCTION validarCorreo (
		correo VARCHAR(150)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT correo NOT REGEXP '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$') THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF;
        RETURN (valido);
    END $$

#DROP FUNCTION buscarIdCarrera;
#FUNCION PARA BUSCAR ID CARRERA
	 DELIMITER $$
	 CREATE FUNCTION buscarIdCarrera(
		id INT
	 )
	 RETURNS BOOLEAN
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM carrera c WHERE c.id = id) INTO exist;
        RETURN (exist);
	 END $$

#DROP FUNCTION buscarCarnet;
#FUNCION PARA BUSCAR CARNET
	 DELIMITER $$
	 CREATE FUNCTION buscarCarnet(
		carnet BIGINT
	 )
	 RETURNS BOOLEAN
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM estudiante e WHERE e.carnet = carnet) INTO exist;
        RETURN (exist);
	 END $$


#DROP PROCEDURE addEstudiante;
#PROCEDIMINETO PARA AGREGAR ESTUDIANTES
	DELIMITER $$
    CREATE PROCEDURE addEstudiante(
		IN carnet_in BIGINT,
        IN nombres_in VARCHAR(100),
		IN apellidos_in VARCHAR(100),
        IN fechaNacimiento_in DATE,
        IN correo_in VARCHAR(150),
        IN telefono_in BIGINT,
        IN direccion_in VARCHAR(150),
        IN dpi_in BIGINT,
        IN carrera_in INT
    )
    add_estudiante: BEGIN 
        /*VALIDAR LETRAS*/
        IF(NOT validarLetras(nombres_in)) THEN
			SELECT 'EL NOMBRE SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        IF(NOT validarLetras(apellidos_in)) THEN
			SELECT 'EL APELLIDO SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        IF(NOT validarCorreo(correo_in)) THEN
			SELECT 'EL FORMATO DEL CORREO ELECTRÓNICO NO ES VÁLIDO' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        IF(NOT buscarIdCarrera(carrera_in)) THEN
			SELECT 'NO SE ENCONTRÓ EL ID DE LA CARRERA INGRESADA' AS ERROR;
            LEAVE add_estudiante;
        END IF;
		
		IF(buscarCarnet(carnet_in)) THEN
			SELECT 'YA SE HA UTILIZADO ESTE CARNET PARA UN ESTUDIANTE' AS ERROR;
            LEAVE add_estudiante;
        END IF;
        
        INSERT INTO estudiante (carnet, nombres, apellidos, fechaNacimiento, correo, telefono, direccion, dpi, carrera, fechaCreacion, creditos) 
        VALUES(carnet_in, nombres_in, apellidos_in, fechaNacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, carrera_in, sysdate(), 0);
        
        /* MENSAJE */
        SELECT CONCAT("Se ha ingresado el estudiante '", nombres_in, "' exitosamente. :D") AS MENSAJE;
    END $$

#--------------------------------------------------------------------- DOCENTE ---------------------------------------------------------------------
#DROP TRIGGER ingresarDocente
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "DOCENTE"
	DELIMITER $$
	CREATE TRIGGER ingresarDocente
	AFTER INSERT ON docente
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado un nuevo docente.", "INSERT", "DOCENTE");
	END $$
    
#DROP TRIGGER actualizarDocente
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "DOCENTE"
	DELIMITER $$
	CREATE TRIGGER actualizarDocente
	AFTER UPDATE ON docente
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los datos de un docente", "UPDATE", "DOCENTE");
	END $$

#DROP FUNCTION buscarSiif;
#FUNCION PARA BUSCAR DOCENTE POR SU SIIF
	 DELIMITER $$
	 CREATE FUNCTION buscarSiif(
		siif BIGINT
	 )
	 RETURNS BOOLEAN
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM docente d WHERE d.siif = siif) INTO exist;
        RETURN (exist);
	 END $$

#DROP PROCEDURE addDocente;
#PROCEDIMINETO PARA AGREGAR DOCENTES
	DELIMITER $$
    CREATE PROCEDURE addDocente(
		IN siif_in BIGINT,
        IN nombres_in VARCHAR(100),
		IN apellidos_in VARCHAR(100),
        IN fechaNacimiento_in DATE,
        IN correo_in VARCHAR(150),
        IN telefono_in BIGINT,
        IN direccion_in VARCHAR(150),
        IN dpi_in BIGINT
    )
    add_docente: BEGIN 
        /*VALIDAR LETRAS*/
        IF(NOT validarLetras(nombres_in)) THEN
			SELECT 'EL NOMBRE SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_docente;
        END IF;
        
        IF(NOT validarLetras(apellidos_in)) THEN
			SELECT 'EL APELLIDO SOLO DEBE CONTENER LETRAS Y ESPACIOS' AS ERROR;
            LEAVE add_docente;
        END IF;
        
        IF(NOT validarCorreo(correo_in)) THEN
			SELECT 'EL FORMATO DEL CORREO ELECTRÓNICO NO ES VÁLIDO' AS ERROR;
            LEAVE add_docente;
        END IF;
			
		IF(buscarSiif(siif_in)) THEN
			SELECT 'YA SE HA UTILIZADO ESTE SIIF PARA UN DOCENTE' AS ERROR;
            LEAVE add_docente;
        END IF;
        
        INSERT INTO docente (siif, nombres, apellidos, fechaNacimiento, correo, telefono, direccion, dpi, fechaCreacion) 
        VALUES(siif_in, nombres_in, apellidos_in, fechaNacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, sysdate());
        
        /* MENSAJE */
        SELECT CONCAT("Se ha ingresado el docente '", nombres_in, "' exitosamente. :D") AS MENSAJE;
    END $$

#--------------------------------------------------------------------- CURSO ---------------------------------------------------------------------
#DROP TRIGGER ingresarCurso
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "CURSO"
	DELIMITER $$
	CREATE TRIGGER ingresarCurso
	AFTER INSERT ON curso
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado un nuevo curso.", "INSERT", "CURSO");
	END $$

#DROP TRIGGER actualizarCurso
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "CURSO"
	DELIMITER $$
	CREATE TRIGGER actualizarCurso
	AFTER UPDATE ON curso
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los valores de un curso", "UPDATE", "CURSO");
	END $$

#DROP FUNCTION validarEnteroPositivo;
#FUNCION PARA VALIDAR QUE UN ENTERO SEA POSITIVO
	DELIMITER $$
	CREATE FUNCTION validarEnteroPositivo (
		cadena INT
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^0-9]')) THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF; 
        RETURN (valido);
    END $$

#DROP FUNCTION buscarCurso;
#FUNCION PARA BUSCAR UN CURSO POR CÓDIGO
	 DELIMITER $$
	 CREATE FUNCTION buscarCurso(
		codigo INT
	 )
	 RETURNS BOOLEAN
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM curso c WHERE c.codigo = codigo) INTO exist;
        RETURN (exist);
	 END $$

#DROP PROCEDURE addCurso;
#PROCEDIMINETO PARA AGREGAR CURSOS
	DELIMITER $$
    CREATE PROCEDURE addCurso(
		IN codigo_in INT,
        IN nombre_in VARCHAR(100),
        IN necesarios_in INT,
        IN otorga_in INT,
        IN carrera_in INT,
        IN obligatorio_in BIT
    )
    add_curso: BEGIN 
        /*VALIDAR LETRAS*/
        
        
        IF(NOT validarEnteroPositivo(necesarios_in)) THEN
			SELECT 'LOS CRÉDITOS NECESARIOS DEBE SER UN ENTERO POSITIVO' AS ERROR;
            LEAVE add_curso;
        END IF;
        
        IF(NOT validarEnteroPositivo(otorga_in)) THEN
			SELECT 'LOS CRÉDITOS QUE OTORGA EL CURSO DEBE SER UN ENTERO POSITIVO' AS ERROR;
            LEAVE add_curso;
        END IF;
			
		IF(NOT buscarIdCarrera(carrera_in)) THEN
			SELECT 'NO SE ENCONTRÓ LA CARRERA A LA QUE PERTENECE EL CURSO' AS ERROR;
            LEAVE add_curso;
        END IF;
        
		IF(buscarCurso(codigo_in)) THEN
			SELECT 'EL CÓDIGO PARA EL CURSO YA ESTÁ EN USO' AS ERROR;
            LEAVE add_curso;
        END IF;
        
        INSERT INTO curso (codigo, nombre, creditosN, creditosO, carrera, obligatorio) 
        VALUES(codigo_in, nombre_in, necesarios_in, otorga_in, carrera_in, obligatorio_in);
        
        /* MENSAJE */
        SELECT CONCAT("Se ha ingresado el curso '", nombre_in, "' exitosamente. :D") AS MENSAJE;
    END $$

#--------------------------------------------------------------------- HABILITAR CURSO ---------------------------------------------------------------------
#DROP TRIGGER ingresarCursoHabilitado
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "HABILITADOS"
	DELIMITER $$
	CREATE TRIGGER ingresarCursoHabilitado
	AFTER INSERT ON habilitados
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha habilitado un nuevo curso.", "INSERT", "HABILITADOS");
	END $$

#DROP TRIGGER actualizarCursoHabilitado
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "HABILITADOS"
	DELIMITER $$
	CREATE TRIGGER actualizarCursoHabilitado
	AFTER UPDATE ON habilitados
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se han actualizado los datos de un cruso habilitado", "UPDATE", "HABILITADOS");
	END $$

#DROP FUNCTION validarCiclo1;
#FUNCION PARA VALIDAR QUE EL CICLO SEA DE TIPO 1S
	DELIMITER $$
	CREATE FUNCTION validarCiclo1 (
		cadena VARCHAR(100)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^1S]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END $$

#DROP FUNCTION validarCiclo2;
#FUNCION PARA VALIDAR QUE EL CICLO SEA DE TIPO 2S
	DELIMITER $$
	CREATE FUNCTION validarCiclo2 (
		cadena VARCHAR(100)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^2S]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END $$

DROP FUNCTION validarCiclo3;
#FUNCION PARA VALIDAR QUE EL CICLO SEA DE TIPO VJ
	DELIMITER $$
	CREATE FUNCTION validarCiclo3 (
		cadena VARCHAR(100)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^VJ]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END $$

#DROP FUNCTION validarCiclo4;
#FUNCION PARA VALIDAR QUE EL CICLO SEA DE TIPO VD
	DELIMITER $$
	CREATE FUNCTION validarCiclo4 (
		cadena VARCHAR(100)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^VD]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END $$

#DROP FUNCTION buscarCursoHabilitado;
#FUNCION PARA BUSCAR CURSO HABILITADO
	 DELIMITER $$
	 CREATE FUNCTION buscarCursoHabilitado(
		codigo INT,
        ciclo VARCHAR(2),
        seccion CHAR(1)
	 )
	 RETURNS BOOLEAN
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigo AND h.ciclo = ciclo AND h.seccion = seccion ) INTO exist;
        RETURN (exist);
	 END $$
     
    
#DROP PROCEDURE habilitarCurso;
#PROCEDIMINETO PARA HABILITAR UN CURSO
	DELIMITER $$
    CREATE PROCEDURE habilitarCurso(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN docente_in BIGINT,
        IN cupo_in INT,
        IN seccion_in CHAR(1)
    )
    habilitar_curso: BEGIN  
    
		IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT("NO SE HA CREADO NINGÚN CURSO CON EL CÓDIGO '", codigo_in, "'.") AS ERROR;
            LEAVE habilitar_curso;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE habilitar_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
	
		IF(NOT buscarSiif(docente_in)) THEN
			SELECT CONCAT("NO SE RECONOCE EL DOCENTE CON EL SIIF:'", docente_in, "'.") AS ERROR;
            LEAVE habilitar_curso;
        END IF;
         
        IF(NOT validarEnteroPositivo(cupo_in)) THEN
			SELECT 'EL CUPO DEBE SER UN ENTERO POSITIVO' AS ERROR;
            LEAVE habilitar_curso;
        END IF;
        
        IF(buscarCursoHabilitado(codigo_in, ciclo_in, seccion_in)) THEN
			SELECT 'EL CURSO YA HA SIDO HABILITADO EN EL MISMO CICLO Y EN LA MISMA SECCIÓN' AS ERROR;
            LEAVE habilitar_curso;
        END IF;
        
         INSERT INTO habilitados (codigo, ciclo, docente, cupo, seccion, anioActual, asignados) VALUES (codigo_in, ciclo_in, docente_in, cupo_in, UPPER(seccion_in), YEAR(NOW()), 0);
         
        /* MENSAJE */
        SELECT CONCAT("Se ha habilitado el curso con el código '", codigo_in, "' exitosamente. :D") AS MENSAJE;
    END $$


#--------------------------------------------------------------------- HORARIO CURSO HABILITADO ---------------------------------------------------------------------
DROP TRIGGER ingresarHorario
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "HORARIO"
	DELIMITER $$
	CREATE TRIGGER ingresarHorario
	AFTER INSERT ON horario
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado un nuevo horario para un curso habilitado.", "INSERT", "HORARIO");
	END $$

DROP TRIGGER actualizarHorario
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "HORARIO"
	DELIMITER $$
	CREATE TRIGGER actualizarHorario
	AFTER UPDATE ON horario
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha actualizado un horario de un curso habilitado", "UPDATE", "HORARIO");
	END $$
    
DROP FUNCTION buscarIdCursoHabilitado;
 #FUNCION PARA BUSCAR SI EXISTE EL CURSO HABILITADO
	 DELIMITER $$
	 CREATE FUNCTION buscarIdCursoHabilitado(
		id INT
	 )
	 RETURNS BOOLEAN
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.id = id) INTO exist;
        RETURN (exist);
	 END $$

DROP FUNCTION validarDia;
#FUNCION PARA VALIDAR QUE EL DÍA ESTÉ ENTRE 1 Y 7
	DELIMITER $$
	CREATE FUNCTION validarDia (
		dia INT
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF(char_length(dia) > 1) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
        END IF;			
        
        IF (SELECT REGEXP_INSTR(dia, '[^[1-7]?]')) THEN
			SELECT FALSE INTO valido;
			RETURN (valido);
		ELSE
			SELECT TRUE INTO valido;
			RETURN (valido);
        END IF;
    END $$

#DROP FUNCTION validarHorario;
#FUNCION PARA VALIDAR QUE NO HAYAN LETRAS EN EL HORARIO
	DELIMITER $$
	CREATE FUNCTION validarHorario (
		cadena VARCHAR(15)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        IF (SELECT REGEXP_INSTR(cadena, '[^0-9 :-]')) THEN
			SELECT FALSE INTO valido;
		ELSE
			SELECT TRUE INTO valido;
        END IF;
        
        RETURN (valido);
    END $$
   
#DROP PROCEDURE horarioCurso;
#PROCEDIMINETO PARA AGREGAR HORARIOS A CURSOS HABILITADOS
	DELIMITER $$
    CREATE PROCEDURE horarioCurso(
		IN habilitado_in INT,
        IN dia_in INT,
        IN horario_in VARCHAR(15)
    )
    horario_curso: BEGIN  
		DECLARE exist BOOLEAN;
		SELECT EXISTS(SELECT 1 FROM horario h WHERE h.habilitado = habilitado_in AND h.dia = dia_in AND h.horario = horario_in ) INTO exist;
    
		IF(exist) THEN
			SELECT CONCAT("EL CURSO Y SECCIÓN YA CUENTA CON UN HORARIO.") AS ERROR;
            LEAVE horario_curso; 
        END IF;
    
		IF(NOT buscarIdCursoHabilitado(habilitado_in)) THEN
			SELECT CONCAT("NO SE ENCONTRÓ EL ID DEL CURSO HABILITADO '", habilitado_in, "'.") AS ERROR;
            LEAVE horario_curso;
        END IF;
              
		IF(NOT validarDia(dia_in)) THEN
			SELECT CONCAT("SOLO SE PERMITEN NÚMEROS DEL 1 AL 7 PARA REPRESENTAR LOS DÍAS DE LA SEMANA, NO SE ACEPTA EL NÚMERO: '", dia_in, "'.") AS ERROR;
            LEAVE horario_curso;
        END IF;
        
		IF(NOT validarHorario(horario_in)) THEN
			SELECT CONCAT("EL FORMATO PARA EL HORARIO: '", horario_in, "' NO ES ACEPTADO.") AS ERROR;
            LEAVE horario_curso;
        END IF;
        
         INSERT INTO horario (habilitado, dia, horario) VALUES (habilitado_in, dia_in, horario_in);
         
        /* MENSAJE */
        SELECT CONCAT("Se ha creado el horario para el curso con el id de habilitación: '", habilitado_in, "' exitosamente. :D") AS MENSAJE;
    END $$


#--------------------------------------------------------------------- ASIGNACIÓN A CURSOS ---------------------------------------------------------------------
#DROP TRIGGER insert_asignacionCurso
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "CURSO_ESTUDIANTE"
	DELIMITER $$
	CREATE TRIGGER insert_asignacionCurso
	AFTER INSERT ON curso_estudiante
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha asignado un estudiante.", "INSERT", "CURSO_ESTUDIANTE");
	END $$

#DROP TRIGGER actualizar_asignacionCurso
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "CURSO_ESTUDIANTE"
	DELIMITER $$
	CREATE TRIGGER actualizar_asignacionCurso
	AFTER UPDATE ON curso_estudiante
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha desasignado un estudiante", "UPDATE", "CURSO_ESTUDIANTE");
	END $$

#DROP FUNCTION validarIdCurso;
#FUNCION PARA BUSCAR CURSO HABILITADO Y RETORNAR EL ID
	 DELIMITER $$
	 CREATE FUNCTION validarIdCurso(
		codigoCurso INT,
        cicloCurso VARCHAR(2),
        seccionCurso CHAR(1)
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigoCurso AND h.ciclo = cicloCurso AND h.seccion = seccionCurso ) INTO exist;
        IF(exist) THEN
			SELECT id FROM habilitados h WHERE h.codigo = codigoCurso AND h.ciclo = cicloCurso AND h.seccion = seccionCurso INTO valorRegresa;
			RETURN (valorRegresa);
        END IF;
			RETURN (-1);       
	 END $$

#DROP FUNCTION yaAsignado;
#FUNCION PARA BUSCAR SI EL ESTUDIANTE YA ESTÁ ASIGNADO AL CURSO
	 DELIMITER $$
	 CREATE FUNCTION yaAsignado(
		codigoCurso INT,
        cicloCurso VARCHAR(2),
        seccionCurso CHAR(1),
        carneCurso BIGINT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN; 
		SELECT EXISTS(SELECT 1 FROM curso_estudiante ce WHERE ce.codigo = codigoCurso AND ce.ciclo = cicloCurso AND ce.carnet = carneCurso AND ce.añoActual = YEAR(NOW()) AND ce.tipo = 1) INTO exist;
 		RETURN (exist);       
	 END $$

#DROP FUNCTION creditosNecesarios;
#FUNCION PARA BUSCAR Y RETORNAR LOS CRÉDITOS NECESARIOS DE UN CURSO
	 DELIMITER $$
	 CREATE FUNCTION creditosNecesarios(
		codigoCurso INT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigoCurso ) INTO exist;
        IF(exist) THEN
			SELECT creditosN FROM curso c WHERE c.codigo = codigoCurso INTO valorRegresa;
			RETURN (valorRegresa);
        END IF;
			RETURN (-1);       
	 END $$
     
#DROP FUNCTION creditosActuales;
#FUNCION PARA BUSCAR LOS CRÉDITOS QUE TIENE UN ESTUDIANTE
	 DELIMITER $$
	 CREATE FUNCTION creditosActuales(
		carnet BIGINT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN 
		DECLARE valorRegresa INT;
		SELECT creditos FROM estudiante e WHERE e.carnet = carnet INTO valorRegresa;
		RETURN (valorRegresa);  
	 
     END $$   
     
#DROP FUNCTION carreraEstudiante;
#FUNCION PARA BUSCAR Y RETORNAR LA CARRERA DEL ESTUDIANTE
	 DELIMITER $$
	 CREATE FUNCTION carreraEstudiante(
		carnet BIGINT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN 
		DECLARE valorRegresa INT;
		SELECT carrera FROM estudiante e WHERE e.carnet = carnet INTO valorRegresa;
		RETURN (valorRegresa);   
     END $$   
     
#DROP FUNCTION carreraCurso;
#FUNCION PARA BUSCAR Y RETORNAR LA CARRERA DEL CURSO
	 DELIMITER $$
	 CREATE FUNCTION carreraCurso(
		codigo BIGINT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN 
		DECLARE valorRegresa INT;
		SELECT carrera FROM curso c WHERE c.codigo = codigo INTO valorRegresa;
		RETURN (valorRegresa);   
     END $$   
     
#DROP FUNCTION aumentarAsignados;
#FUNCION PARA AUMENTAR EL NÚMERO DE ASIGNADOS DEL CURSO
	 DELIMITER $$
	 CREATE FUNCTION aumentarAsignados(
		id INT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN 
		DECLARE valorRegresa INT;
		SELECT asignados FROM habilitados h WHERE h.id = id INTO valorRegresa;
		RETURN (valorRegresa+1);   
     END $$
     
#DROP FUNCTION cupoAsignados;
#FUNCION PARA RETORNAR EL VALOR DEL CUPO DE ESTUDIANTES DE UN CURSO
	 DELIMITER $$
	 CREATE FUNCTION cupoAsignados(
		id INT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN 
		DECLARE valorRegresa INT;
		SELECT cupo FROM habilitados h WHERE h.id = id INTO valorRegresa;
		RETURN (valorRegresa);   
     END $$

#DROP PROCEDURE asignacionEstudiante;
#PROCEDIMINETO PARA ASIGNAR ESTUDIANTES
	DELIMITER $$
    CREATE PROCEDURE asignacionEstudiante(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1),
        IN carnet_in BIGINT
    )
    asignacion_curso: BEGIN  
		DECLARE valido INT; 
        DECLARE creditosN INT;
        DECLARE creditosA INT;
		DECLARE carreraE INT;
        DECLARE carreraC INT;
        DECLARE aumento INT;
        DECLARE cupo INT;
        
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;
		SELECT creditosNecesarios(codigo_in) INTO creditosN;
		SELECT creditosActuales(carnet_in) INTO creditosA;
		SELECT carreraCurso(codigo_in) INTO carreraC;
		SELECT carreraEstudiante(carnet_in) INTO carreraE;
        SELECT aumentarAsignados(valido) INTO aumento;
        SELECT cupoAsignados(valido) INTO cupo;
        
        
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE asignacion_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
                
        IF(NOT(carreraC = 0))THEN
			IF(NOT(carreraC = carreraE))THEN 
				SELECT CONCAT("EL ESTUDIANTE NO PUEDE ASIGNARSE A CURSOS QUE NO SON DE SU CARRERA O DE ÁREA COMÚN.") AS ERROR;
				LEAVE asignacion_curso; 
			END IF;
        END IF;
          
		IF(valido = -1) THEN
			SELECT CONCAT("EL CURSO CON EL CÓDIGO: '", codigo_in, "', PARA EL CICLO '",UPPER(ciclo_in),"' Y SECCION '",UPPER(seccion_in),"', NO HA SIDO HABILITADO.") AS ERROR;
            LEAVE asignacion_curso;
        END IF; 
        
        IF(aumento > cupo) THEN
			SELECT CONCAT("EL CURSO HA LLEGADO A SU CUPO :(.") AS ERROR;
			LEAVE asignacion_curso;  
        END IF;
        
		IF(yaAsignado(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' YA ESTÁ ASIGNADO A ESTE CURSO.") AS ERROR;
            LEAVE asignacion_curso;
        END IF;
        
        IF(creditosN = -1) THEN
			SELECT CONCAT("NO SE ENCONTRÓ EL CURSO CON EL CÓDIGO: '", codigo_in, "'.") AS ERROR;
            LEAVE asignacion_curso;
        END IF; 
        
        IF(creditosN > creditosA)THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' NO CUENTA CON LOS CRÉDITOS NECESARIOS PARA ASIGNARSE A ESTE CURSO.") AS ERROR;
            LEAVE asignacion_curso; 
        END IF;      
         
        UPDATE habilitados SET asignados = aumento WHERE habilitados.id = valido;
        INSERT INTO curso_estudiante (codigo, carnet, ciclo, seccion, añoActual, tipo) VALUES (codigo_in, carnet_in, UPPER(ciclo_in), UPPER(seccion_in), YEAR(NOW()), 1);
        
        /* MENSAJE */
        SELECT CONCAT("SE HA ASIGNADO AL CARNET: '", carnet_in, "' AL CURSO '",codigo_in, "' exitosamente. :D") AS MENSAJE;
    END $$

#--------------------------------------------------------------------- DESASIGNACIÓN A CURSOS ---------------------------------------------------------------------

#DROP FUNCTION disminuirAsignados;
#FUNCION PARA DISMINUIR EL NÚMERO DE ASIGNADOS AL CURSO
	 DELIMITER $$
	 CREATE FUNCTION disminuirAsignados(
		id INT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN 
		DECLARE valorRegresa INT;
		SELECT asignados FROM habilitados h WHERE h.id = id INTO valorRegresa;
        
        IF(valorRegresa = 0)THEN
			RETURN (valorRegresa);    
        END IF;
        
		RETURN (valorRegresa-1);   
     END $$

#DROP PROCEDURE desasignacionEstudiante;
#PROCEDIMINETO PARA DESASIGNAR ESTUDIANTES
	DELIMITER $$
    CREATE PROCEDURE desasignacionEstudiante(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1),
        IN carnet_in BIGINT
    )
    desasignacion_curso: BEGIN  
		DECLARE valido INT;   
        DECLARE disminuye INT; 
        
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;   
        SELECT disminuirAsignados(valido) INTO disminuye;   
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE desasignacion_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
        
		IF(NOT yaAsignado(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' AÚN NO ESTÁ ASIGNADO A ESTE CURSO.") AS ERROR;
            LEAVE desasignacion_curso;
        END IF;         
		
		IF(valido = -1) THEN
			SELECT CONCAT("EL CURSO CON EL CÓDIGO: '", codigo_in, "', PARA EL CICLO '",UPPER(ciclo_in),"' Y SECCION '",UPPER(seccion_in),"', NO HA SIDO HABILITADO.") AS ERROR;
            LEAVE desasignacion_curso;
        END IF; 
        
        UPDATE habilitados SET asignados = disminuye  WHERE habilitados.id = valido;
        UPDATE curso_estudiante SET tipo = 0 WHERE curso_estudiante.codigo = codigo_in AND curso_estudiante.carnet = carnet_in AND curso_estudiante.ciclo = ciclo_in AND curso_estudiante.seccion = seccion_in;
        
        /* MENSAJE */
        SELECT CONCAT("SE HA DESASIGNADO AL CARNET: '", carnet_in, "' AL CURSO '",codigo_in, "' exitosamente. :D") AS MENSAJE;
    END $$

#--------------------------------------------------------------------- INGRESO NOTAS ---------------------------------------------------------------------
#DROP TRIGGER insert_notas
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "curso_estudiante"
	DELIMITER $$
	CREATE TRIGGER insert_notas
	AFTER INSERT ON notas
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha ingresado una nota para un estudiante", "INSERT", "NOTAS");
	END $$

#DROP TRIGGER actualizar_notas
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "HORARIO"
	DELIMITER $$
	CREATE TRIGGER actualizar_notas
	AFTER UPDATE ON notas
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha actualizado una nota de un estudiante", "UPDATE", "NOTAS");
	END $$

#DROP FUNCTION validarNumeroPositivo;
#FUNCION PARA VALIDAR Y RETORNAR EL VALOR REDONDEADO DE UNA NOTA
	DELIMITER $$
	CREATE FUNCTION validarNumeroPositivo (
		cadena DOUBLE
    )
    RETURNS INT
    DETERMINISTIC
    BEGIN 
		DECLARE valido BOOLEAN; 
        DECLARE regresa INT; 
        IF (SELECT REGEXP_INSTR(cadena, '[^0-9. ]')) THEN
			RETURN (-1);
		ELSE
			SELECT ROUND(cadena) INTO REGRESA;
			RETURN (REGRESA); 
        END IF; 
        
    END $$

#DROP FUNCTION creditosOtorga;
#FUNCION PARA BUSCAR Y RETORNAR LOS CRÉDITOS QUE OTORGA UN CURSO AL SER APROBADO
	 DELIMITER $$
	 CREATE FUNCTION creditosOtorga(
		codigoCurso INT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigoCurso ) INTO exist;
        IF(exist) THEN
			SELECT creditosO FROM curso c WHERE c.codigo = codigoCurso INTO valorRegresa;
			RETURN (valorRegresa);
        END IF;
			RETURN (-1);       
	 END $$

#DROP FUNCTION notaIngresada;
#FUNCION PARA VALIDAR QUE AÚN NO SE HAYA INGRESADO UNA NOTA PARA EL ESTUDIANTE EN ESE CURSO, CICLO Y SECCIÓN
	 DELIMITER $$
	 CREATE FUNCTION notaIngresada(
		codigoCurso INT,
        ciclo VARCHAR(2),
        seccion CHAR(1),
        carnet BIGINT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM notas n WHERE n.codigo = codigoCurso AND n.ciclo = ciclo AND n.seccion = seccion AND n.carnet = carnet ) INTO exist;
		RETURN (exist); 
	 END $$

#DROP PROCEDURE ingresoNotas;
#PROCEDIMINETO PARA AGREGAR NOTAS
	DELIMITER $$
    CREATE PROCEDURE ingresoNotas(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1),
        IN carnet_in BIGINT,
        IN nota_in DOUBLE
    )
    nota_curso: BEGIN  
		DECLARE valido INT;    
        DECLARE notaR INT;
        DECLARE creditosA INT;
        DECLARE creditosO INT;
        
		SELECT creditosActuales(carnet_in) INTO creditosA;
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;   
		SELECT validarNumeroPositivo(nota_in) INTO notaR;
        SELECT creditosOtorga(codigo_in) INTO creditosO;
        
        IF(notaIngresada(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN 
			SELECT CONCAT("YA SE INGRESÓ LA NOTA PARA EL ESTUDIANTE '", carnet_in, "'.") AS ERROR;
			LEAVE nota_curso; 
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE nota_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
        
		IF(NOT yaAsignado(codigo_in, ciclo_in, seccion_in, carnet_in)) THEN
			SELECT CONCAT("EL ESTUDIANTE: '", carnet_in, "' NO ESTÁ ASIGNADO A ESTE CURSO.") AS ERROR;
            LEAVE nota_curso;
        END IF;         
		
		IF(valido = -1) THEN
			SELECT CONCAT("EL CURSO CON EL CÓDIGO: '", codigo_in, "', PARA EL CICLO '",UPPER(ciclo_in),"' Y SECCION '",UPPER(seccion_in),"', NO HA SIDO HABILITADO.") AS ERROR;
            LEAVE nota_curso;
        END IF;
        
		IF(notaR= -1) THEN
			SELECT CONCAT("EL FORMATO DE LA NOTA '",nota_in,"' NO ES ACEPTADO.") AS ERROR;
            LEAVE nota_curso;
        END IF;
        
        IF(notaR >= 61) THEN
			UPDATE estudiante SET creditos = creditosA+creditosO WHERE estudiante.carnet = carnet_in;
        END IF;
        
        INSERT INTO notas (codigo, carnet, ciclo, seccion, añoActual, nota) VALUES(codigo_in, carnet_in, UPPER(ciclo_in), UPPER(seccion_in), YEAR(NOW()), notaR);
        
        /* MENSAJE */
        SELECT CONCAT("SE HA INGRESADO LA NOTA AL CARNET: '", carnet_in, "' exitosamente. :D ") AS MENSAJE;
    END $$

#--------------------------------------------------------------------- CREACIÓN DE ACTA ---------------------------------------------------------------------
#DROP TRIGGER insert_acta
#TRIGGER PARA INSERTAR DATOS EN LA TABLA "ACTA"
	DELIMITER $$
	CREATE TRIGGER insert_acta
	AFTER INSERT ON acta
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha creado una nueva acta.", "INSERT", "ACTA");
	END $$

#DROP TRIGGER actualizar_acta
#TRIGGER PARA ACTUALIZAR DATOS EN LA TABLA "ACTA"
	DELIMITER $$
	CREATE TRIGGER actualizar_acta
	AFTER UPDATE ON acta
	FOR EACH ROW
	BEGIN
		INSERT INTO transaccion (fecha, descripcion, tipo, tabla) values (sysdate(), "Se ha actualizado un acta", "UPDATE", "ACTA");
	END $$
 

#DROP FUNCTION creditosOtorga;
#FUNCION PARA BUSCAR Y RETORNAR LOS CRÉDITOS QUE OTORGA UN CURSO
	 DELIMITER $$
	 CREATE FUNCTION creditosOtorga(
		codigoCurso INT
	 )
	 RETURNS INT
	 DETERMINISTIC
	 BEGIN
		DECLARE exist BOOLEAN;
		DECLARE valorRegresa INT;
		SELECT EXISTS(SELECT 1 FROM habilitados h WHERE h.codigo = codigoCurso ) INTO exist;
        IF(exist) THEN
			SELECT creditosO FROM curso c WHERE c.codigo = codigoCurso INTO valorRegresa;
			RETURN (valorRegresa);
        END IF;
			RETURN (-1);       
	 END $$
 
#DROP PROCEDURE ingresoActa;
#PROCEDIMINETO PARA AGREGAR UN ACTA
	DELIMITER $$
    CREATE PROCEDURE ingresoActa(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN seccion_in CHAR(1)
    )
    acta_curso: BEGIN  
		DECLARE valido INT;
        DECLARE estudiantesI INT;
        DECLARE notasCreadas INT;
        DECLARE exist BOOLEAN;
        
        SELECT validarIdCurso(codigo_in, ciclo_in, UPPER(seccion_in)) INTO valido;  
		SELECT EXISTS(SELECT 1 FROM acta a WHERE a.habilitado = valido) INTO exist;
        
        IF(exist)THEN 
			SELECT CONCAT("YA SE CREÓ UN ACTA PARA EL CURSO: '",codigo_in,"', EN EL CICLO: '", ciclo_in, "', Y SECCIÓN: '",seccion_in,"'.") AS ERROR;
			LEAVE acta_curso;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE acta_curso;
					END IF;
				END IF;
			END IF; 
        END IF;
        
        SELECT asignados FROM habilitados where habilitados.id = valido INTO estudiantesI;
        SELECT count(*) FROM notas ce where ce.codigo = codigo_in AND ce.ciclo = ciclo_in AND ce.seccion = seccion_in INTO notasCreadas;
        
        if(NOT estudiantesI = notasCreadas) THEN 
			SELECT CONCAT("AÚN NO SE HAN INGRESADO TODAS LAS NOTAS PARA EL CURSO '", codigo_in, "'.") AS ERROR;
			LEAVE acta_curso;
        END IF;
        
        /* MENSAJE */
        INSERT INTO acta (habilitado, fechaCreacion) VALUES(valido, SYSDATE());
        SELECT CONCAT("SE HA CREADO EL ACTA DEL CURSO: '", codigo_in, "' exitosamente. :D ") AS MENSAJE;
    END $$