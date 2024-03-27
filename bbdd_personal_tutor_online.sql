CREATE DATABASE IF NOT EXISTS personal_tutor_online;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Alumno;
DROP TABLE IF EXISTS Profesor;
DROP TABLE IF EXISTS Chat;
DROP TABLE IF EXISTS Asignatura;
DROP TABLE IF EXISTS Profesor_Asignatura;
DROP TABLE IF EXISTS Calendario_Profesor;
DROP TABLE IF EXISTS Calendario_Clases;

/*======================== CREAMOS TABLAS ======================================*/
CREATE TABLE Persona (
    id_persona INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    usuario_teams VARCHAR(50) NULL
)

CREATE TABLE Alumno (
    id_persona INT PRIMARY KEY,
    curso VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
)

CREATE TABLE Profesor (
    id_persona INT PRIMARY KEY,
    centro_de_trabajo VARCHAR(255) NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
)

CREATE TABLE Chat (
    id_chat INT PRIMARY KEY AUTO_INCREMENT,
    id_emisor INT NOT NULL,
    id_receptor INT NOT NULL,
    mensaje LONGTEXT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    FOREIGN KEY (id_emisor) REFERENCES Persona(id_persona),
    FOREIGN KEY (id_receptor) REFERENCES Persona(id_persona)
)

CREATE TABLE Asignatura (
    id_asignatura INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
)

CREATE TABLE Profesor_Asignatura (
    id_profesor_asignatura INT PRIMARY KEY AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    id_asignatura INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_persona),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
)

CREATE TABLE Calendario_Profesor (
    id_calendario_profesor INT PRIMARY KEY AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado_cita VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_persona)
)

CREATE TABLE Calendario_Clases (
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    id_calendario_profesor INT NOT NULL,
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    estado_cita VARCHAR(50) NOT NULL,
    valoracion INT NULL,
    FOREIGN KEY (id_calendario_profesor) REFERENCES Calendario_Profesor(id_calendario_profesor),
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_persona),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
)

/*-------------------------------RELLENAMOS CON DATOS--------------------------------------------*/

INSERT INTO Persona (nombre, apellido1, apellido2, email, password) VALUES 
    ("Juan", "Lopez", "Garcia", "juan@ejemplo.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Maria", "Garcia", "Perez", "maria@ejemplo.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Pedro", "Gomez", "Garcia", "pedro@ejemplo.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Ana", "Garcia", "Gomez", "ana@ejemplo.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Luis", "Gomez", "Garcia", "luis@ejemplo.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Carmen", "Garcia", "Gomez", "carmen@ejemplo.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Carlos", "Rodriguez", "Perez", "carlos@example.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Laura", "Fernandez", "Sanchez", "laura@example.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("David", "Perez", "Rodriguez", "david@example.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Sara", "Gomez", "Fernandez", "sara@example.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Daniel", "Diaz", "Martin", "daniel@example.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX"),
    ("Elena", "Ruiz", "Jimenez", "elena@example.com", "$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX");

INSERT INTO Alumno (id_persona, curso) VALUES 
    (1, "1º ESO"),
    (2, "2º ESO"),
    (3, "3º ESO"),
    (4, "4º ESO"),
    (5, "1º Bachillerato"),
    (6, "2º Bachillerato");

INSERT INTO Profesor (id_persona, centro_de_trabajo) VALUES 
    (7, "IES Alonso de Madrigal"),
    (8, "IES Alonso de Madrigal"),
    (9, "IES Alonso de Madrigal"),
    (10, "IES Alonso de Madrigal"),
    (11, "IES Alonso de Madrigal"),
    (12, "IES Alonso de Madrigal");

INSERT INTO Asignatura (nombre) VALUES 
    ("Matemáticas"),
    ("Lengua"),
    ("Inglés"),
    ("Física"),
    ("Química"),
    ("Biología"),
    ("Historia"),
    ("Geografía"),
    ("Filosofía"),
    ("Tecnología"),
    ("Programación"),
    ("Base de Datos"),
    ("Sistemas Informáticos"),
    ("Redes"),
    ("Diseño Web");

INSERT INTO Profesor_Asignatura (id_profesor, id_asignatura) VALUES 
    (7, 1),
    (7, 2),
    (7, 3),
    (7, 4),
    (7, 5),
    (8, 6),
    (8, 7),
    (8, 8),
    (8, 9),
    (8, 10),
    (9, 11),
    (9, 12),
    (9, 13),
    (9, 14),
    (9, 15),
    (10, 1),
    (10, 2),
    (10, 3),
    (10, 4),
    (10, 5),
    (11, 6),
    (11, 7),
    (11, 8),
    (11, 9),
    (11, 10),
    (12, 11),
    (12, 12),
    (12, 13),
    (12, 14),
    (12, 15);

INSERT INTO Calendario_Profesor (id_profesor, fecha_hora, estado_cita) VALUES 
    (7, "2024-05-01 10:00:00", "Pendiente"),
    (7, "2024-05-01 11:00:00", "Pendiente"),
    (7, "2024-05-01 12:00:00", "Pendiente"),
    (7, "2024-05-01 13:00:00", "Pendiente"),
    (7, "2024-05-01 14:00:00", "Pendiente"),
    (8, "2024-05-01 10:00:00", "Pendiente"),
    (8, "2024-05-01 11:00:00", "Pendiente"),
    (8, "2024-05-01 12:00:00", "Pendiente"),
    (8, "2024-05-01 13:00:00", "Pendiente"),
    (8, "2024-05-01 14:00:00", "Pendiente"),
    (9, "2024-05-01 10:00:00", "Pendiente"),
    (9, "2024-05-01 11:00:00", "Pendiente"),
    (9, "2024-05-01 12:00:00", "Pendiente"),
    (9, "2024-05-01 13:00:00", "Pendiente"),
    (9, "2024-05-01 14:00:00", "Pendiente"),
    (10, "2024-05-01 10:00:00", "Pendiente"),
    (10, "2024-05-01 11:00:00", "Pendiente"),
    (10, "2024-05-01 12:00:00", "Pendiente"),
    (10, "2024-05-01 13:00:00", "Pendiente"),
    (10, "2024-05-01 14:00:00", "Pendiente");

INSERT INTO Calendario_Clases (id_calendario_profesor, id_alumno, id_asignatura, estado_cita, valoracion) VALUES 
    (1, 1, 1, "Pendiente", NULL),
    (2, 2, 2, "Pendiente", NULL),
    (3, 3, 3, "Pendiente", NULL),
    (4, 4, 4, "Pendiente", NULL),
    (5, 5, 5, "Pendiente", NULL),
    (6, 6, 6, "Pendiente", NULL),
    (7, 1, 7, "Pendiente", NULL),
    (8, 2, 8, "Pendiente", NULL),
    (9, 3, 9, "Pendiente", NULL),
    (10, 4, 10, "Pendiente", NULL),
    (11, 5, 11, "Pendiente", NULL),
    (12, 6, 12, "Pendiente", NULL),
    (13, 1, 13, "Pendiente", NULL),
    (14, 2, 14, "Pendiente", NULL),
    (15, 3, 15, "Pendiente", NULL),
    (16, 4, 1, "Pendiente", NULL),
    (17, 5, 2, "Pendiente", NULL),
    (18, 6, 3, "Pendiente", NULL),
    (19, 1, 4, "Pendiente", NULL),
    (20, 2, 5, "Pendiente", NULL);
    
/*======================== FIN DEL SCRIPT ======================================*/