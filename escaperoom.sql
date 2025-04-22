-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:41 PM
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
-- Database: `escaperoom`
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
  `calificador_id` int(11) DEFAULT NULL,
  `fecha_calificacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `desafios`
--

INSERT INTO `desafios` (`id`, `jugador_id`, `evento_id`, `juego_id`, `tipo`, `archivo_ruta`, `estado`, `calificado`, `calificador_id`, `fecha_calificacion`) VALUES
('DES001', 1, 1, 1, 'Matemático', '/archivos/desafio1.pdf', 'completado', 1, 3, '2024-01-20 21:00:00'),
('DES002', 2, 2, 2, 'Lingüístico', '/archivos/desafio2.docx', 'pendiente', 0, NULL, '2024-02-15 20:00:00'),
('DES003', 3, 3, 6, 'Programación', '/archivos/desafio3.zip', 'completado', 1, 9, '2024-03-09 00:00:00'),
('DES004', 4, 4, 7, 'Científico', '/archivos/desafio4.pptx', 'en progreso', 0, NULL, '2024-04-16 20:30:00'),
('DES005', 5, 5, 8, 'Estrategia', '/archivos/desafio5.txt', 'completado', 1, 6, '2024-05-25 23:00:00'),
('DES006', 6, 1, 3, 'Negocios', '/archivos/desafio6.xlsx', 'pendiente', 0, NULL, '2024-01-20 21:10:00'),
('DES007', 7, 2, 5, 'Historia', '/archivos/desafio7.pdf', 'en progreso', 0, NULL, '2024-02-15 20:10:00'),
('DES008', 8, 3, 9, 'Geografía', '/archivos/desafio8.docx', 'completado', 1, 3, '2024-03-09 00:10:00'),
('DES009', 9, 4, 10, 'Ciencias', '/archivos/desafio9.pptx', 'pendiente', 0, NULL, '2024-04-16 20:40:00'),
('DES010', 10, 5, 4, 'Puzzle', '/archivos/desafio10.zip', 'en progreso', 0, NULL, '2024-05-25 23:10:00');

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
(1, 'Activo'),
(2, 'En Proceso'),
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
(1, 'Semana de la Innovación', 'INV001', '2024-01-15 09:00:00', '2024-01-20 18:00:00', 1, 1, 'Evento de innovación tecnológica', 50),
(2, 'Desafío Matemático', 'MAT002', '2024-02-10 10:00:00', '2024-02-15 17:00:00', 1, 2, 'Competencia de matemáticas', 30),
(3, 'Hackathon de Programación', 'PRG003', '2024-03-05 08:00:00', '2024-03-08 20:00:00', 1, 3, 'Maratón de programación', 40),
(4, 'Olimpiada de Ciencias', 'CIE004', '2024-04-12 09:30:00', '2024-04-16 16:30:00', 1, 4, 'Competencia científica', 35),
(5, 'Torneo de Estrategia', 'EST005', '2024-05-20 11:00:00', '2024-05-25 19:00:00', 1, 5, 'Competencia de juegos de estrategia', 25);

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
(1, 1, 1, 'Excelente evento, muy interesante', '2024-01-20 16:30:00'),
(2, 2, 2, 'Desafío matemático muy estimulante', '2024-02-15 15:45:00'),
(3, 3, 3, 'La hackathon fue una experiencia increíble', '2024-03-08 19:20:00'),
(4, 4, 4, 'Gran competencia científica', '2024-04-16 16:10:00'),
(5, 5, 5, 'Torneo de estrategia muy bien organizado', '2024-05-25 18:30:00'),
(6, 6, 1, 'Aprendí mucho en este evento', '2024-01-20 16:40:00'),
(7, 7, 2, 'Los problemas matemáticos fueron un reto', '2024-02-15 15:50:00'),
(8, 8, 3, 'Excelente oportunidad para programar', '2024-03-08 19:30:00'),
(9, 9, 4, 'Me encantaron los experimentos científicos', '2024-04-16 16:20:00'),
(10, 10, 5, 'Estrategias muy interesantes', '2024-05-25 18:40:00');

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
(1, 'Aventura Matemática', 'Juego educativo de matemáticas para niños', 'matematicas_adventure'),
(2, 'Estrategia de Palabras', 'Juego de estrategia lingüística', 'word_strategy'),
(3, 'Simulador de Negocios', 'Simulación de gestión empresarial', 'business_sim'),
(4, 'Rompecabezas Espacial', 'Juego de puzzles con temática espacial', 'space_puzzle'),
(5, 'Quiz Histórico', 'Juego de preguntas y respuestas de historia', 'history_quiz'),
(6, 'Carrera de Programación', 'Juego de programación y lógica', 'code_race'),
(7, 'Mundo de la Física', 'Juego educativo de conceptos físicos', 'physics_world'),
(8, 'Estrategia de Ajedrez', 'Simulador de ajedrez', 'chess_strategy'),
(9, 'Geografía Global', 'Juego de geografía mundial', 'global_geo'),
(10, 'Desafío de Ciencias', 'Quiz interactivo de ciencias', 'science_challenge');

-- --------------------------------------------------------

--
-- Table structure for table `jugadores`
--

CREATE TABLE `jugadores` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `idGenero` int(11) NOT NULL,
  `idEvento` int(11) DEFAULT NULL,
  `puntaje` int(11) DEFAULT 0,
  `juego_actual` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jugadores`
