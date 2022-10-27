#--------------------------------------------------------------------- INGRESAR DATOS A LA BD ---------------------------------------------------------------------

/*CARRERAS*/
	#NOMBRE
		SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
		INSERT INTO carrera (id, nombre) values (0, "Área Común"); 
		CALL addCarrera("Ingeniería en Ciencias y Sistemas");
		CALL addCarrera("Ingeniería Civil");
		CALL addCarrera("Ingeniería Mecáncia Industrial");
		CALL addCarrera("Ingeniería Industrial");
		CALL addCarrera("Ingeniería Electrica");
		CALL addCarrera("Ingeniería Mecáncia Eléctrica"); 
	
 
 /*ESTUDIANTES*/
	#CARNÉ NOMBRES APELLIDOS FECHANACIMIENTO CORREO TELEFONO DIRECCION DPI CARRERA
		Call addEstudiante(201807079, "Daniel Estuardo", "Chicas Carías", "1999-12-20", "chicasdaniel53@gmail.com", 42578452, "manzana G, lote 15, residenciales las perlas", 2997589900101,1);
		Call addEstudiante(201807080, "Pedro Pablo", "López López", "2001-09-21", "pedroJuarez@gmail.com", 98124841, "manzana H, lote 16, residenciales las perlas", 2997589900102,2);
		Call addEstudiante(201807081, "Mario", "Morataya", "1998-10-25", "Mario123@gmail.com", 16452785, "manzana I, lote 17, residenciales las perlas", 2997589900103,3);
		Call addEstudiante(201807082, "Luisa Fernanda", "Rodríguez López", "1988-05-12", "luiRod@gmail.com", 37590547, "manzana J, lote 18, residenciales las perlas", 2997589900104,4);
		Call addEstudiante(201807083, "Grecia Marlem", "Gonzáles Pérez", "1997-2-15", "grecia97@gmail.com", 24689756, "manzana K, lote 19, residenciales las perlas", 2997589900105,5);
		Call addEstudiante(201807084, "Jose Miguel", "Pérez López", "1985-10-01", "josePerez85@gmail.com", 34561234, "manzana L, lote 20, residenciales las perlas", 2997589900106,6);
		Call addEstudiante(201807085, "Eva María", "Orellana Cabrera", "1998-09-21", "evaMaria98@gmail.com", 73457243, "manzana M, lote 21, residenciales las perlas", 2997589900107,1);
		Call addEstudiante(201807086, "Milton Javier", "Martínez Sánchez", "1999-05-05", "miltonMS@gmail.com", 23409789, "manzana N, lote 22, residenciales las perlas", 2997589900108,2);
		Call addEstudiante(201807087, "Paula María", "Hernández López", "2000-12-22", "paulitaHernandez@gmail.com", 57683463, "manzana O, lote 23, residenciales las perlas", 2997589900109,3);
		Call addEstudiante(201807088, "Fernando José", "Gonzáles Gonzáles", "2001-03-21", "GonzalesFernando01@gmail.com", 63684246, "manzana P, lote 24, residenciales las perlas", 2997589900110,4);
		Call addEstudiante(201807089, "Ana Hercilia", "Sánchez Pérez", "1995-04-02", "anita95sp@gmail.com", 12536745, "manzana Q, lote 25, residenciales las perlas", 2997589900111,5);
 
