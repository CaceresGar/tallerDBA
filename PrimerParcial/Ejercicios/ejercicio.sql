CREATE DATABASE universidadTDB;
use universidadTDB;

DROP TABLE IF EXISTS jugador;
CREATE TABLE campionato
(
idCamp INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL ,
nombre VARCHAR(50)
);

INSERT INTO  campionato( nombre) VALUES ('Unifranzitos 2020');
DROP TABLE IF EXISTS equipo;
CREATE TABLE equipo
(
    idEq INTEGER PRIMARY KEY  AUTO_INCREMENT NOT NULL ,
    nombre VARCHAR(50) NOT NULL ,
    categoria VARCHAR(50) NOT NULL,
    idCamp INTEGER NOT NULL,
    FOREIGN KEY (idCamp) REFERENCES campionato(idCamp)
);
INSERT INTO equipo(nombre, categoria,idCamp) VALUES ('Unifranz','varones',1);
INSERT INTO equipo(nombre, categoria,idCamp) VALUES ('Unifranz','mujeres',1);

DROP TABLE IF EXISTS jugador;
CREATE TABLE jugador
(
 idJug INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL ,
 nombre VARCHAR(50) NOT NULL ,
 apellido VARCHAR(50) NOT NULL ,
 edad INTEGER,
 idEq INTEGER NOT NULL ,
 FOREIGN KEY (idEq) REFERENCES equipo(idEq)
);

INSERT INTO jugador(nombre, apellido, edad, idEq) VALUES ('Juan', 'Perez', 25, 1);
INSERT INTO jugador(nombre, apellido, edad, idEq) VALUES ('Pedro', 'Alvarez', 30, 1);
INSERT INTO jugador(nombre, apellido, edad, idEq) VALUES ('Ana', 'Albarado', 20, 2);
INSERT INTO jugador(nombre, apellido, edad, idEq) VALUES ('Jaquelin', 'Tomas', 35, 2);

SELECT J.nombre,J.edad,E.nombre,C.nombre
FROM  equipo AS E
INNER JOIN jugador AS J on E.idEq=J.idEq
INNER JOIN campionato AS C on E.idCamp = C.idCamp
WHERE E.nombre='Univalle';

CREATE FUNCTION maxEdades() RETURNS INTEGER
BEGIN
   DECLARE maxEdad INTEGER;
   SET maxEdad=0;

   SELECT MAX(J.edad) INTO maxEdad
   FROM jugador AS J ;

   RETURN maxEdad;
END;

SELECT maxEdades() AS maxEdadJ;

CREATE FUNCTION agregarToTabla(nombreTabla TEXT) RETURNS TEXT
BEGIN
   if nombreTabla='jugador'
       THEN
       INSERT INTO jugador(nombre, apellido, edad, idEq) VALUES ('Alba','Albares',29,1);
   end if;
   if nombreTabla='equipo'
       THEN
       INSERT INTO equipo(ideq, nombre, categoria, idcamp) VALUES ('NOT FOUND','Varones',1);
   end if;
END;
SELECT agregarToTabla('equipo');