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
create table asignatura
(
    id_asignatura int auto_increment
        primary key,
    nombre        varchar(255) not null
);

create table roles
(
    id_rol   int auto_increment
        primary key,
    rol_desc varchar(255) null
);

create table persona
(
    id_persona    int auto_increment
        primary key,
    nombre        varchar(50) not null,
    apellido1     varchar(50) not null,
    apellido2     varchar(50) null,
    email         varchar(50) not null,
    password      varchar(255) not null,
    usuario_teams varchar(50) null,
    rol           int         not null,
    constraint persona_roles_id_rol_fk
        foreign key (rol) references roles (id_rol)
);

create table alumno
(
    id_persona int         not null
        primary key,
    curso      varchar(50) not null,
    constraint alumno_ibfk_1
        foreign key (id_persona) references persona (id_persona)
);

create table chat
(
    id_chat     int auto_increment
        primary key,
    id_emisor   int      not null,
    id_receptor int      not null,
    mensaje     longtext not null,
    fecha_hora  datetime not null,
    constraint chat_ibfk_1
        foreign key (id_emisor) references persona (id_persona),
    constraint chat_ibfk_2
        foreign key (id_receptor) references persona (id_persona)
);

create index id_emisor
    on chat (id_emisor);

create index id_receptor
    on chat (id_receptor);

create table profesor
(
    id_persona        int          not null
        primary key,
    centro_de_trabajo varchar(255) null,
    constraint profesor_ibfk_1
        foreign key (id_persona) references persona (id_persona)
);

create table calendario_profesor
(
    id_calendario_profesor int auto_increment
        primary key,
    id_profesor            int         not null,
    fecha_hora             datetime    not null,
    estado_cita            varchar(50) not null,
    constraint calendario_profesor_ibfk_1
        foreign key (id_profesor) references profesor (id_persona)
);

create table calendario_clases
(
    id_clase               int auto_increment
        primary key,
    id_calendario_profesor int         not null,
    id_alumno              int         not null,
    id_asignatura          int         not null,
    estado_cita            varchar(50) not null,
    valoracion             int         null,
    constraint calendario_clases_ibfk_1
        foreign key (id_calendario_profesor) references calendario_profesor (id_calendario_profesor),
    constraint calendario_clases_ibfk_2
        foreign key (id_alumno) references alumno (id_persona),
    constraint calendario_clases_ibfk_3
        foreign key (id_asignatura) references asignatura (id_asignatura)
);

create index id_alumno
    on calendario_clases (id_alumno);

create index id_asignatura
    on calendario_clases (id_asignatura);

create index id_calendario_profesor
    on calendario_clases (id_calendario_profesor);

create index id_profesor
    on calendario_profesor (id_profesor);

create table profesor_asignatura
(
    id_profesor_asignatura int auto_increment
        primary key,
    id_profesor            int not null,
    id_asignatura          int not null,
    constraint profesor_asignatura_ibfk_1
        foreign key (id_profesor) references profesor (id_persona),
    constraint profesor_asignatura_ibfk_2
        foreign key (id_asignatura) references asignatura (id_asignatura)
);

create index id_asignatura
    on profesor_asignatura (id_asignatura);

create index id_profesor
    on profesor_asignatura (id_profesor);



/*-------------------------------RELLENAMOS CON DATOS--------------------------------------------*/

insert into personal_tutor_online.persona (id_persona, nombre, apellido1, apellido2, email, password, usuario_teams, rol)
values  (1, 'Juan', 'Lopez', 'Garcia', 'juan@ejemplo.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 3),
        (2, 'Maria', 'Garcia', 'Perez', 'maria@ejemplo.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 3),
        (3, 'Pedro', 'Gomez', 'Garcia', 'pedro@ejemplo.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 3),
        (4, 'Ana', 'Garcia', 'Gomez', 'ana@ejemplo.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 3),
        (5, 'Luis', 'Gomez', 'Garcia', 'luis@ejemplo.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 3),
        (6, 'Carmen', 'Garcia', 'Gomez', 'carmen@ejemplo.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 3),
        (7, 'Carlos', 'Rodriguez', 'Perez', 'carlos@example.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 2),
        (8, 'Laura', 'Fernandez', 'Sanchez', 'laura@example.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 2),
        (9, 'David', 'Perez', 'Rodriguez', 'david@example.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 2),
        (10, 'Sara', 'Gomez', 'Fernandez', 'sara@example.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 2),
        (11, 'Daniel', 'Diaz', 'Martin', 'daniel@example.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 2),
        (12, 'Elena', 'Ruiz', 'Jimenez', 'elena@example.com', '$2y$10$BqE0Dv8cc1xYJxxq1hwjhuOoY.05rBOuxX', null, 2);
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

insert into personal_tutor_online.roles (id_rol, rol_desc)
values  (1, 'admin'),
        (2, 'profesor'),
        (3, 'alumno');
    
/*======================== FIN DEL SCRIPT ======================================*/


"QDHf(Sco4yFzVuPg" /*Para sobremesa*/
"ZZVyXc0JEV!CyoJ0" /*Para portatil*/


UPDATE persona SET password = "$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge";

/*la contraseña despues de hashear es qwe*/