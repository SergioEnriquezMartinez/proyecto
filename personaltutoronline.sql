-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: pdb1056.awardspace.net
-- Tiempo de generación: 19-06-2024 a las 22:40:22
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `4494294_personaltutoronline`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_persona` int NOT NULL,
  `curso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_persona`, `curso`) VALUES
(1, '1º ESO'),
(2, '2º ESO'),
(3, '3º ESO'),
(4, '4º ESO'),
(5, '1º Bachillerato'),
(6, '2º Bachillerato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nombre`) VALUES
(1, 'Matemáticas'),
(2, 'Lengua'),
(3, 'Inglés'),
(4, 'Física'),
(5, 'Química'),
(6, 'Biología'),
(7, 'Historia'),
(8, 'Geografía'),
(9, 'Filosofía'),
(10, 'Tecnología'),
(11, 'Programación'),
(12, 'Base de Datos'),
(13, 'Sistemas Informáticos'),
(14, 'Redes'),
(15, 'Diseño Web'),
(16, 'Diseño 3D'),
(17, 'Francés'),
(18, 'Catalán'),
(19, 'Álgebra Avanzada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario_clases`
--

CREATE TABLE `calendario_clases` (
  `id_clase` int NOT NULL,
  `id_calendario_profesor` int NOT NULL,
  `id_alumno` int NOT NULL,
  `id_asignatura` int NOT NULL,
  `estado_cita` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valoracion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calendario_clases`
--

INSERT INTO `calendario_clases` (`id_clase`, `id_calendario_profesor`, `id_alumno`, `id_asignatura`, `estado_cita`, `valoracion`) VALUES
(21, 22, 1, 3, 'Aceptada', 4),
(22, 24, 1, 4, 'Cancelada', NULL),
(23, 23, 1, 2, 'Cancelada', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario_profesor`
--

CREATE TABLE `calendario_profesor` (
  `id_calendario_profesor` int NOT NULL,
  `id_profesor` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `estado_cita` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calendario_profesor`
--

INSERT INTO `calendario_profesor` (`id_calendario_profesor`, `id_profesor`, `fecha_hora`, `estado_cita`) VALUES
(1, 7, '2024-05-01 10:00:00', 'Disponible'),
(2, 7, '2024-05-01 11:00:00', 'Disponible'),
(3, 7, '2024-05-01 12:00:00', 'Disponible'),
(4, 7, '2024-05-01 13:00:00', 'Disponible'),
(5, 7, '2024-05-01 14:00:00', 'Disponible'),
(6, 8, '2024-05-01 10:00:00', 'Disponible'),
(7, 8, '2024-05-01 11:00:00', 'Disponible'),
(8, 8, '2024-05-01 12:00:00', 'Disponible'),
(9, 8, '2024-05-01 13:00:00', 'Disponible'),
(10, 8, '2024-05-01 14:00:00', 'Disponible'),
(11, 9, '2024-05-01 10:00:00', 'Disponible'),
(12, 9, '2024-05-01 11:00:00', 'Disponible'),
(13, 9, '2024-05-01 12:00:00', 'Disponible'),
(14, 9, '2024-05-01 13:00:00', 'Disponible'),
(15, 9, '2024-05-01 14:00:00', 'Disponible'),
(16, 10, '2024-05-01 10:00:00', 'Disponible'),
(17, 10, '2024-05-01 11:00:00', 'Disponible'),
(18, 10, '2024-05-01 12:00:00', 'Disponible'),
(19, 10, '2024-05-01 13:00:00', 'Disponible'),
(20, 10, '2024-05-01 14:00:00', 'Disponible'),
(21, 10, '2024-06-06 10:00:00', 'Disponible'),
(22, 7, '2024-06-10 10:00:00', 'Aceptada'),
(23, 7, '2024-06-18 12:00:00', 'Disponible'),
(24, 7, '2024-06-12 18:00:00', 'Disponible'),
(25, 7, '2024-06-24 14:00:00', 'Disponible'),
(26, 7, '2024-06-20 19:00:00', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `id_chat` int NOT NULL,
  `id_emisor` int NOT NULL,
  `id_receptor` int NOT NULL,
  `mensaje` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellido1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellido2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usuario_teams` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido1`, `apellido2`, `email`, `password`, `usuario_teams`, `rol`) VALUES
(1, 'Juan', 'Lopez', 'Garcia', 'juan@ejemplo.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_1', 3),
(2, 'Maria', 'Garcia', 'Perez', 'maria@ejemplo.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_2', 3),
(3, 'Pedro', 'Gomez', 'Garcia', 'pedro@ejemplo.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_3', 3),
(4, 'Ana', 'Garcia', 'Gomez', 'ana@ejemplo.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_4', 3),
(5, 'Luis', 'Gomez', 'Garcia', 'luis@ejemplo.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_5', 3),
(6, 'Carmen', 'Garcia', 'Gomez', 'carmen@ejemplo.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_6', 3),
(7, 'Carlos', 'Rodriguez', 'Perez', 'carlos@example.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_7', 2),
(8, 'Laura', 'Fernandez', 'Sanchez', 'laura@example.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_8', 2),
(9, 'David', 'Perez', 'Rodriguez', 'david@example.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_9', 2),
(10, 'Sara', 'Gomez', 'Fernandez', 'sara@example.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_10', 2),
(11, 'Daniel', 'Diaz', 'Martin', 'daniel@example.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_11', 2),
(12, 'Elena', 'Ruiz', 'Jimenez', 'elena@example.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', 'usuario_generico_12', 2),
(13, 'admin', 'pto', NULL, 'admin@pto.com', '$2a$10$jMvEB5mkEE.Xp2uiera7Zeb.SlfuD8EePeMTXH.7YulnTO7GNaoge', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_persona` int NOT NULL,
  `centro_de_trabajo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_persona`, `centro_de_trabajo`) VALUES
(7, 'IES Alonso de Madrigal'),
(8, 'IES Alonso de Madrigal'),
(9, 'IES Alonso de Madrigal'),
(10, 'IES Alonso de Madrigal'),
(11, 'IES Alonso de Madrigal'),
(12, 'IES Alonso de Madrigal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor_asignatura`
--

CREATE TABLE `profesor_asignatura` (
  `id_profesor_asignatura` int NOT NULL,
  `id_profesor` int NOT NULL,
  `id_asignatura` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor_asignatura`
--

INSERT INTO `profesor_asignatura` (`id_profesor_asignatura`, `id_profesor`, `id_asignatura`) VALUES
(6, 8, 6),
(7, 8, 7),
(8, 8, 8),
(9, 8, 9),
(10, 8, 10),
(11, 9, 11),
(12, 9, 12),
(13, 9, 13),
(14, 9, 14),
(15, 9, 15),
(16, 10, 1),
(17, 10, 2),
(18, 10, 3),
(19, 10, 4),
(20, 10, 5),
(21, 11, 6),
(22, 11, 7),
(23, 11, 8),
(24, 11, 9),
(25, 11, 10),
(26, 12, 11),
(27, 12, 12),
(28, 12, 13),
(29, 12, 14),
(30, 12, 15),
(40, 7, 1),
(41, 7, 2),
(42, 7, 3),
(43, 7, 5),
(44, 7, 7),
(45, 7, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int NOT NULL,
  `rol_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol_desc`) VALUES
(1, 'admin'),
(2, 'profesor'),
(3, 'alumno');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `calendario_clases`
--
ALTER TABLE `calendario_clases`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_calendario_profesor` (`id_calendario_profesor`);

--
-- Indices de la tabla `calendario_profesor`
--
ALTER TABLE `calendario_profesor`
  ADD PRIMARY KEY (`id_calendario_profesor`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_emisor` (`id_emisor`),
  ADD KEY `id_receptor` (`id_receptor`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `persona_roles_id_rol_fk` (`rol`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `profesor_asignatura`
--
ALTER TABLE `profesor_asignatura`
  ADD PRIMARY KEY (`id_profesor_asignatura`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_profesor` (`id_profesor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `calendario_clases`
--
ALTER TABLE `calendario_clases`
  MODIFY `id_clase` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `calendario_profesor`
--
ALTER TABLE `calendario_profesor`
  MODIFY `id_calendario_profesor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `profesor_asignatura`
--
ALTER TABLE `profesor_asignatura`
  MODIFY `id_profesor_asignatura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `calendario_clases`
--
ALTER TABLE `calendario_clases`
  ADD CONSTRAINT `calendario_clases_ibfk_1` FOREIGN KEY (`id_calendario_profesor`) REFERENCES `calendario_profesor` (`id_calendario_profesor`),
  ADD CONSTRAINT `calendario_clases_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_persona`),
  ADD CONSTRAINT `calendario_clases_ibfk_3` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`);

--
-- Filtros para la tabla `calendario_profesor`
--
ALTER TABLE `calendario_profesor`
  ADD CONSTRAINT `calendario_profesor_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_persona`);

--
-- Filtros para la tabla `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_emisor`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_receptor`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_roles_id_rol_fk` FOREIGN KEY (`rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `profesor_asignatura`
--
ALTER TABLE `profesor_asignatura`
  ADD CONSTRAINT `profesor_asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_persona`),
  ADD CONSTRAINT `profesor_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