--

INSERT INTO `jugadores` (`id`, `persona_id`, `edad`, `idGenero`, `idEvento`, `puntaje`, `juego_actual`) VALUES
(1, 1, 25, 1, 1, 100, 1),
(2, 2, 30, 2, 2, 150, 2),
(3, 3, 22, 1, 3, 200, 3),
(4, 4, 28, 2, 4, 180, 4),
(5, 5, 35, 1, 5, 220, 5),
(6, 6, 27, 2, 1, 130, 6),
(7, 7, 33, 1, 2, 190, 7),
(8, 8, 24, 2, 3, 170, 8),
(9, 9, 29, 1, 4, 210, 9),
(10, 10, 26, 2, 5, 160, 10);

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `idEstado` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`id`, `nombres`, `apellidos`, `idEstado`) VALUES
(1, 'Juan', 'Pérez González', 1),
(2, 'María', 'Rodríguez Sánchez', 1),
(3, 'Carlos', 'García López', 1),
(4, 'Ana', 'Martínez Fernández', 1),
(5, 'Luis', 'Hernández Ruiz', 1),
(6, 'Sofía', 'Díaz Morales', 1),
(7, 'David', 'Jiménez Torres', 1),
(8, 'Laura', 'Álvarez Navarro', 1),
(9, 'Pedro', 'Romero Castro', 1),
(10, 'Elena', 'Muñoz Herrera', 1);

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
(2, 'Jugador'),
(3, 'Evaluador');

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
(1, 'Sprint Educativo', 1, 2, 3, 4, 5, 6),
(2, 'Sprint Tecnológico', 6, 7, 8, 9, 10, 1),
(3, 'Sprint Estratégico', 2, 3, 8, 9, 5, 7),
(4, 'Sprint Científico', 4, 5, 7, 10, 1, 6),
(5, 'Sprint Innovación', 3, 6, 9, 2, 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `ci` int(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `persona_id`, `ci`, `password`, `idRol`) VALUES
(1, 1, 12345678, '$2y$10$7XqZRH8qSN7YwW5vXGLFreOzn0gRN8Gr9kZIWyqEYyEb6zGy6F2Ma', 1),
(2, 2, 87654321, '$2y$10$Kx9p7KS8Y9Z0Q1W2E3R4T5Y6U7I8O9P0A1S2D3F4G5H6J7K8L9', 2),
(3, 3, 23456789, '$2y$10$9N8M7B6V5C4X3Z2Q1W0E9R8T7Y6U5I4O3P2A1S0D9F8G7H6J5K4', 3),
(4, 4, 98765432, '$2y$10$1Q2W3E4R5T6Y7U8I9O0P9A8S7D6F5G4H3J2K1L0Z9X8C7V6B5N4', 1),
(5, 5, 34567890, '$2y$10$5T4R3E2W1Q0Y9U8I7O6P5A4S3D2F1G0H9J8K7L6Z5X4C3V2B1N0', 2),
(6, 6, 87654321, '$2y$10$6Y5T4R3E2W1Q0U9I8O7P6A5S4D3F2G1H0J9K8L7Z6X5C4V3B2N1', 3),
(7, 7, 45678901, '$2y$10$7U6Y5T4R3E2W1Q0I9O8P7A6S5D4F3G2H1J0K9L8Z7X6C5V4B3N2', 1),
(8, 8, 56789012, '$2y$10$8I7U6Y5T4R3E2W1Q0O9P8A7S6D5F4G3H2J1K0L9Z8X7C6V5B4N3', 2),
(9, 9, 67890123, '$2y$10$9O8I7U6Y5T4R3E2W1Q0P7A6S5D4F3G2H1J0K9L8Z7X6C5V4B3N2', 3),
(10, 10, 78901234, '$2y$10$0P9O8I7U6Y5T4R3E2W1Q1A0S9D8F7G6H5J4K3L2Z1X0C9V8B7N6', 1);

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
  ADD KEY `calificador_id` (`calificador_id`);

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
  ADD KEY `idEstado` (`idEstado`),
  ADD KEY `idSprint` (`idSprint`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idJugador` (`idJugador`),
  ADD KEY `idEvento` (`idEvento`);

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
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `idGenero` (`idGenero`),
  ADD KEY `idEvento` (`idEvento`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEstado` (`idEstado`);

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
  ADD KEY `idJuego1` (`idJuego1`),
  ADD KEY `idJuego2` (`idJuego2`),
  ADD KEY `idJuego3` (`idJuego3`),
  ADD KEY `idJuego4` (`idJuego4`),
  ADD KEY `idJuego5` (`idJuego5`),
  ADD KEY `idJuego6` (`idJuego6`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `idRol` (`idRol`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sprint`
--
ALTER TABLE `sprint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `desafios_ibfk_4` FOREIGN KEY (`calificador_id`) REFERENCES `usuarios` (`id`);

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
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `jugadores_ibfk_3` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`id`);

--
-- Constraints for table `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`);

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
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
