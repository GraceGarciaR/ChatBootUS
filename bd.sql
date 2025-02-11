-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-02-2025 a las 17:57:49
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `UNISA_ASISTENCIA`
--
CREATE DATABASE IF NOT EXISTS `UNISA_ASISTENCIA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `UNISA_ASISTENCIA`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UA_CATEGORIA`
--

CREATE TABLE `UA_CATEGORIA` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `NUMERO_CATEGORIA` int(11) NOT NULL,
  `DETALLE_CATEGORIA` varchar(255) NOT NULL,
  `ESTATUS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `UA_CATEGORIA`
--

INSERT INTO `UA_CATEGORIA` (`ID_CATEGORIA`, `NUMERO_CATEGORIA`, `DETALLE_CATEGORIA`, `ESTATUS`) VALUES
(1, 1, 'Nuevo Ingreso', 1),
(2, 2, 'Reinscripción', 1),
(3, 3, 'Carga de Documentos', 1),
(4, 4, 'Información de Citas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UA_RESPUESTAS`
--

CREATE TABLE `UA_RESPUESTAS` (
  `ID_RESPUESTA` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  `ID_SUBCATEGORIA` int(11) DEFAULT NULL,
  `RESPUESTA` varchar(5000) NOT NULL,
  `ESTATUS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `UA_RESPUESTAS`
--

INSERT INTO `UA_RESPUESTAS` (`ID_RESPUESTA`, `ID_CATEGORIA`, `ID_SUBCATEGORIA`, `RESPUESTA`, `ESTATUS`) VALUES
(1, 1, 1, 'Te invitamos a seguir al pendiente de nuestra página oficial para la próxima convocatoria que se publica de forma anual entre los meses de marzo y abril.\r\n\r\nPágina oficial: Universidad de la Salud', 1),
(2, 1, 2, 'Hasta el momento no existe ninguna información o indicación,  de que se reasignen lugares en caso de que los aspirantes seleccionados declinen su inscripción. Sin embargo, el criterio indispensable para ser aspirante seleccionable es haber concluido en su totalidad el PAI. En caso de que llegará a suceder, se publicará la información  a través de la página oficial.', 1),
(3, 1, 3, 'La publicación de los resultados está disponible a través de la página oficial https://unisa.cdmx.gob.mx/ ', 1),
(4, 2, NULL, 'La información de la reinscripción será envia vía correo electronico, por lo que te invitamos a estar atento.', 1),
(5, 3, 1, 'Si usted quedó seleccionado/a, deberá acceder al enlace desde la página oficial. \r\n     \r\n     Para la carga de sus documentos, podrá ingresar al enlace.\r\nLa única forma de cargar los documentos es a través del portal. ', 1),
(6, 3, 2, 'Con relación a sus duda, le compartimos que está el apartado: Selecciona tu estado de Estudio > Estudios Concluidos', 1),
(7, 4, 1, 'A medida de recordatorio le pedimos verificar que su cita está agendada entre días hábiles. Para ello es necesario:\r\n1. Ingresar nuevamente al portal (https://app.unisa.cdmx.gob.mx/SIGU/Aspirantes_documentacion/login.php) \r\n2. Iniciar sesión con sus datos \r\n3. Elegir otra fecha dentro del horario y días disponibles.', 1),
(8, 4, 2, 'Le informamos que dado que la elección de la cita se realizó y usted confirmó, la elección de día y horario, no existe ninguna posibilidad de modificar, cambiar o reagendar la cita, es única, personal e intransferible. ', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UA_SUBCATEGORIA`
--

CREATE TABLE `UA_SUBCATEGORIA` (
  `ID_SUBCATEGORIA` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  `NUMERO_SUBCATEGORIA` int(11) NOT NULL,
  `DETALLE_SUBCATEGORIA` varchar(255) NOT NULL,
  `ESTATUS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `UA_SUBCATEGORIA`
--

INSERT INTO `UA_SUBCATEGORIA` (`ID_SUBCATEGORIA`, `ID_CATEGORIA`, `NUMERO_SUBCATEGORIA`, `DETALLE_SUBCATEGORIA`, `ESTATUS`) VALUES
(1, 1, 1, 'Convocatoria', 1),
(2, 1, 2, 'Reasignación de lugares', 1),
(3, 1, 3, 'Publicación de Resultados', 1),
(4, 3, 1, 'Carga de Documento Nuevo Ingreso', 1),
(5, 3, 2, 'Carga de Documentos Egresados', 1),
(6, 4, 1, 'Verificación de Citas', 1),
(7, 4, 2, 'Solicitud de cambio de Citas', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `UA_CATEGORIA`
--
ALTER TABLE `UA_CATEGORIA`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `UA_RESPUESTAS`
--
ALTER TABLE `UA_RESPUESTAS`
  ADD PRIMARY KEY (`ID_RESPUESTA`),
  ADD KEY `ID_CATEGORIA` (`ID_CATEGORIA`);

--
-- Indices de la tabla `UA_SUBCATEGORIA`
--
ALTER TABLE `UA_SUBCATEGORIA`
  ADD PRIMARY KEY (`ID_SUBCATEGORIA`),
  ADD KEY `ID_CATEGORIA` (`ID_CATEGORIA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `UA_CATEGORIA`
--
ALTER TABLE `UA_CATEGORIA`
  MODIFY `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `UA_RESPUESTAS`
--
ALTER TABLE `UA_RESPUESTAS`
  MODIFY `ID_RESPUESTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `UA_SUBCATEGORIA`
--
ALTER TABLE `UA_SUBCATEGORIA`
  MODIFY `ID_SUBCATEGORIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `UA_RESPUESTAS`
--
ALTER TABLE `UA_RESPUESTAS`
  ADD CONSTRAINT `ua_respuestas_ibfk_1` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `UA_CATEGORIA` (`ID_CATEGORIA`);

--
-- Filtros para la tabla `UA_SUBCATEGORIA`
--
ALTER TABLE `UA_SUBCATEGORIA`
  ADD CONSTRAINT `ua_subcategoria_ibfk_1` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `UA_CATEGORIA` (`ID_CATEGORIA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
