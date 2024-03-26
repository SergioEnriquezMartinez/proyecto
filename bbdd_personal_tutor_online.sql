CREATE DATABASE IF NOT EXISTS personal_tutor_online;
DROP TABLE IF EXISTS alumnos;
DROP TABLE IF EXISTS profesores;
DROP TABLE IF EXISTS asignaturas;
DROP TABLE IF EXISTS clases_particulares;
DROP TABLE IF EXISTS chats;
DROP TABLE IF EXISTS valoraciones;

/*======================== CREAMOS TABLAS ======================================*/
CREATE TABLE Persona {
    id_persona INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    usuario_teams VARCHAR(50) NULL
}

CREATE TABLE Alumno {
    
}