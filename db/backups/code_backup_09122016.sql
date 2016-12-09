-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2016 a las 15:31:49
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `code`
--
CREATE DATABASE IF NOT EXISTS `code` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `code`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_access`
--

CREATE TABLE `cd_access` (
  `access_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cd_access`
--

INSERT INTO `cd_access` (`access_id`, `service_id`, `role`, `created`, `updated`, `isactive`) VALUES
(1, 3, 1, '2016-12-09 14:30:02', NULL, 'Y'),
(2, 4, 1, '2016-12-09 14:30:02', NULL, 'Y'),
(3, 5, 1, '2016-12-09 14:30:15', NULL, 'Y'),
(4, 6, 1, '2016-12-09 14:30:15', NULL, 'Y'),
(5, 7, 1, '2016-12-09 14:30:29', NULL, 'Y'),
(6, 8, 1, '2016-12-09 14:30:29', NULL, 'Y'),
(7, 9, 1, '2016-12-09 14:30:40', NULL, 'Y'),
(8, 10, 1, '2016-12-09 14:30:40', NULL, 'Y'),
(9, 11, 1, '2016-12-09 14:30:47', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_click`
--

CREATE TABLE `cd_click` (
  `click_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `os` varchar(60) DEFAULT NULL,
  `browser` varchar(60) DEFAULT NULL,
  `ip` varchar(30) NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `country_name` varchar(60) DEFAULT NULL,
  `region_name` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `time_zone` varchar(60) DEFAULT NULL,
  `latitude` varchar(60) DEFAULT NULL,
  `longitude` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_code`
--

CREATE TABLE `cd_code` (
  `code_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `wiki` text,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_file`
--

CREATE TABLE `cd_file` (
  `file_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `file_type` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `url` varchar(60) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `developer_code` text,
  `production_code` text,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_module`
--

CREATE TABLE `cd_module` (
  `module_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `icon_class` varchar(20) DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cd_module`
--

INSERT INTO `cd_module` (`module_id`, `created`, `updated`, `name`, `position`, `icon_class`, `isactive`) VALUES
(1, '2016-12-09 14:04:53', NULL, 'Config', 1, NULL, 'Y'),
(2, '2016-12-09 14:04:53', NULL, 'Project', 2, NULL, 'Y'),
(3, '2016-12-09 14:05:10', NULL, 'Profile', 3, NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_page`
--

CREATE TABLE `cd_page` (
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `url` varchar(255) NOT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_paramaeter_code`
--

CREATE TABLE `cd_paramaeter_code` (
  `parameter_code_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_parameter`
--

CREATE TABLE `cd_parameter` (
  `parameter_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parameter_type` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `parameter_name` varchar(30) NOT NULL,
  `show_name` varchar(30) NOT NULL,
  `json_values` text,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_service`
--

CREATE TABLE `cd_service` (
  `service_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `icon_class` varchar(20) DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cd_service`
--

INSERT INTO `cd_service` (`service_id`, `module_id`, `created`, `updated`, `name`, `url`, `position`, `icon_class`, `isactive`) VALUES
(3, 1, '2016-12-09 14:06:30', NULL, 'Module', 'module', 1, NULL, 'Y'),
(4, 1, '2016-12-09 14:06:30', NULL, 'Service', 'service', 2, NULL, 'Y'),
(5, 1, '2016-12-09 14:07:02', NULL, 'Users', 'user', 3, NULL, 'Y'),
(6, 1, '2016-12-09 14:07:02', NULL, 'Access', 'access', 4, NULL, 'Y'),
(7, 2, '2016-12-09 14:07:33', NULL, 'Code', 'code', 1, NULL, 'Y'),
(8, 2, '2016-12-09 14:07:33', NULL, 'File', 'file', 2, NULL, 'Y'),
(9, 2, '2016-12-09 14:07:59', NULL, 'Page', 'page', 3, NULL, 'Y'),
(10, 3, '2016-12-09 14:09:18', NULL, 'Edit Data', 'edit_data', 1, NULL, 'Y'),
(11, 3, '2016-12-09 14:09:18', NULL, 'Change Password', 'change_password', 2, NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd_user`
--

CREATE TABLE `cd_user` (
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `sex` char(1) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT 'avatar_blank.jpg',
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cd_user`
--

INSERT INTO `cd_user` (`user_id`, `role`, `created`, `updated`, `first_name`, `last_name`, `sex`, `birthday`, `email`, `phone`, `username`, `password`, `avatar`, `isactive`) VALUES
(1, 1, '2016-12-09 14:20:13', NULL, 'Carlos', 'Vargas', 'M', '1991-01-09', 'carlos-vargas2011@hotmail.com', '+584160984343', 'wmcarlos', '167ff7dd5614f4e7e82769403caad891', 'avatar_blank.jpg', 'Y');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cd_access`
--
ALTER TABLE `cd_access`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `fk_service_id` (`service_id`);

--
-- Indices de la tabla `cd_click`
--
ALTER TABLE `cd_click`
  ADD PRIMARY KEY (`click_id`),
  ADD KEY `fk_page_id01` (`page_id`);

--
-- Indices de la tabla `cd_code`
--
ALTER TABLE `cd_code`
  ADD PRIMARY KEY (`code_id`),
  ADD KEY `fk_user_id01` (`user_id`);

--
-- Indices de la tabla `cd_file`
--
ALTER TABLE `cd_file`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `fk_code_id` (`code_id`);

--
-- Indices de la tabla `cd_module`
--
ALTER TABLE `cd_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indices de la tabla `cd_page`
--
ALTER TABLE `cd_page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `fk_user_id02` (`user_id`),
  ADD KEY `fk_code_id01` (`code_id`);

--
-- Indices de la tabla `cd_paramaeter_code`
--
ALTER TABLE `cd_paramaeter_code`
  ADD PRIMARY KEY (`parameter_code_id`),
  ADD KEY `fk_code_id02` (`code_id`),
  ADD KEY `fk_page_id` (`page_id`);

--
-- Indices de la tabla `cd_parameter`
--
ALTER TABLE `cd_parameter`
  ADD PRIMARY KEY (`parameter_id`),
  ADD KEY `fk_user_id03` (`user_id`);

--
-- Indices de la tabla `cd_service`
--
ALTER TABLE `cd_service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `fk_module_id` (`module_id`);

--
-- Indices de la tabla `cd_user`
--
ALTER TABLE `cd_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cd_access`
--
ALTER TABLE `cd_access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `cd_click`
--
ALTER TABLE `cd_click`
  MODIFY `click_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cd_code`
--
ALTER TABLE `cd_code`
  MODIFY `code_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cd_file`
--
ALTER TABLE `cd_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cd_module`
--
ALTER TABLE `cd_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cd_page`
--
ALTER TABLE `cd_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cd_paramaeter_code`
--
ALTER TABLE `cd_paramaeter_code`
  MODIFY `parameter_code_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cd_parameter`
--
ALTER TABLE `cd_parameter`
  MODIFY `parameter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cd_service`
--
ALTER TABLE `cd_service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `cd_user`
--
ALTER TABLE `cd_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cd_access`
--
ALTER TABLE `cd_access`
  ADD CONSTRAINT `cd_access_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `cd_service` (`service_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cd_click`
--
ALTER TABLE `cd_click`
  ADD CONSTRAINT `fk_page_id01` FOREIGN KEY (`page_id`) REFERENCES `cd_page` (`page_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cd_code`
--
ALTER TABLE `cd_code`
  ADD CONSTRAINT `fk_user_id01` FOREIGN KEY (`user_id`) REFERENCES `cd_user` (`user_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cd_file`
--
ALTER TABLE `cd_file`
  ADD CONSTRAINT `fk_code_id` FOREIGN KEY (`code_id`) REFERENCES `cd_code` (`code_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cd_page`
--
ALTER TABLE `cd_page`
  ADD CONSTRAINT `fk_code_id01` FOREIGN KEY (`code_id`) REFERENCES `cd_code` (`code_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id02` FOREIGN KEY (`user_id`) REFERENCES `cd_user` (`user_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cd_paramaeter_code`
--
ALTER TABLE `cd_paramaeter_code`
  ADD CONSTRAINT `fk_code_id02` FOREIGN KEY (`code_id`) REFERENCES `cd_code` (`code_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_id` FOREIGN KEY (`page_id`) REFERENCES `cd_page` (`page_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cd_parameter`
--
ALTER TABLE `cd_parameter`
  ADD CONSTRAINT `fk_user_id03` FOREIGN KEY (`user_id`) REFERENCES `cd_user` (`user_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cd_service`
--
ALTER TABLE `cd_service`
  ADD CONSTRAINT `fk_module_id` FOREIGN KEY (`module_id`) REFERENCES `cd_module` (`module_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