/*DOCENTES*/
	#SIIF NOMBRES APELLIDOS FECHANACIMIENTO CORREO TELEFONO DIRECCION DPI
		CALL addDocente(102934681, "Luis", "Espino", "1999-12-20", "espinoLuis@gmail.com", 12345678, "zona 10, Guatemala, Guatemala", 2997589900112);
		CALL addDocente(918450124, "Armando", "Barrera", "1988-1-29", "barreraG0@gmail.com", 87654321, "zona 2, Guatemala, Guatemala", 2997589900113);
		CALL addDocente(818123045, "Eni", "Rivas", "1984-5-12", "eniCariasRivas@gmail.com", 85937637, "zona 3, Guatemala, Guatemala", 2997589900114);
		CALL addDocente(718239405, "Miguel", "Pérez", "1989-6-5", "MiguelitoProfe@gmail.com", 91234765, "zona 9, Guatemala, Guatemala", 2997589900115);
		CALL addDocente(112340123, "Diego", "Araujo", "1990-8-1", "DiegoF@gmail.com", 91764023, "zona 11, Guatemala, Guatemala", 2997589900116);
 
 /*CURSO*/
	#CODIGO NOMBRE CREDITOSN CREDITOSO CARRERA OBLIGATORIO
		/*0 -> ÁREA COMÚN*/
			CALL addCurso(101, "Matemática Básica 1", 0, 7, 0, 1);
			CALL addCurso(147, "Física Básica", 0, 5, 0, 1);
			CALL addCurso(103, "Matemática Básica 2", 0, 7, 0, 1);
			CALL addCurso(69, "Técnica Complementaria 1", 0, 3, 0, 1);
			CALL addCurso(39, "Deportes 1", 0, 1, 0, 0);
			CALL addCurso(40, "Deportes 2", 1, 1, 0, 0);
			CALL addCurso(17, "Social Humanística 1", 0, 4, 0, 1);

		/*1 -> SISTEMAS*/
			CALL addCurso(770, "Introduccion a la Programación y Computación 1", 0, 4, 1, 1); 
			CALL addCurso(771, "Introduccion a la Programación y Computación 2", 0, 5, 1, 1); 
			CALL addCurso(796, "Lenguajes Formales y de Programación", 0, 3, 1, 1); 
			CALL addCurso(960, "Mate Cómputo 1", 33, 5, 1, 1); 
			CALL addCurso(962, "Mate Cómputo 2", 38, 5, 1, 1); 

		/*2 -> CIVIL*/
			CALL addCurso(080, "Topografía 1", 0, 6, 2, 1); 
			CALL addCurso(082, "Topografía 2", 0, 6, 2, 1); 
			CALL addCurso(300, "Resistencia de Materiales", 0, 5, 2, 1); 
			CALL addCurso(250, "Mecánica de Fluídos", 0, 6, 2, 1); 
			CALL addCurso(302, "Resistencia de Materiales 2", 0, 5, 2, 1); 

		/*3 -> MECÁNICA INDUSTRIAL*/
			CALL addCurso(660, "Mercadotécnia", 0, 3, 3, 1);
			CALL addCurso(658, "Administración de Personal", 0, 3, 3, 1);
			CALL addCurso(454, "Metalurgia y Metalografía", 0, 6, 3, 1);
			CALL addCurso(656, "Administración de Empresas 1", 30, 5, 3, 1);
			CALL addCurso(390, "Termodinámica 1", 0, 5, 3, 1);

		/*4 -> INDUSTRIAL*/
			CALL addCurso(661, "Mercadotécnia", 0, 3, 4, 1); 
			CALL addCurso(665, "Microeconomía", 0, 3, 4, 1); 
			CALL addCurso(632, "Ingeniería de Plantas", 0, 6, 4, 1); 
			CALL addCurso(520, "Procesos de Manufactura 1", 0, 3, 4, 1); 
			CALL addCurso(601, "Investigación de Operaciones 1", 0, 5, 4, 1);

		/*5 -> ELÉCTRICA*/
			CALL addCurso(210, "Teoría Eletromagnética 1", 0, 6, 5, 1); 
			CALL addCurso(462, "Electricidad y electrónica básica", 0, 5, 5, 1);
			CALL addCurso(204, "Circuítos Eléctricos 1", 0, 6, 5, 1);
			CALL addCurso(206, "Circuítos Eléctricos 2", 0, 6, 5, 1);
			CALL addCurso(232, "Electrónica 1", 0, 6, 5, 1);


		/*6 -> MECÁNICA ELÉCTRICA*/
			CALL addCurso(218, "Líneas de transimisión", 0, 5, 6, 1);
			CALL addCurso(455, "Metalurgia y Metalografía", 0, 6, 6, 1);
			CALL addCurso(521, "Procesos de manufactura 1", 0, 3, 6, 1);
			CALL addCurso(722, "Teoría de sistemas 1", 0, 5, 6, 0);
			CALL addCurso(650, "Contabilidad 1", 30, 3, 6, 0);

