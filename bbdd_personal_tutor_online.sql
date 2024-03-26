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
    id_persona INT PRIMARY KEY,
    curso VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
}

CREATE TABLE Profesor {
    id_persona INT PRIMARY KEY,
    centro_de_trabajo VARCHAR(255) NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
}

CREATE TABLE Chat {
    id_chat INT PRIMARY KEY AUTO_INCREMENT,
    id_emisor INT NOT NULL,
    id_receptor INT NOT NULL,
    mensaje LONGTEXT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    FOREIGN KEY (id_emisor) REFERENCES Persona(id_persona),
    FOREIGN KEY (id_receptor) REFERENCES Persona(id_persona)
}

CREATE TABLE Asignatura {
    id_asignatura INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
}

CREATE TABLE Profesor_Asignatura {
    id_profesor_asignatura INT PRIMARY KEY AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    id_asignatura INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_persona),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
}

CREATE TABLE Calendario_Profesor {
    id_calendario_profesor INT PRIMARY KEY AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado_cita VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(id_persona)
}

CREATE TABLE Calendario_Clases {
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    id_calendario_profesor INT NOT NULL,
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    estado_cita VARCHAR(50) NOT NULL,
    valoracion INT NULL,
    FOREIGN KEY (id_calendario_profesor) REFERENCES Calendario_Profesor(id_calendario_profesor),
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_persona),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
}