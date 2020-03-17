CREATE Database Universidad2020;
use universidad2020;
CREATE TABLE estudiantes
(
  id_est INTEGER AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  edad INTEGER NOT NULL,
  fono INTEGER NOT NULL,
  email VARCHAR(50) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  sexo VARCHAR(20)
);

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Samuel' ,'Gonzales Veliz', 20, 2832115, 'samuel@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Carla' ,'Mavir Uria', 25, 2832116, 'carla@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Roberto' ,'Adubiri Mondar', 30, 2832117, 'robert@gmail.com', 'Av. 6 de Agosto', 'masculino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Ximena' ,'Arias Ballesteros', 21, 2832118, 'ximena@gmail.com', 'Av. 6 de Agosto', 'femenino');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, sexo)
  VALUES ('Saul' ,'Montes Valenzuela', 24, 2832119, 'saul@gmail.com', 'Av. 6 de Agosto', 'masculino');

CREATE TABLE materias
(
  id_mat INTEGER AUTO_INCREMENT PRIMARY KEY  NOT NULL,
  nombre_mat VARCHAR(100),
  cod_mat VARCHAR(100)
);

INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Fisica Basica','ARQ-105');

CREATE TABLE inscripcion
(
  id_ins INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_est INT NOT NULL,
  id_mat INT NOT NULL,
  semestre VARCHAR(20),
  gestion INTEGER,
  FOREIGN KEY (id_est) REFERENCES estudiantes (id_est),
  FOREIGN KEY (id_mat) REFERENCES materias (id_mat)
);

INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (1, 1, '1er Semestre', 2015);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (1, 2, '2do Semestre', 2015);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (2, 4, '1er Semestre', 2016);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (2, 3, '2do Semestre', 2016);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (3, 3, '2do Semestre', 2017);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (3, 1, '3er Semestre', 2017);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (4, 4, '4to Semestre', 2017);
INSERT INTO inscripcion (id_est, id_mat, semestre, gestion) VALUES (5, 5, '5to Semestre', 2017);

SELECT COUNT(es.id_est) AS Cantidad_estudiantes
FROM estudiantes AS es;

SELECT AVG(es.edad) AS PROMEDIo_EDAD
FROM estudiantes AS es;

SELECT COUNT(I.id_ins)
FROM inscripcion as I
INNER JOIN estudiantes e on I.id_est = e.id_est
WHERE I.gestion=2015;

CREATE FUNCTION Min_edad_Estudiates() Returns int
BEGIN
    DECLARE minEdad INTEGER;
    set minEdad=0;
        select MIN(es.edad) INTO minEdad
        from estudiantes AS es;
    RETURN minEdad;

END;

SELECT Min_edad_Estudiates() AS edadMin;

CREATE FUNCTION Promedio_edad_Estudiates() Returns int
BEGIN
    DECLARE promeEdad INTEGER;
    SET promeEdad=0;
        select AVG(es.edad )INTO promeEdad
        from estudiantes AS es;
        RETURN  promeEdad;
END;

SELECT Promedio_edad_Estudiates() AS PromedioEst;

CREATE FUNCTION MAX_edad_Estudiates() Returns int
BEGIN

        DECLARE maxEdad INTEGER;
        SET maxEdad=0;

        select MAX(es.edad) INTO maxEdad
        from estudiantes AS es
        WHERE sexo='masculino';
    RETURN maxEdad;
END;
SELECT MAX_edad_Estudiates() AS MaxEdad;

CREATE FUNCTION Nombre_Estudiates() Returns int
BEGIN

        DECLARE nombre INTEGER;
        SET nombre=0;

        select MAX(es.id_est) INTO nombre
        from estudiantes AS es;

    RETURN nombre;
END;

SELECT E.nombres,E.apellidos
FROM estudiantes AS E
 WHERE Nombre_Estudiates() =  id_est;

CREATE FUNCTION  Cantidad(nombre TEXT,apellido TEXT) RETURNS TEXT
BEGIN
    DECLARE Concatenado TEXT;
    SET Concatenado= CONCAT_WS('',nombre,apellido);

    RETURN Concatenado;
END;

SELECT E.id_est,E.nombres,E.apellidos
FROM estudiantes AS E
WHERE  mod(E.id_est,2)<>0 ;
