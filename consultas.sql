#---------------------------------- CONSULTAR PENSUM ----------------------------------
#DROP PROCEDURE cPensum;
#PROCEDIMINETO PARA CONSULTAR EL PÉNSUM DE UNA CARRERA
	DELIMITER $$
    CREATE PROCEDURE cPensum(
		IN codigo INT
    )
    pensum: BEGIN   
		IF(not buscarIdCarrera(codigo)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO LA CARRERA CON EL ID: ', codigo) AS ERROR;
            LEAVE pensum;
        END IF;
           
		select c.codigo , c.nombre ,  (case when c.obligatorio = 1 then 'Si'  when c.obligatorio = 0 then 'No' end) as 'obligatorio', c.creditosN AS 'Créditos Necesarios'	
		from curso c where c.carrera = codigo OR c.carrera = 0;
    
    END $$

#---------------------------------- CONSULTAR ESTUDIANTE ----------------------------------
#DROP PROCEDURE cEstudiante;
#PROCEDIMINETO PARA CONSULTAR LOS DATOS DEL ESTUDIANTE
	DELIMITER $$
    CREATE PROCEDURE cEstudiante(
		IN carnet_in INT
    )
    estudiante: BEGIN   
		IF(not buscarCarnet(carnet_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO AL ESTUDIANTE CON EL CARNÉT: ', carnet_in) AS ERROR;
            LEAVE estudiante;
        END IF;
           select e.carnet, CONCAT(e.nombres, ' ', apellidos) AS 'nombre completo', e.fechaNacimiento, e.correo, e.telefono, e.direccion, e.dpi, e.carrera, e.creditos as 'creditos que posee' 
           from estudiante e where e.carnet = carnet_in;
    
    END $$
    
#---------------------------------- CONSULTAR DOCENTE ----------------------------------
#DROP PROCEDURE cDocente;
#PROCEDIMINETO PARA CONSULTAR LOS DATOS DEL DOCENTE
	DELIMITER $$
    CREATE PROCEDURE cDocente(
		IN siif_in INT
    )
    docente: BEGIN   
		IF(not buscarSiif(siif_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO AL DOCENTE CON EL SIIF: ', siif_in) AS ERROR;
            LEAVE docente;
        END IF;
           select e.siif, CONCAT(e.nombres, ' ', apellidos) AS 'nombre completo', e.fechaNacimiento, e.correo, e.telefono, e.direccion, e.dpi  
           from docente e where e.siif = siif_in;
    
    END $$

#---------------------------------- CONSULTAR ESTUDIANTES ASIGNADOS ----------------------------------
#DROP PROCEDURE cEstudiantesAsignados;
#PROCEDIMINETO PARA CONSULTAR LOS DATOS DEL DOCENTE
	DELIMITER $$
    CREATE PROCEDURE cEstudiantesAsignados(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN anio VARCHAR(4),
        IN seccion CHAR(1)
    )
    estudiantesA: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE estudiantesA;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE estudiantesA;
					END IF;
				END IF;
			END IF; 
        END IF;
                                
        SELECT e.carnet, concat(e.nombres, ' ', e.apellidos) as 'nombre completo', e.creditos 
		FROM curso_estudiante ce, estudiante e where ce.codigo = codigo_in AND ce.ciclo = ciclo_in AND ce.añoActual = anio AND ce.seccion = seccion AND ce.carnet = e.carnet and ce.tipo = 1;
         
    END $$
    
    
#---------------------------------- CONSULTAR APROBACIONES ----------------------------------
#DROP PROCEDURE cAprobaciones;
#PROCEDIMINETO PARA CONSULTAR LOS DATOS DEL DOCENTE
	DELIMITER $$
    CREATE PROCEDURE cAprobaciones(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN anio VARCHAR(4),
        IN seccion CHAR(1)
    )
    aprobados: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE aprobados;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE aprobados;
					END IF;
				END IF;
			END IF; 
        END IF;
                     
		SELECT n.codigo, n.carnet, concat(e.nombres, ' ', e.apellidos) AS 'nombre completo', (case when n.nota >= 61 then 'APROBADO'  when n.nota < 61 then 'REPROBADO' end) as 'APROBADO/REPROBADO' 
		from notas n, estudiante e where n.codigo = codigo_in and n.ciclo = ciclo_in and n.añoActual = anio and n.seccion = seccion and n.carnet = e.carnet;
        
    END $$
    
#---------------------------------- CONSULTAR ACTAS ----------------------------------
#DROP PROCEDURE cActas;
#PROCEDIMINETO PARA CONSULTAR LOS DATOS DEL DOCENTE
	DELIMITER $$
    CREATE PROCEDURE cActas(
		IN codigo_in INT
    )
    actas: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE actas;
        END IF;
		
        SELECT h.codigo, h.seccion, 
		(case when h.ciclo = '1S' then 'PRIMER SEMESTRE'  when h.ciclo = '2S' then 'SEGUNDO SEMESTRE' when h.ciclo = 'VJ' then 'VACACIONES DE JUNIO' when h.ciclo = 'VD' then 'VACACIONES DE DICIEMRE' end) as 'CICLO',
		h.anioActual, h.asignados, a.fechaCreacion 
		FROM habilitados h, acta a where h.codigo = codigo_in and a.habilitado = h.id 
		ORDER BY a.fechaCreacion ASC
		;
        
    END $$
   
#---------------------------------- CONSULTAR TASA DE DESASIGNACIÓN ----------------------------------

#DROP PROCEDURE cTasaDesasignacion;
#PROCEDIMINETO PARA CONSULTAR LOS DATOS DEL DOCENTE
	DELIMITER $$
    CREATE PROCEDURE cTasaDesasignacion(
		IN codigo_in INT,
        IN ciclo_in VARCHAR(2),
        IN anio VARCHAR(4),
        IN seccion CHAR(1)
    )
    tasa: BEGIN     
    
        IF(NOT buscarCurso(codigo_in)) THEN
			SELECT CONCAT('NO SE HA ENCONTRADO EL CURSO CON EL CÓDIGO: ', codigo_in) AS ERROR;
            LEAVE tasa;
        END IF;
        
        IF(NOT validarCiclo1(ciclo_in)) THEN
			IF(NOT validarCiclo2(ciclo_in)) THEN
				IF(NOT validarCiclo3(ciclo_in)) THEN
					IF(NOT validarCiclo4(ciclo_in)) THEN 
						SELECT CONCAT("NO SE RECONOCE EL CICLO '", ciclo_in, "'.") AS ERROR;
						LEAVE tasa;
					END IF;
				END IF;
			END IF; 
        END IF;
        
        SELECT ce.codigo, ce.seccion, 
		(case when ce.ciclo = '1S' then 'PRIMER SEMESTRE'  when ce.ciclo = '2S' then 'SEGUNDO SEMESTRE' when ce.ciclo = 'VJ' then 'VACACIONES DE JUNIO' when ce.ciclo = 'VD' then 'VACACIONES DE DICIEMRE' end) as 'CICLO',
		ce.añoActual, SUM(ce.tipo = 1) as 'asignados', SUM(ce.tipo=0) as 'desasignados', ((SUM(ce.tipo = 0)/SUM(ce.tipo=0 or ce.tipo=1))*100) as 'porcentaje de desasignados'
		FROM curso_estudiante ce, habilitados h where h.codigo = ce.codigo AND h.codigo = codigo_in AND h.ciclo = ciclo_in AND h.anioActual = anio AND h.seccion = seccion;
        
    END $$   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    