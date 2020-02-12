-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-02-2020 a las 09:36:02
-- Versión del servidor: 5.7.29-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `categoryTitle` varchar(20) NOT NULL,
  `categoryDescription` text NOT NULL,
  `categoryStatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `categoryTitle`, `categoryDescription`, `categoryStatus`) VALUES
(1, 'Backend', 'Lo del servidor', 1),
(2, 'Frontend', 'Lo del cliente', 1),
(3, 'UX/UI', 'Lo bien diseñado', 1),
(4, 'Devops', 'Los que configuran', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL,
  `countryName` varchar(20) NOT NULL,
  `countryStatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `countryName`, `countryStatus`) VALUES
(1, 'Mexico', 1),
(2, 'Brazil', 1),
(3, 'EUA', 1),
(4, 'Colombia', 1),
(5, 'Peru', 1),
(6, 'Argentina', 1),
(7, 'New Zeland', 1),
(8, 'Cuba', 1),
(9, 'Puerto Rico', 1),
(10, 'Chile', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `postTitle` varchar(50) NOT NULL,
  `postBody` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `postTitle`, `postBody`, `user_id`, `category_id`) VALUES
(1, 'PHP 7', 'Es lo mejor a PHP', 2, 1),
(2, 'Angular 8', 'Algo dificil de entender', 3, 2),
(3, 'Adobe XD', 'Lo mejor para prototipar interfaces', 3, 3),
(4, 'VueJS', 'Lo mas elegante y simple en JS', 4, 2),
(5, 'SvelteJS', 'Uno mas para el mundo JS', 2, 2),
(6, 'MariaDB', 'Lo que un fork bien hecho logra', 4, 4),
(7, 'Java 8', 'Cool pero extraño', 5, 1),
(8, 'Adonis JS', 'Laravel en NodeJS', 6, 1),
(9, 'Laravel', 'PHP pero elegante', 7, 1),
(10, 'Ruby on Rails', 'De donde se inspiro Laravel', 8, 1),
(11, 'CSS', 'Lo que estilza bonito a la web', 9, 2),
(12, 'JavaScript', 'El lenguaje universal', 9, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `rolName` varchar(20) NOT NULL,
  `rolDescription` text NOT NULL,
  `rolStatus` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rolName`, `rolDescription`, `rolStatus`) VALUES
(1, 'admin', 'El que administra todo', 1),
(2, 'invitado', 'El que solo puede consultar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userStatus` tinyint(1) DEFAULT '1',
  `rol_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `userName`, `userStatus`, `rol_id`, `country_id`) VALUES
(1, 'alan', 1, 1, 1),
(2, 'beto', 1, 2, 3),
(3, 'diana', 1, 2, 2),
(4, 'pedro', 1, 2, 4),
(5, 'elena', 1, 2, 5),
(6, 'jorge', 1, 2, 6),
(7, 'gerardo', 1, 2, 7),
(8, 'claudia', 1, 2, 8),
(9, 'roque', 1, 2, 9),
(10, 'rubi', 1, 2, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoryTitle` (`categoryTitle`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countryName` (`countryName`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `postTitle` (`postTitle`),
  ADD KEY `fk_posts_users` (`user_id`),
  ADD KEY `fk_posts_categories` (`category_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rolName` (`rolName`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD KEY `fk_users_roles` (`rol_id`),
  ADD KEY `fk_users_categories` (`country_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_categories` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `fk_users_roles` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