/*HABILITAR CURSO*/
	#CODIGOCURSO CICLO DOCENTE CUPO SECCION
		CALL habilitarCurso(650, '1S', 102934681, 150, 'A');
		CALL habilitarCurso(650, '1S', 112340123, 150, 'b');
		CALL habilitarCurso(39, '2S', 818123045, 50, 'a');
		CALL habilitarCurso(40, '2S', 918450124, 50, 'b');
		CALL habilitarCurso(101, '1S', 918450124, 100, 'A');
		CALL habilitarCurso(218, '1S', 112340123, 80, 'A');
		CALL habilitarCurso(770, '1S', 718239405, 90, 'A');
		CALL habilitarCurso(960, '1S', 718239405, 5, 'A');
		CALL habilitarCurso(147, '1S', 818123045, 5, 'A');

/*HORARIOS CURSOS HABILITADOS*/
	#IDHABILITADO DIA HORARIO
		CALL horarioCurso(2, 1, "12:00-13:40");
		CALL horarioCurso(3, 5, "12:00-13:40");
		CALL horarioCurso(4, 4, "12:00-13:40");
		CALL horarioCurso(7, 3, "10:00-13:40");
		CALL horarioCurso(8, 1, "11:00-12:40");
		CALL horarioCurso(9, 1, "11:00-12:40");
 

/*ASIGNACIÓN ESTUDIATNES A CURSOS*/
	#CODIGOCURSO CICLO SECCIÓN CARNET
		CALL asignacionEstudiante(770, '1s', 'a', 201807079);
		CALL asignacionEstudiante(770, '1s', 'a', 201807085);
		CALL asignacionEstudiante(39, '2s', 'a', 201807085);
		CALL asignacionEstudiante(39, '2s', 'a', 201807079);
		
		CALL asignacionEstudiante(147, '1S', 'a', 201807079);
		CALL asignacionEstudiante(147, '1S', 'a', 201807080);
		CALL asignacionEstudiante(147, '1S', 'a', 201807085);
		CALL asignacionEstudiante(147, '1S', 'a', 201807081);
		CALL asignacionEstudiante(147, '1S', 'a', 201807083);

		CALL asignacionEstudiante(147, '1S', 'a', 201807086);
		CALL asignacionEstudiante(147, '1S', 'a', 201807089);


/*DESASIGNACIÓN ESTUDIANTES A CURSOS*/
	#CODIGOCURSO CICLO SECCIÓN CARNET
		CALL desasignacionEstudiante(770, '1s', 'a', 201807085);
		CALL desasignacionEstudiante(770, '1s', 'A', 201807079);
		CALL desasignacionEstudiante(39, '2s', 'a', 201807085); 
        
		CALL desasignacionEstudiante(147, '1S', 'a', 201807080);
		CALL desasignacionEstudiante(147, '1S', 'a', 201807086);
    
    
/*INGRESAR NOTAS ESTUDIANTES*/
	#CODIGOCURSO CICLO SECCIÓN CARNET NOTA 
		CALL ingresoNotas(770, '1s', 'A', 201807079, 61);
		CALL ingresoNotas(770, '1s', 'a', 201807085, 61);
		CALL ingresoNotas(39, '2s', 'a', 201807085, 60.89);
		CALL ingresoNotas(39, '2s', 'a', 201807079, 60.2);
		
		CALL ingresoNotas(147, '1S', 'a', 201807079, 61); 
		CALL ingresoNotas(147, '1S', 'a', 201807085, 55);
		CALL ingresoNotas(147, '1S', 'a', 201807081, 98);
		CALL ingresoNotas(147, '1S', 'a', 201807083, 60.8); 
		CALL ingresoNotas(147, '1S', 'a', 201807089, 20.3);

/*CREAR ACTAS*/
	#CODIGOCURSO CICLO SECCION
		CALL ingresoActa(147, '1S', 'A');
        
#--------------------------------------------------------------------- CONSULTAS ---------------------------------------------------------------------
/* PENSUM */
	CALL cPensum(9);
    
/* ESTUDIANTE */
    CALL cEstudiante(201807085);
    
/* DOCENTE */
    CALL cDocente(918450124);

/* ESTUDIANTES ASIGNADOS */
    CALL cEstudiantesAsignados(147, '1s', 2022, 'A');
     
/* ESTUDIANTES ASIGNADOS */
	CALL cAprobaciones(147, '1s', 2022, 'A');

/* ACTAS */
	CALL cActas(147);

/* TASA DE DESASIGNACIÓN */
	CALL cTasaDesasignacion(147, '1s', 2022, 'A');