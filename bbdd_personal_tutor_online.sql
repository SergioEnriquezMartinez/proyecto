DROP TABLE IF EXISTS alumnos;
DROP TABLE IF EXISTS profesores;
DROP TABLE IF EXISTS asignaturas;
DROP TABLE IF EXISTS clases_particulares;
DROP TABLE IF EXISTS chats;
DROP TABLE IF EXISTS valoraciones;

/*======================== CREAMOS TABLAS ======================================*/
CREATE TABLE alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre_alumno VARCHAR(50) NOT NULL,
    apellido1_alumno VARCHAR(50) NOT NULL,
    apellido2_alumno VARCHAR(50) NULL,
    email_alumno VARCHAR(255) NOT NULL,
    password_alumno LONGTEXT NOT NULL,
    microsof_teams_alumno VARCHAR(255) NOT NULL
);

CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_profesor VARCHAR(50) NOT NULL,
    apellido1_profesor VARCHAR(50) NOT NULL,
    apellido2_profesor VARCHAR(50) NULL,
    email_profesor VARCHAR(255) NOT NULL,
    password_profesor LONGTEXT NOT NULL,
    microsof_teams_profesor VARCHAR(255) NOT NULL,
    asignatura INT NOT NULL
);

CREATE TABLE asignaturas (
    id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre_asignatura VARCHAR(50) NOT NULL
);

CREATE TABLE clases_particulares (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_profesor INT NOT NULL,
    fecha_clase DATETIME NOT NULL
);

CREATE TABLE chats (
    id_chat INT AUTO_INCREMENT PRIMARY KEY,
    id_sala_chat VARCHAR(255) NOT NULL,
    message LONGTEXT NOT NULL,
    id_alumno INT NOT NULL,
    id_profesor INT NOT NULL,
    fecha_chat DATETIME NOT NULL
);

CREATE TABLE valoraciones (
    id_voto INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_profesor INT NOT NULL,
    valoracion INT(2) NOT NULL
);

ALTER TABLE profesores ADD FOREIGN KEY (asignatura) REFERENCES asignaturas(id_asignatura);
ALTER TABLE clases_particulares ADD FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno);
ALTER TABLE clases_particulares ADD FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor);
ALTER TABLE chats ADD FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno);
ALTER TABLE chats ADD FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor);
ALTER TABLE valoraciones ADD FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno);
ALTER TABLE valoraciones ADD FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor);