-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2025 at 08:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scaperoom`
--

-- --------------------------------------------------------

--
-- Table structure for table `desafios`
--

CREATE TABLE `desafios` (
  `id` varchar(255) NOT NULL,
  `jugador_id` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `juego_id` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `archivo_ruta` varchar(255) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `calificado` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `calificador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id`, `estado`) VALUES
(1, 'En espera'),
(2, 'Activo'),
(3, 'Terminado');

-- --------------------------------------------------------

--
-- Table structure for table `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `idEstado` int(11) DEFAULT 1,
  `idSprint` int(11) DEFAULT NULL,
  `descripcion` varchar(200) NOT NULL,
  `personas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eventos`
--

INSERT INTO `eventos` (`id`, `nombre`, `codigo`, `fechaInicio`, `fechaFin`, `idEstado`, `idSprint`, `descripcion`, `personas`) VALUES
(1, 'Navidad', 'AA0001', '2025-02-12 14:33:00', '2025-02-12 14:37:29', 3, 1, 'Compruebas Descripcion', 10),
(2, 'Twenty Five', 'AA0002', '2025-02-28 14:55:00', '2025-02-28 15:31:03', 3, 1, 'Empezando con buenas vibras.', 50);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `idJugador` int(11) DEFAULT NULL,
  `idEvento` int(11) DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `idJugador`, `idEvento`, `comentarios`, `fecha`) VALUES
(1, 1, 1, 'Gracias por la experiencia.', '2025-01-10 14:45:05'),
(2, 2, 1, 'Me pareció muy bien.', '2024-11-05 17:56:22'),
(3, 3, 1, 'El evento esta bien.', '2024-11-05 17:57:22'),
(4, 4, 1, 'Muy divertido.', '2024-11-05 18:08:27'),
(5, 5, 1, 'Me gusto la iniciativa de estos juegos.', '2024-11-07 10:57:17'),
(6, 6, 1, 'Me parecio muy entretenido.', '2024-11-08 21:09:07'),
(7, 7, 1, 'Me gusto', '2024-11-09 08:37:49'),
(8, 8, 1, 'Podría ser mejor.', '2024-11-16 18:52:53'),
(9, 9, 1, 'Los gráficos son muy coloridos.', '2024-11-19 19:18:54'),
(10, 10, 1, 'Muy buena temática', '2025-01-06 12:45:37'),
(11, 11, 2, 'Perdí pero me ha gustado la experiencia.', '2025-01-10 14:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `genero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genero`
--

INSERT INTO `genero` (`id`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Table structure for table `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `juego` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `juegos`
--

INSERT INTO `juegos` (`id`, `nombre`, `descripcion`, `juego`) VALUES
(1, 'Arte Callejero', 'Tómate una selfie en un mural con un dibujo estilo graffiti en la ciudad. Recomendación imagen en formato jpg.', '../juegos/arteCallejero.php'),
(2, 'Selfie en Teleférico', 'Captura una selfie tuya de fondo la ciudad de La Paz desde el interior de una cabina del teleférico morado.\nRecomendación imagen en formato jpg.', '../juegos/fotoCiudad.php'),
(3, 'Laberinto', 'Descubre el camino correcto en el menor tiempo posible.', '../juegos/laberinto.php'),
(4, 'Memoriza', 'Memoriza las tarjetas y emparéjalas lo más rápido que puedas para ganar más puntos.', '../juegos/memoria.php'),
(5, 'Platos típicos de La Paz', 'Sube un video de 10 segundos o más probando 1 comida típica paceña: salteña, api con pastel, plato paceño u otros. Recomendación en formato mp4 no más de 25 segundos.', '../juegos/platosTipicos.php'),
(6, 'Quiz sobre Bolivia', 'Demuestra cuánto sabes sobre Bolivia.', '../juegos/quizBolivia.php'),
(7, 'Selfie Cholita', 'Captura una selfie tuya con una cholita paceña en la Calle de las Paraguas. Recomendación imagen en formato jpg.', '../juegos/cholitas.php'),
(8, 'Colores', 'Replica el orden exacto de los colores que se alumbran, podrás en 5 rondas?', '../juegos/colores.php'),
(9, 'Explosión', 'Responde todas las preguntas antes que explotes', '../juegos/explosion.php'),
(10, 'Long-Laberinto', 'Descubre el camino correcto en el menor tiempo posible', '../juegos/laberinto-long.php'),
(11, 'Mensaje en botella', 'Encuentra una botella vacía para despues introducir un mensaje motivacional para quien lo encuentre y déjalo en una parte de la ciudad, no olvides tomarle foto y enviarla. Recomendación imagen en formato jpg.', '../juegos/mensajeBotella.php'),
(12, 'Cambio de roles', 'Es hora de cambiar los roles, encuentra a una persona en su labor para pedirle que cambien los roles y tu serás el que atiende, tomate la foto y envíala. Recomendación imagen en formato jpg.', '../juegos/rolesChange.php'),
(13, 'Sliding Puzzle', 'Resuelve el puzzle en la menor cantidad de movimientos.', '../juegos/slinding.php'),
(14, 'Snake', 'Hasta cuanto puedes crecer?', '../juegos/snake.php');

-- --------------------------------------------------------

--
-- Table structure for table `jugadores`
--

CREATE TABLE `jugadores` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `idGenero` int(11) DEFAULT NULL,
  `idEvento` int(11) DEFAULT NULL,
  `puntaje` int(11) DEFAULT 0,
  `idEstado` int(11) DEFAULT 2,
  `juego_actual` int(11) DEFAULT 1,
  `tiempo_fin` timestamp NULL DEFAULT NULL,
  `token_acceso` varchar(64) DEFAULT NULL,
  `token_expiracion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombres`, `edad`, `idGenero`, `idEvento`, `puntaje`, `idEstado`, `juego_actual`, `tiempo_fin`, `token_acceso`, `token_expiracion`) VALUES
(1, 'Roger', 23, 1, 1, 2, 3, 3, NULL, NULL, NULL),
(2, 'Sonia', 19, 2, 1, 10, 3, 7, NULL, NULL, NULL),
(3, 'Raul', 28, 1, 1, 7, 3, 7, NULL, NULL, NULL),
(4, 'Laura', 33, 2, 1, 8, 3, 7, NULL, NULL, NULL),
(5, 'Dora', 32, 1, 1, 11, 3, 7, NULL, NULL, NULL),
(6, 'Damaris', 20, 2, 1, 8, 3, 7, NULL, NULL, NULL),
(7, 'Rene', 23, 1, 1, 8, 3, 7, NULL, NULL, NULL),
(8, 'Camila', 23, 2, 1, 0, 3, 1, NULL, NULL, NULL),
(9, 'Regina', 24, 2, 1, 2, 3, 2, NULL, NULL, NULL),
(10, 'Albert 98', 24, 1, 1, 2, 3, 2, NULL, NULL, NULL),
(11, 'Laura', 23, 2, 2, 8, 3, 7, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Game Master');

-- --------------------------------------------------------

--
-- Table structure for table `sprint`
--

CREATE TABLE `sprint` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idJuego1` int(11) DEFAULT NULL,
  `idJuego2` int(11) DEFAULT NULL,
  `idJuego3` int(11) DEFAULT NULL,
  `idJuego4` int(11) DEFAULT NULL,
  `idJuego5` int(11) DEFAULT NULL,
  `idJuego6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sprint`
--

INSERT INTO `sprint` (`id`, `nombre`, `idJuego1`, `idJuego2`, `idJuego3`, `idJuego4`, `idJuego5`, `idJuego6`) VALUES
(1, 'Tour City LP', 13, 14, 8, 8, 11, 12),
(21, 'Perdiendo la Cabeza', 1, 2, 3, 4, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `ci` int(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idRol` int(11) DEFAULT NULL,
  `idEstado` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `ci`, `nombres`, `apellidos`, `password`, `idRol`, `idEstado`) VALUES
(1, 1234567, 'Luis Angel', 'FullName', '$2y$10$s9peakijNutTHwgbuj5PLuaC3mLelWRCoTGZtTdaMjGEpvLpbfDYq', 1, 2),
(2, 7654321, 'Luis Angel', 'FullName GM', '$2y$10$P9VPscFSN6V.EzMxSIPyV.EtE/7Whwrvg9STq9BV7TuwlqEQo/0zu', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `desafios`
--
ALTER TABLE `desafios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jugador_id` (`jugador_id`),
  ADD KEY `evento_id` (`evento_id`),
  ADD KEY `juego_id` (`juego_id`),
  ADD KEY `fk_calificador` (`calificador_id`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventos_ibfk_1` (`idEstado`),
  ADD KEY `eventos_ibfk_2` (`idSprint`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_ibfk_1` (`idJugador`),
  ADD KEY `feedback_ibfk_2` (`idEvento`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jugadores_ibfk_1` (`idGenero`),
  ADD KEY `jugadores_ibfk_2` (`idEvento`),
  ADD KEY `jugadores_ibfk_3` (`idEstado`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sprint`
--
ALTER TABLE `sprint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sprint_ibfk_1` (`idJuego1`),
  ADD KEY `sprint_ibfk_2` (`idJuego2`),
  ADD KEY `sprint_ibfk_3` (`idJuego3`),
  ADD KEY `sprint_ibfk_4` (`idJuego4`),
  ADD KEY `sprint_ibfk_5` (`idJuego5`),
  ADD KEY `sprint_ibfk_6` (`idJuego6`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_ibfk_1` (`idRol`),
  ADD KEY `fk_estado_usuarios` (`idEstado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sprint`
--
ALTER TABLE `sprint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `desafios`
--
ALTER TABLE `desafios`
  ADD CONSTRAINT `desafios_ibfk_1` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `desafios_ibfk_2` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  ADD CONSTRAINT `desafios_ibfk_3` FOREIGN KEY (`juego_id`) REFERENCES `juegos` (`id`),
  ADD CONSTRAINT `fk_calificador` FOREIGN KEY (`calificador_id`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`idSprint`) REFERENCES `sprint` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`idJugador`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`id`);

--
-- Constraints for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`id`),
  ADD CONSTRAINT `jugadores_ibfk_3` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`);

--
-- Constraints for table `sprint`
--
ALTER TABLE `sprint`
  ADD CONSTRAINT `sprint_ibfk_1` FOREIGN KEY (`idJuego1`) REFERENCES `juegos` (`id`),
  ADD CONSTRAINT `sprint_ibfk_2` FOREIGN KEY (`idJuego2`) REFERENCES `juegos` (`id`),
  ADD CONSTRAINT `sprint_ibfk_3` FOREIGN KEY (`idJuego3`) REFERENCES `juegos` (`id`),
  ADD CONSTRAINT `sprint_ibfk_4` FOREIGN KEY (`idJuego4`) REFERENCES `juegos` (`id`),
  ADD CONSTRAINT `sprint_ibfk_5` FOREIGN KEY (`idJuego5`) REFERENCES `juegos` (`id`),
  ADD CONSTRAINT `sprint_ibfk_6` FOREIGN KEY (`idJuego6`) REFERENCES `juegos` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_estado_usuarios` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
