-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2020 a las 01:50:31
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fantastic_school_admin_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `branch`
--

CREATE TABLE `branch` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `AccountNumber` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `branch`
--

INSERT INTO `branch` (`id`, `Name`, `AccountNumber`) VALUES
(1, 'Banco de Guayaquil', '1016598635'),
(3, 'Banco de Machala', '1896532596'),
(4, 'Banco del Pacífico', '1763269856');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classattendance`
--

CREATE TABLE `classattendance` (
  `id` int(10) NOT NULL,
  `Subject` int(10) UNSIGNED NOT NULL,
  `Student` int(10) UNSIGNED NOT NULL,
  `RegNo` int(10) UNSIGNED DEFAULT NULL,
  `Class` int(10) UNSIGNED DEFAULT NULL,
  `Stream` int(10) UNSIGNED DEFAULT NULL,
  `Attended` varchar(40) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classes`
--

CREATE TABLE `classes` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `classes`
--

INSERT INTO `classes` (`id`, `Name`) VALUES
(1, '1ro Educación General Básica'),
(2, '2do Educación General Básica'),
(3, '3ro Educación General Básica'),
(4, '4to Educación General Básica'),
(5, '5to Educación General Básica'),
(6, '6to Educación General Básica'),
(7, '7mo Educación General Básica'),
(8, '8vo Educación General Básica'),
(9, '9no Educación General Básica'),
(10, '10mo Educación General Básica'),
(11, '1ro de Bachillerato'),
(12, '2do de Bachillerato'),
(13, '3ro de Bachillerato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examcategories`
--

CREATE TABLE `examcategories` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examresults`
--

CREATE TABLE `examresults` (
  `id` int(10) NOT NULL,
  `student` int(10) UNSIGNED NOT NULL,
  `RegNo` int(10) UNSIGNED DEFAULT NULL,
  `Class` int(10) UNSIGNED DEFAULT NULL,
  `Stream` int(10) UNSIGNED DEFAULT NULL,
  `Category` int(10) UNSIGNED DEFAULT NULL,
  `Subject` int(10) UNSIGNED DEFAULT NULL,
  `Marks` int(11) NOT NULL,
  `Term` int(10) UNSIGNED NOT NULL,
  `AcademicYear` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feescollection`
--

CREATE TABLE `feescollection` (
  `id` int(10) NOT NULL,
  `Student` int(10) UNSIGNED NOT NULL,
  `Class` int(10) UNSIGNED DEFAULT NULL,
  `Session` int(10) UNSIGNED NOT NULL,
  `PaidAmount` int(11) NOT NULL,
  `Balance` int(10) UNSIGNED DEFAULT NULL,
  `Branch` int(10) UNSIGNED NOT NULL,
  `Date` date DEFAULT NULL,
  `Remarks` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hostels`
--

CREATE TABLE `hostels` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hostels`
--

INSERT INTO `hostels` (`id`, `Name`, `Status`) VALUES
(1, 'Dr. José Ochoa León', 'Available');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membership_grouppermissions`
--

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int(10) NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT 0,
  `allowEdit` tinyint(4) NOT NULL DEFAULT 0,
  `allowDelete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'students', 1, 3, 3, 3),
(2, 2, 'feescollection', 1, 3, 3, 3),
(3, 2, 'branch', 1, 3, 3, 3),
(4, 2, 'teachers', 1, 3, 3, 3),
(5, 2, 'subjects', 1, 3, 3, 3),
(6, 2, 'classes', 1, 3, 3, 3),
(7, 2, 'streams', 1, 3, 3, 3),
(8, 2, 'hostels', 1, 3, 3, 3),
(9, 2, 'timetable', 1, 3, 3, 3),
(10, 2, 'events', 1, 3, 3, 3),
(11, 2, 'notices', 1, 3, 3, 3),
(12, 2, 'examresults', 1, 3, 3, 3),
(13, 2, 'parents', 1, 3, 3, 3),
(14, 2, 'examcategories', 1, 3, 3, 3),
(15, 2, 'sessions', 1, 3, 3, 3),
(16, 2, 'studentcategories', 1, 3, 3, 3),
(17, 2, 'classattendance', 1, 3, 3, 3),
(18, 2, 'fee_structure', 1, 3, 3, 3),
(19, 2, 'fee_structure', 1, 3, 3, 3),
(20, 2, 'fee_structure', 1, 3, 3, 3),
(21, 2, 'schoolmoney', 1, 3, 3, 3),
(40, 3, 'students', 0, 3, 0, 0),
(41, 3, 'feescollection', 0, 3, 0, 0),
(42, 3, 'branch', 1, 3, 0, 0),
(43, 3, 'teachers', 0, 3, 0, 0),
(44, 3, 'subjects', 0, 3, 0, 0),
(45, 3, 'classes', 0, 3, 0, 0),
(46, 3, 'streams', 0, 3, 0, 0),
(47, 3, 'hostels', 0, 3, 0, 0),
(48, 3, 'timetable', 0, 3, 0, 0),
(49, 3, 'events', 1, 3, 0, 0),
(50, 3, 'notices', 0, 3, 0, 0),
(51, 3, 'examresults', 0, 3, 0, 0),
(52, 3, 'parents', 0, 3, 0, 0),
(53, 3, 'examcategories', 0, 3, 0, 0),
(54, 3, 'sessions', 0, 3, 0, 0),
(55, 3, 'studentcategories', 0, 3, 0, 0),
(56, 3, 'classattendance', 0, 3, 0, 0),
(57, 3, 'schoolmoney', 0, 3, 0, 0),
(58, 4, 'students', 1, 3, 3, 3),
(59, 4, 'feescollection', 1, 3, 3, 3),
(60, 4, 'branch', 1, 3, 3, 3),
(61, 4, 'teachers', 1, 3, 3, 3),
(62, 4, 'subjects', 1, 3, 3, 3),
(63, 4, 'classes', 1, 3, 3, 3),
(64, 4, 'streams', 1, 3, 3, 3),
(65, 4, 'hostels', 1, 3, 3, 3),
(66, 4, 'timetable', 1, 3, 3, 3),
(67, 4, 'events', 1, 3, 3, 3),
(68, 4, 'notices', 1, 3, 3, 3),
(69, 4, 'examresults', 1, 3, 3, 3),
(70, 4, 'parents', 1, 3, 3, 3),
(71, 4, 'examcategories', 1, 3, 3, 3),
(72, 4, 'sessions', 1, 3, 3, 3),
(73, 4, 'studentcategories', 1, 3, 3, 3),
(74, 4, 'classattendance', 1, 3, 3, 3),
(75, 4, 'schoolmoney', 1, 3, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membership_groups`
--

CREATE TABLE `membership_groups` (
  `groupID` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(0, 'Admins', 'Grupo Administrador', 0, 1),
(1, 'anonymous', 'Grupo anonimo', 0, 0),
(2, 'Superusuario', 'Superusuario', 0, 1),
(3, 'Administradores', 'Administradores', 1, 0),
(4, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(5, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(6, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(7, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(8, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(9, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(10, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(11, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(12, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(13, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(14, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(15, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(16, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(17, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(18, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(19, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(20, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(21, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(22, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(23, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(24, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(25, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(26, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(27, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(28, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(29, 'Admins', 'Admin group created automatically on 2020-11-10', 0, 1),
(30, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(31, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(32, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(33, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(34, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(35, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(36, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(37, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(38, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(39, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(40, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(41, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(42, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(43, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(44, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(45, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(46, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(47, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(48, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(49, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(50, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(51, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(52, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(53, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(54, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(55, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(56, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(57, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(58, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(59, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(60, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(61, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(62, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(63, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(64, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(65, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(66, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(67, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(68, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(69, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(70, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(71, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(72, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(73, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(74, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(75, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(76, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(77, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(78, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(79, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(80, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(81, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(82, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(83, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(84, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(85, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(86, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(87, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(88, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(89, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(90, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(91, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(92, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(93, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(94, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(95, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(96, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(97, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(98, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(99, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(100, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(101, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(102, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(103, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(104, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(105, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(106, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(107, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(108, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(109, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(110, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(111, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(112, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(113, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(114, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(115, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(116, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(117, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(118, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(119, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(120, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(121, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(122, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(123, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(124, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(125, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(126, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(127, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(128, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(129, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(130, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(131, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(132, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(133, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(134, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(135, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(136, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(137, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(138, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(139, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(140, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(141, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(142, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(143, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(144, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(145, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(146, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(147, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(148, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(149, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(150, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(151, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(152, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(153, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(154, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(155, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(156, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(157, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(158, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(159, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(160, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(161, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(162, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(163, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(164, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(165, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(166, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(167, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(168, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(169, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(170, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(171, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(172, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(173, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(174, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(175, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(176, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(177, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(178, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(179, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(180, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(181, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(182, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(183, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(184, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(185, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(186, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(187, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(188, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(189, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(190, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(191, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(192, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(193, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(194, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(195, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(196, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(197, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(198, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(199, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(200, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(201, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(202, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(203, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(204, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(205, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(206, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(207, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(208, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(209, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(210, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(211, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(212, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(213, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(214, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(215, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(216, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(217, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(218, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(219, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(220, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(221, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(222, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(223, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(224, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(225, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(226, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(227, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(228, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(229, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(230, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(231, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(232, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(233, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(234, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(235, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(236, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(237, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(238, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(239, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(240, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(241, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(242, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(243, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(244, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(245, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(246, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(247, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(248, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(249, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(250, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(251, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(252, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(253, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(254, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(255, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(256, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(257, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(258, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(259, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(260, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(261, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(262, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(263, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(264, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(265, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(266, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(267, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(268, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(269, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(270, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(271, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(272, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(273, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(274, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(275, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(276, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(277, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(278, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(279, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(280, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(281, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(282, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(283, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(284, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(285, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(286, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(287, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(288, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(289, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(290, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(291, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(292, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(293, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(294, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(295, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(296, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(297, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(298, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(299, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(300, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(301, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(302, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(303, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(304, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(305, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(306, 'Admins', 'Admin group created automatically on 2020-11-14', 0, 1),
(307, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(308, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(309, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(310, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(311, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(312, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(313, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(314, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(315, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(316, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(317, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(318, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(319, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(320, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(321, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(322, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(323, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(324, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(325, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(326, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(327, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(328, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(329, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(330, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(331, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(332, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(333, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(334, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(335, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(336, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(337, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(338, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(339, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(340, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(341, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(342, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(343, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(344, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(345, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(346, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(347, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(348, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(349, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(350, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(351, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(352, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(353, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(354, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(355, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(356, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(357, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(358, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(359, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(360, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(361, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(362, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(363, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(364, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(365, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(366, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(367, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(368, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(369, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(370, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(371, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(372, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(373, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(374, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(375, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(376, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(377, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(378, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(379, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(380, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(381, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(382, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(383, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(384, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(385, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(386, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(387, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(388, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(389, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(390, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(391, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(392, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(393, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(394, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(395, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(396, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(397, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(398, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(399, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(400, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(401, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(402, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(403, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(404, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(405, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(406, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(407, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(408, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(409, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(410, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(411, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(412, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(413, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(414, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(415, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(416, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(417, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(418, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(419, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(420, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(421, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(422, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(423, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(424, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(425, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(426, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(427, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(428, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(429, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(430, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(431, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(432, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(433, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(434, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(435, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(436, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(437, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(438, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(439, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(440, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(441, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(442, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(443, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(444, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(445, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(446, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(447, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(448, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(449, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(450, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(451, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(452, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(453, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(454, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(455, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(456, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(457, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(458, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(459, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(460, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(461, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(462, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(463, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(464, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(465, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(466, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(467, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(468, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(469, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(470, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(471, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(472, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(473, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(474, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(475, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(476, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(477, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(478, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(479, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(480, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(481, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(482, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(483, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(484, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(485, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(486, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(487, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(488, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(489, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(490, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(491, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(492, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(493, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(494, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(495, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(496, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(497, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(498, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(499, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(500, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(501, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(502, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(503, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(504, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(505, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(506, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(507, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(508, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(509, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(510, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(511, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(512, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(513, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(514, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(515, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(516, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1),
(517, 'Admins', 'Admin group created automatically on 2020-11-15', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membership_userpermissions`
--

CREATE TABLE `membership_userpermissions` (
  `permissionID` int(10) NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT 0,
  `allowEdit` tinyint(4) NOT NULL DEFAULT 0,
  `allowDelete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membership_userrecords`
--

CREATE TABLE `membership_userrecords` (
  `recID` bigint(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'branch', '1', 'sam12', 1604961665, 1604961665, 2),
(3, 'branch', '3', 'sam12', 1604961711, 1604961711, 2),
(4, 'branch', '4', 'sam12', 1605313561, 1605313561, 2),
(5, 'streams', '1', 'sam12', 1605313735, 1605313735, 2),
(6, 'teachers', '1', 'sam12', 1605313868, 1605313897, 2),
(7, 'teachers', '2', 'sam12', 1605314449, 1605314449, 2),
(8, 'teachers', '3', 'sam12', 1605314882, 1605314882, 2),
(9, 'studentcategories', '1', 'sam12', 1605399435, 1605399665, 2),
(10, 'studentcategories', '2', 'sam12', 1605399452, 1605399681, 2),
(11, 'hostels', '1', 'sam12', 1605400080, 1605400080, 2),
(12, 'classes', '1', 'sam12', 1605400614, 1605400614, 2),
(13, 'classes', '2', 'sam12', 1605400677, 1605400677, 2),
(14, 'classes', '3', 'sam12', 1605400685, 1605400685, 2),
(15, 'classes', '4', 'sam12', 1605400691, 1605400691, 2),
(16, 'classes', '5', 'sam12', 1605400725, 1605400725, 2),
(17, 'classes', '6', 'sam12', 1605400731, 1605400731, 2),
(18, 'classes', '7', 'sam12', 1605400746, 1605400746, 2),
(19, 'classes', '8', 'sam12', 1605400753, 1605400753, 2),
(20, 'classes', '9', 'sam12', 1605400765, 1605400765, 2),
(21, 'classes', '10', 'sam12', 1605400771, 1605400771, 2),
(22, 'classes', '11', 'sam12', 1605400837, 1605400837, 2),
(23, 'classes', '12', 'sam12', 1605400844, 1605400844, 2),
(24, 'classes', '13', 'sam12', 1605400849, 1605400849, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membership_users`
--

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text DEFAULT NULL,
  `custom2` text DEFAULT NULL,
  `custom3` text DEFAULT NULL,
  `custom4` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', 'c88f8846c009c351cf953289cf06dc38', 'admin@utmachala.edu.ec', '2018-05-02', 2, 0, 1, '', '', '', '', 'Admin member created automatically on 2018-05-02\nRecord updated automatically on 2018-05-03\nmember updated his profile on 04/02/2020, 12:54 am from IP address ::1', NULL, NULL),
('sam12', 'c88f8846c009c351cf953289cf06dc38', 'samux_xt@hotmail.com', '2020-11-07', 2, 0, 1, '', '', '', '', 'member signed up through the registration form.', 'e108d103ca30f2d7c590ed804a04ed28', 1604800475),
('guest', NULL, NULL, '2020-11-10', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 4, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 5, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 6, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 7, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 8, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 9, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 10, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 11, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 12, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 13, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 14, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 15, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 16, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 17, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 18, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 19, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 20, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 21, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 22, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 23, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 24, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 25, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 26, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 27, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 28, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-10', 29, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-10', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 30, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 31, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 32, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 33, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 34, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 35, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 36, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 37, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 38, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 39, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 40, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 41, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 42, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 43, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 44, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 45, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 46, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 47, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 48, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 49, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 50, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 51, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 52, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 53, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 54, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 55, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 56, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 57, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 58, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 59, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 60, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 61, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 62, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 63, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 64, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 65, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 66, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 67, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 68, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 69, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 70, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 71, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 72, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 73, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 74, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 75, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 76, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 77, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 78, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 79, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 80, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 81, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 82, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 83, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 84, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 85, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 86, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 87, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 88, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 89, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 90, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 91, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 92, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 93, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 94, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 95, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 96, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 97, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 98, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 99, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 100, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 101, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 102, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 103, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 104, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 105, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 106, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 107, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 108, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 109, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 110, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 111, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 112, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 113, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 114, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 115, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 116, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 117, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 118, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 119, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 120, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 121, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 122, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 123, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 124, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 125, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 126, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 127, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 128, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 129, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 130, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 131, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 132, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 133, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 134, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 135, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 136, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 137, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 138, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 139, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 140, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 141, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 142, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 143, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 144, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 145, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 146, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 147, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 148, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 149, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 150, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 151, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 152, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 153, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 154, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 155, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 156, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 157, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 158, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 159, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 160, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 161, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 162, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 163, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 164, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 165, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 166, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 167, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 168, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 169, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 170, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 171, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 172, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 173, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 174, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 175, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 176, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 177, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 178, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 179, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 180, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 181, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 182, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 183, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 184, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 185, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 186, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 187, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 188, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 189, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 190, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 191, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 192, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 193, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 194, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 195, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 196, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 197, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 198, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 199, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 200, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 201, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 202, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 203, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 204, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 205, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 206, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 207, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 208, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 209, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 210, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 211, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 212, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 213, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 214, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 215, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 216, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 217, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 218, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 219, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 220, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 221, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 222, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 223, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 224, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 225, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 226, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 227, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 228, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 229, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 230, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 231, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 232, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 233, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 234, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 235, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 236, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 237, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 238, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 239, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 240, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 241, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 242, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 243, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 244, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 245, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 246, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 247, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 248, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 249, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 250, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 251, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 252, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 253, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 254, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 255, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 256, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 257, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 258, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 259, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 260, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 261, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 262, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 263, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 264, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 265, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 266, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 267, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 268, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 269, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 270, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 271, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 272, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL);
INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 273, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 274, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 275, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 276, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 277, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 278, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 279, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 280, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 281, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 282, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 283, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 284, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 285, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 286, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 287, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 288, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 289, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 290, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 291, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 292, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 293, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 294, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 295, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 296, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 297, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 298, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 299, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 300, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 301, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 302, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 303, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 304, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 305, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-14', 306, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-14', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 307, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 308, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 309, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 310, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 311, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 312, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 313, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 314, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 315, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 316, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 317, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 318, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 319, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 320, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 321, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 322, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 323, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 324, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 325, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 326, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 327, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 328, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 329, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 330, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 331, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 332, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 333, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 334, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 335, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 336, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 337, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 338, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 339, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 340, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 341, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 342, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 343, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 344, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 345, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 346, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 347, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 348, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 349, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 350, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 351, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 352, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 353, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 354, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 355, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 356, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 357, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 358, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 359, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 360, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 361, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 362, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 363, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 364, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 365, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 366, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 367, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 368, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 369, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 370, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 371, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 372, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 373, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 374, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 375, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 376, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 377, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 378, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 379, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 380, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 381, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 382, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 383, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 384, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 385, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 386, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 387, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 388, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 389, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 390, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 391, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 392, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 393, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 394, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 395, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 396, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 397, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 398, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 399, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 400, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 401, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 402, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 403, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 404, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 405, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 406, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 407, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 408, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 409, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 410, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 411, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 412, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 413, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 414, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 415, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 416, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 417, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 418, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 419, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 420, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 421, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 422, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 423, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 424, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 425, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 426, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 427, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 428, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 429, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 430, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 431, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 432, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 433, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 434, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 435, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 436, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 437, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 438, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 439, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 440, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 441, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 442, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 443, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 444, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 445, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 446, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 447, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 448, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 449, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 450, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 451, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 452, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 453, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 454, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 455, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 456, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 457, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 458, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 459, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 460, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 461, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 462, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 463, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 464, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 465, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 466, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 467, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 468, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 469, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 470, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 471, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 472, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 473, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 474, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 475, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 476, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 477, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 478, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 479, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 480, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 481, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 482, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 483, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 484, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 485, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 486, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 487, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('dcalva3', '81dc9bdb52d04dc20036dbd8313ed055', 'dcalva3@utmachala.edu.ec', '2020-11-07', 2, 0, 1, '', '', '', '', 'administrador', 'e108d103ca30f2d7c590ed804a04ed28', 1704899495),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 488, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 489, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 490, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 491, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 492, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 493, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 494, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 495, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 496, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 497, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 498, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 499, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 500, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 501, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 502, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 503, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 504, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 505, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 506, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 507, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 508, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 509, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 510, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 511, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 512, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 513, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 514, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 515, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 516, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL),
('admin', 'af359ab8f3da5f33ffa01f6736e8c02d', 'ronniengoda@gmail.com', '2020-11-15', 517, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2020-11-15', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notices`
--

CREATE TABLE `notices` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  `Details` text NOT NULL,
  `Posted_By` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parents`
--

CREATE TABLE `parents` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Phone` varchar(40) NOT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `HomeAddress` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schoolmoney`
--

CREATE TABLE `schoolmoney` (
  `id` int(10) NOT NULL,
  `Class` int(10) UNSIGNED NOT NULL,
  `Particulars` text NOT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) NOT NULL,
  `Year` varchar(40) NOT NULL,
  `Term` varchar(40) NOT NULL,
  `status` varchar(40) DEFAULT NULL,
  `field4` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `streams`
--

CREATE TABLE `streams` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `streams`
--

INSERT INTO `streams` (`id`, `Name`) VALUES
(1, 'Colegio Dr. José Ochoa León');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `studentcategories`
--

CREATE TABLE `studentcategories` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `studentcategories`
--

INSERT INTO `studentcategories` (`id`, `Name`) VALUES
(1, 'Jornada Matutina'),
(2, 'Jornada Vespertina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `id` int(10) NOT NULL,
  `FullName` varchar(40) NOT NULL,
  `Gender` varchar(40) NOT NULL,
  `DOB` date NOT NULL,
  `Photo` varchar(40) DEFAULT NULL,
  `RegNo` varchar(40) NOT NULL,
  `Class` int(10) UNSIGNED NOT NULL,
  `Stream` int(10) UNSIGNED DEFAULT NULL,
  `Hostel` int(10) UNSIGNED DEFAULT NULL,
  `DOJ` date NOT NULL,
  `Category` int(10) UNSIGNED DEFAULT NULL,
  `AcademicYear` int(10) UNSIGNED NOT NULL,
  `TotalFees` int(10) UNSIGNED NOT NULL,
  `AdvanceFees` int(11) NOT NULL,
  `Balance` int(11) DEFAULT NULL,
  `Parent` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE `teachers` (
  `id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Gender` varchar(40) NOT NULL,
  `Age` int(11) NOT NULL,
  `Phone` varchar(40) NOT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `StaffNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `teachers`
--

INSERT INTO `teachers` (`id`, `Name`, `Gender`, `Age`, `Phone`, `Email`, `StaffNumber`) VALUES
(1, 'Juana Estefanía  Ramón Salazar', 'Female', 35, '0963654782', 'juanaramon12@gmail.com', 1001),
(2, 'Ángel  Asdrúbal Pinto Espinoza', 'Male', 42, '0963256871', 'angelpinto@gmail.com', 1002),
(3, 'Andrés Manuel  López Aguilar', 'Male', 26, '0983657895', 'andreslopez@gmail.com', 1003);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timetable`
--

CREATE TABLE `timetable` (
  `id` int(10) NOT NULL,
  `Time_Table` varchar(40) NOT NULL,
  `Class` int(10) UNSIGNED NOT NULL,
  `Stream` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `classattendance`
--
ALTER TABLE `classattendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Subject` (`Subject`),
  ADD KEY `Student` (`Student`);

--
-- Indices de la tabla `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examcategories`
--
ALTER TABLE `examcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `examresults`
--
ALTER TABLE `examresults`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student` (`student`),
  ADD KEY `Category` (`Category`),
  ADD KEY `Subject` (`Subject`),
  ADD KEY `Term` (`Term`);

--
-- Indices de la tabla `feescollection`
--
ALTER TABLE `feescollection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Student` (`Student`),
  ADD KEY `Session` (`Session`),
  ADD KEY `Branch` (`Branch`);

--
-- Indices de la tabla `hostels`
--
ALTER TABLE `hostels`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indices de la tabla `membership_groups`
--
ALTER TABLE `membership_groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indices de la tabla `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indices de la tabla `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  ADD PRIMARY KEY (`recID`),
  ADD UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  ADD KEY `pkValue` (`pkValue`),
  ADD KEY `tableName` (`tableName`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indices de la tabla `membership_users`
--
ALTER TABLE `membership_users`
  ADD KEY `groupID` (`groupID`);

--
-- Indices de la tabla `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `schoolmoney`
--
ALTER TABLE `schoolmoney`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Class` (`Class`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `studentcategories`
--
ALTER TABLE `studentcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Class` (`Class`),
  ADD KEY `Stream` (`Stream`),
  ADD KEY `Hostel` (`Hostel`),
  ADD KEY `Category` (`Category`),
  ADD KEY `AcademicYear` (`AcademicYear`),
  ADD KEY `TotalFees` (`TotalFees`),
  ADD KEY `Parent` (`Parent`);

--
-- Indices de la tabla `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Class` (`Class`),
  ADD KEY `Stream` (`Stream`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `classattendance`
--
ALTER TABLE `classattendance`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examcategories`
--
ALTER TABLE `examcategories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examresults`
--
ALTER TABLE `examresults`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `feescollection`
--
ALTER TABLE `feescollection`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hostels`
--
ALTER TABLE `hostels`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  MODIFY `permissionID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `membership_groups`
--
ALTER TABLE `membership_groups`
  MODIFY `groupID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

--
-- AUTO_INCREMENT de la tabla `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  MODIFY `permissionID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  MODIFY `recID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `schoolmoney`
--
ALTER TABLE `schoolmoney`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `streams`
--
ALTER TABLE `streams`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `studentcategories`
--
ALTER TABLE `studentcategories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
