-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2022 a las 00:41:07
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reverselogisticsmng`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `Customer_ID` int(7) NOT NULL COMMENT 'Id_Clientes',
  `Name` varchar(50) NOT NULL COMMENT 'Nombre Cliente',
  `Direction1` varchar(100) NOT NULL COMMENT 'Dirección',
  `Direction2` varchar(100) NOT NULL COMMENT 'Complemento dirección',
  `ZIPCode` varchar(5) NOT NULL COMMENT 'Código postal',
  `Town` varchar(50) NOT NULL COMMENT 'Ciudad',
  `Province` varchar(30) NOT NULL COMMENT 'Provincia',
  `Phone1` int(9) NOT NULL COMMENT 'Teléfono 1',
  `Phone2` int(9) NOT NULL COMMENT 'Teléfono 2',
  `Email` varchar(100) NOT NULL COMMENT 'Correo electrónico',
  `CIF` varchar(9) NOT NULL COMMENT 'CIF',
  `ContactPerson` varchar(100) NOT NULL COMMENT 'Persona de contacto',
  `Agency_ID` varchar(3) NOT NULL COMMENT 'Agencia transportes',
  `Remarks` varchar(500) NOT NULL COMMENT 'Comentarios',
  `ClienteActivo` int(1) NOT NULL DEFAULT 1 COMMENT 'Cliente Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`Customer_ID`, `Name`, `Direction1`, `Direction2`, `ZIPCode`, `Town`, `Province`, `Phone1`, `Phone2`, `Email`, `CIF`, `ContactPerson`, `Agency_ID`, `Remarks`, `ClienteActivo`) VALUES
(1000001, 'ANTONIO BARRAU MARTINEZ', 'VIRGEN DE LA MONTANA 7', '', '01001', 'CACERES', 'ALAVA', 555456789, 0, 'antoniobarraumartinez@gmail.com', 'A12345678', 'Contacto ANTONIO BARRAU MARTINEZ', 'CHR', '', 1),
(1000002, 'OPTICA VISION CENTER', 'ANTONIO VICEA N1, CC MER', '', '03189', 'ORIHUELA COSTA', 'ALICANTE', 555473129, 0, 'opticavisioncenter@gmail.com', 'A12345794', 'Contacto OPTICA VISION CENTER', 'MRW', '', 1),
(1000003, 'OPTICALIA CREVILLENT', 'SANTO TOMAS 1', '', '03330', 'CREVILLENT', 'ALICANTE', 555489469, 0, 'opticaliacrevillent@gmail.com', 'A12345851', 'Contacto OPTICALIA CREVILLENT', 'UPS', '', 1),
(1000004, 'CLIMENT OPTICOS', 'AZORIN 28', '', '03420', 'CASTALLA', 'ALICANTE', 555505809, 0, 'climentopticos@gmail.com', 'A12345867', 'Contacto CLIMENT OPTICOS', 'GLS', '', 1),
(1000005, 'CENTRO OPTICO SAN VICENTE', 'DE LA LIBERTAD 13', '', '03690', 'SAN VICENTE DEL RASPEIG', 'ALICANTE', 555522149, 665599231, 'centroopticosanvicente@gmail.com', 'A12345944', 'Contacto CENTRO OPTICO SAN VICENTE', 'SEU', '', 1),
(1000006, 'OPTICA PLAZA', 'RICARDO FABREGA 30', '', '04200', 'TARBERNAS', 'ALMERÍA', 555538489, 0, 'opticaplaza@gmail.com', 'A12346008', 'Contacto OPTICA PLAZA', 'TIP', '', 1),
(1000007, 'OPTICALIA AZUL', 'SANTA EULALIA 12', '', '06800', 'MERIDA', 'BADAJOZ', 555554829, 0, 'opticaliaazul@gmail.com', 'A12346149', 'Contacto OPTICALIA AZUL', 'MEN', '', 1),
(1000008, 'LOUIS ARMANND OPTICS', 'PLAA DEL CENTRE 13', '', '08014', 'BARCELONA', 'BARCELONA', 555571169, 0, 'louisarmanndoptics@gmail.com', 'A12346287', 'Contacto LOUIS ARMANND OPTICS', 'SEN', '', 1),
(1000009, 'CENTRE OPTIC OLESA', 'OLESA 57', '', '08027', 'BARCELONA', 'BARCELONA', 555587509, 0, 'centreopticolesa@gmail.com', 'A12346354', 'Contacto CENTRE OPTIC OLESA', 'CEX', '', 1),
(1000010, 'UNIVERS DE LA VISIO', 'JOSEP SOLDEVILA 43', '', '08030', 'BARCELONA', 'BARCELONA', 555603849, 0, 'universdelavisio@gmail.com', 'A12346417', 'Contacto UNIVERS DE LA VISIO', 'CHR', '', 1),
(1000011, 'ALAIN AFFLELOU SABADELL', 'PASSEIG PLAA MAJOR 38', '', '08202', 'SABADELL', 'BARCELONA', 555620189, 0, 'alainafflelousabadell@gmail.com', 'A12346494', 'Contacto ALAIN AFFLELOU SABADELL', 'MRW', '', 1),
(1000012, 'ALAIN AFFLELOU CARDEDEU', 'DOCTOR KLEIN 102', '', '08500', 'CARDEDEU', 'BARCELONA', 555636529, 0, 'alainaffleloucardedeu@gmail.com', 'A12346612', 'Contacto ALAIN AFFLELOU CARDEDEU', 'UPS', '', 1),
(1000013, 'OPTICALIA PRIM', 'APENINS 14', '', '08917', 'BADALONA', 'BARCELONA', 555652869, 911236756, 'opticaliaprim@gmail.com', 'A12346776', 'Contacto OPTICALIA PRIM', 'GLS', '', 1),
(1000014, 'ELEGRA VISION STA COLOMA GRAM', 'RAMBLA SAN SEBASTIAN 14', '', '08922', 'STA. COLOMA DE GRAMENET', 'BARCELONA', 555669209, 0, 'elegravisionstacolomagram@gmail.com', 'A12346783', 'Contacto ELEGRA VISION STA COLOMA GRAM', 'SEU', '', 1),
(1000015, 'OPTICA ORTEGA MARCO', 'HERRERO 52', '', '12005', 'CASTELLON', 'CASTELLÓN', 555685549, 0, 'opticaortegamarco@gmail.com', 'A12347008', 'Contacto OPTICA ORTEGA MARCO', 'TIP', '', 1),
(1000016, 'OPTI-SHOP', 'FALCONS 1', '', '12200', 'ONDA', 'CASTELLÓN', 555701889, 0, 'opti-shop@gmail.com', 'A12347017', 'Contacto OPTI-SHOP', 'MEN', '', 1),
(1000017, 'ALAIN AFFLELOU ESPACIO CORUNA', 'FCO PEREZ CARBALLO', '', '15008', 'CORUA', 'LA CORUÑA', 555718229, 0, 'alainafflelouespaciocoruna@gmail.com', 'A12347183', 'Contacto ALAIN AFFLELOU ESPACIO CORUNA', 'SEN', '', 1),
(1000018, 'OPTIMAX OPTICAS', 'LA IGLESIA, 46, BAJO', '', '15042', 'FERROL', 'LA CORUÑA', 555734569, 0, 'optimaxopticas@gmail.com', 'A12347190', 'Contacto OPTIMAX OPTICAS', 'CEX', '', 1),
(1000019, 'OPTICA NOTARIO', 'CARRETERIA 60', '', '16002', 'CUENCA', 'CUENCA', 555750909, 0, 'opticanotario@gmail.com', 'A12347276', 'Contacto OPTICA NOTARIO', 'CHR', '', 1),
(1000020, 'OPTICA DEL RIPOLLES', 'CTRA. BARCELONA, 39B', '', '17500', 'RIPOLL', 'GERONA', 555767249, 888000555, 'opticadelripolles@gmail.com', 'A12347350', 'Contacto OPTICA DEL RIPOLLES', 'MRW', '', 1),
(1000021, 'OPTICA EUVISION', 'VIRGEN DE LA CONSOLACION 4', '', '18015', 'GRANADA', 'GRANADA', 555783589, 0, 'opticaeuvision@gmail.com', 'A12347432', 'Contacto OPTICA EUVISION', 'UPS', '', 1),
(1000022, 'OPTICA HERNANI', 'KARDABERAZ 62', '', '20120', 'HERNANI', 'GUIPUZCOA', 555799929, 0, 'opticahernani@gmail.com', 'A12347535', 'Contacto OPTICA HERNANI', 'GLS', '', 1),
(1000023, 'OPTICALIA OARSO', 'SERAPIO MUGICA 12', '', '20302', 'IRUN', 'GUIPUZCOA', 555816269, 0, 'opticaliaoarso@gmail.com', 'A12347544', 'Contacto OPTICALIA OARSO', 'SEU', '', 1),
(1000024, 'SUROPTICA GIBRALEON', 'DE ESPA/A 6', '', '21500', 'GIBRALEON', 'HUELVA', 555832609, 0, 'suropticagibraleon@gmail.com', 'A12347591', 'Contacto SUROPTICA GIBRALEON', 'TIP', '', 1),
(1000025, 'EUROVISION MANCHA REAL', 'PLZA. DE LA CONTITUCION, 5 5', '', '23100', 'MANCHA REAL', 'JAEN', 555848949, 0, 'eurovisionmanchareal@gmail.com', 'A12347644', 'Contacto EUROVISION MANCHA REAL', 'MEN', '', 1),
(1000026, 'CENTRE OPTIC RIERA', 'CATALUA 35', '', '25200', 'CERVERA', 'LÉRIDA', 555865289, 0, 'centreopticriera@gmail.com', 'A12347764', 'Contacto CENTRE OPTIC RIERA', 'SEN', '', 0),
(1000027, 'OPTICA RETIRO', 'MENENDEZ PELAYO 109', '', '28007', 'MADRID', 'MADRID', 555881629, 0, 'opticaretiro@gmail.com', 'A12347871', 'Contacto OPTICA RETIRO', 'CEX', '', 0),
(1000028, 'OPTICA ORENSE', 'ORENSE 7', '', '28020', 'MADRID', 'MADRID', 555897969, 0, 'opticaorense@gmail.com', 'A12347955', 'Contacto OPTICA ORENSE', 'CHR', '', 0),
(1000029, 'VISIONLAB S.A.', 'FRANCISCO SANCHA 20', '', '28034', 'MADRID', 'MADRID', 555914309, 0, 'visionlabs.a.@gmail.com', 'A12348119', 'Contacto VISIONLAB S.A.', 'MRW', '', 0),
(1000030, 'OPTICALIA MEJORADA', 'MARQUES DE HINOJARES 11', '', '28840', 'MEJORADA DEL CAMPO', 'MADRID', 555930649, 0, 'opticaliamejorada@gmail.com', 'A12348401', 'Contacto OPTICALIA MEJORADA', 'UPS', '', 0),
(1000031, 'OPTICA PRINCESA', 'PRINCESA 5', '', '30002', 'MURCIA', 'MURCIA', 555946989, 0, 'opticaprincesa@gmail.com', 'A12348685', 'Contacto OPTICA PRINCESA', 'GLS', '', 0),
(1000032, 'OPTICA ZENETA', 'JUAN CARLOS I 101', '', '30588', 'ZENETA', 'MURCIA', 555963329, 0, 'opticazeneta@gmail.com', 'A12348806', 'Contacto OPTICA ZENETA', 'SEU', '', 0),
(1000033, 'VISUAL CANARIAS', 'PRUDENCIO MORALES 65', '', '35009', 'LAS PALMAS GRAN CANARIA', 'LAS PALMAS', 555979669, 0, 'visualcanarias@gmail.com', 'A12348974', 'Contacto VISUAL CANARIAS', 'TIP', '', 0),
(1000034, 'ALAIN AFFLELOU SALAMANCA', 'CC SALAMANCA AV AGUSTINOS', '', '37005', 'SALAMANCA', 'SALAMANCA', 555996009, 0, 'alainafflelousalamanca@gmail.com', 'A12349057', 'Contacto ALAIN AFFLELOU SALAMANCA', 'MEN', '', 0),
(1000035, 'PUJADAS RIVES ROSA', 'DOCTOR FLEMING 5', '', '38760', 'SANTA CRUZ DE TENERIFE', 'S.C.TENERIFE', 556012349, 0, 'pujadasrivesrosa@gmail.com', 'A12349092', 'Contacto PUJADAS RIVES ROSA', 'SEN', '', 0),
(1000036, 'CENTRO OPTICO RONDA TRIANA', 'RONDA TRIANA 14', '', '41010', 'SEVILLA', 'SEVILLA', 556028689, 0, 'centroopticorondatriana@gmail.com', 'A12349171', 'Contacto CENTRO OPTICO RONDA TRIANA', 'CEX', '', 0),
(1000037, 'MULTIOPTICAS SANZ', 'SAN VICENTE 71', '', '46007', 'VALENCIA', 'VALENCIA', 556045029, 0, 'multiopticassanz@gmail.com', 'A12349481', 'Contacto MULTIOPTICAS SANZ', 'CHR', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `Department_ID` int(2) NOT NULL COMMENT 'Id Departamento',
  `Name` varchar(30) NOT NULL COMMENT 'Nombre departamento',
  `NotificationEmail` varchar(100) NOT NULL COMMENT 'Correo notificaciones',
  `PhoneExtension` int(3) NOT NULL COMMENT 'Extensión telefónica  interna',
  `Activo` int(1) NOT NULL DEFAULT 1 COMMENT 'Departamento activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`Department_ID`, `Name`, `NotificationEmail`, `PhoneExtension`, `Activo`) VALUES
(1, 'Devoluciones', 'returns@company.com', 901, 1),
(2, 'Calidad', 'quality@company.com', 902, 1),
(3, 'Gestión Medioambiental', 'environmentalmanagement@company.com', 903, 1),
(4, 'Almacén', 'warehouse@company.com', 904, 1),
(5, 'Área de Distribución', 'distributionarea@company.com', 905, 1),
(6, 'Producción', 'production@company.com', 906, 1),
(7, 'Mantenimiento', 'maintenance@company.com', 907, 1),
(8, 'Servicios Generales', 'generalservices@company.com', 908, 1),
(9, 'Financiero', 'financial@company.com', 909, 1),
(10, 'Compras', 'purchasing@company.com', 910, 1),
(11, 'Administración', 'administratio@company.com', 911, 1),
(12, 'Dirección general', 'generalmanagement@company.com', 912, 1),
(13, 'Recursos humanos', 'humanresources@company.com', 913, 1),
(14, 'Marketing', 'marketing@company.com', 914, 1),
(15, 'Ventas', 'sales@company.com', 915, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distributionarea`
--

CREATE TABLE `distributionarea` (
  `Expedition_ID` varchar(21) NOT NULL COMMENT 'Id_Expedición',
  `Customer_ID` int(7) NOT NULL COMMENT 'Id_Cliente',
  `User_ID` int(4) NOT NULL COMMENT 'Id_Usuario',
  `Agency_ID` varchar(3) NOT NULL COMMENT 'Agencia transportes',
  `Name` varchar(50) NOT NULL COMMENT 'Nombre Cliente',
  `Direction1` varchar(100) NOT NULL COMMENT 'Dirección cliente',
  `Direction2` varchar(100) DEFAULT NULL COMMENT 'Complemento dirección',
  `ZIPCode` varchar(5) NOT NULL COMMENT 'Código Postal',
  `Town` varchar(50) NOT NULL COMMENT 'Ciudad',
  `Province` varchar(30) NOT NULL COMMENT 'Provincia',
  `Phone1` int(9) NOT NULL COMMENT 'Teléfono 1',
  `Phone2` int(9) DEFAULT NULL COMMENT 'Teléfono 2',
  `Email` varchar(100) NOT NULL COMMENT 'Correo electrónico',
  `ContactPerson` varchar(100) DEFAULT NULL COMMENT 'Persona de contacto',
  `Content` text NOT NULL COMMENT 'Quality_Id de los items incluidos',
  `Weigth` float NOT NULL COMMENT 'Peso de la expedición',
  `Date_ExpeditionsEntry` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora entrada',
  `Date_Shipment` datetime DEFAULT NULL COMMENT 'Fecha y hora de envío'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enviromentmanagement`
--

CREATE TABLE `enviromentmanagement` (
  `EM_ID` int(7) NOT NULL COMMENT 'Id_GestiónMA',
  `Quality_ID` int(7) NOT NULL COMMENT 'Id_Calidad',
  `User_ID` int(4) NOT NULL COMMENT 'Id_User',
  `DateEntry` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora entrada',
  `WasteType` int(2) NOT NULL COMMENT 'Tipo de residuo',
  `Management_ID` int(7) DEFAULT NULL COMMENT 'Id_Gestión',
  `WasteManager_ID` int(2) DEFAULT NULL COMMENT 'Id_Gestor de residuos',
  `DateManagement` datetime DEFAULT current_timestamp() COMMENT 'Fecha de gestión'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lockers`
--

CREATE TABLE `lockers` (
  `Locker_ID` varchar(3) DEFAULT NULL,
  `PackageType` int(1) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lockers`
--

INSERT INTO `lockers` (`Locker_ID`, `PackageType`, `Status`) VALUES
('A01', 1, 0),
('A02', 1, 0),
('A03', 1, 0),
('A04', 1, 0),
('A05', 1, 0),
('A06', 1, 0),
('A07', 1, 0),
('A08', 1, 0),
('A09', 1, 0),
('A10', 1, 0),
('A11', 1, 0),
('A12', 1, 0),
('A13', 1, 0),
('A14', 1, 0),
('A15', 1, 0),
('A16', 1, 0),
('A17', 1, 0),
('A18', 1, 0),
('A19', 1, 0),
('A20', 1, 0),
('B01', 1, 0),
('B02', 1, 0),
('B03', 1, 0),
('B04', 1, 0),
('B05', 1, 0),
('B06', 1, 0),
('B07', 1, 0),
('B08', 1, 0),
('B09', 1, 0),
('B10', 1, 0),
('B11', 1, 0),
('B12', 1, 0),
('B13', 1, 0),
('B14', 1, 0),
('B15', 1, 0),
('B16', 1, 0),
('B17', 1, 0),
('B18', 1, 0),
('B19', 1, 0),
('B20', 1, 0),
('C01', 1, 0),
('C02', 1, 0),
('C03', 1, 0),
('C04', 1, 0),
('C05', 1, 0),
('C06', 1, 0),
('C07', 1, 0),
('C08', 1, 0),
('C09', 1, 0),
('C10', 1, 0),
('C11', 1, 0),
('C12', 1, 0),
('C13', 1, 0),
('C14', 1, 0),
('C15', 1, 0),
('C16', 1, 0),
('C17', 1, 0),
('C18', 1, 0),
('C19', 1, 0),
('C20', 1, 0),
('D01', 1, 0),
('D02', 1, 0),
('D03', 1, 0),
('D04', 1, 0),
('D05', 1, 0),
('D06', 1, 0),
('D07', 1, 0),
('D08', 1, 0),
('D09', 1, 0),
('D10', 1, 0),
('D11', 1, 0),
('D12', 1, 0),
('D13', 1, 0),
('D14', 1, 0),
('D15', 1, 0),
('D16', 1, 0),
('D17', 1, 0),
('D18', 1, 0),
('D19', 1, 0),
('D20', 1, 0),
('E01', 2, 0),
('E02', 2, 0),
('E03', 2, 0),
('E04', 2, 0),
('E05', 2, 0),
('E06', 2, 0),
('E07', 2, 0),
('E08', 2, 0),
('E09', 2, 0),
('E10', 2, 0),
('E11', 2, 0),
('E12', 2, 0),
('E13', 2, 0),
('E14', 2, 0),
('E15', 2, 0),
('E16', 2, 0),
('E17', 2, 0),
('E18', 2, 0),
('E19', 2, 0),
('E20', 2, 0),
('F01', 2, 0),
('F02', 2, 0),
('F03', 2, 0),
('F04', 2, 0),
('F05', 2, 0),
('F06', 2, 0),
('F07', 2, 0),
('F08', 2, 0),
('F09', 2, 0),
('F10', 2, 0),
('F11', 2, 0),
('F12', 2, 0),
('F13', 2, 0),
('F14', 2, 0),
('F15', 2, 0),
('F16', 2, 0),
('F17', 2, 0),
('F18', 2, 0),
('F19', 2, 0),
('F20', 2, 0),
('G01', 2, 0),
('G02', 2, 0),
('G03', 2, 0),
('G04', 2, 0),
('G05', 2, 0),
('G06', 2, 0),
('G07', 2, 0),
('G08', 2, 0),
('G09', 2, 0),
('G10', 2, 0),
('G11', 2, 0),
('G12', 2, 0),
('G13', 2, 0),
('G14', 2, 0),
('G15', 2, 0),
('G16', 2, 0),
('G17', 2, 0),
('G18', 2, 0),
('G19', 2, 0),
('G20', 2, 0),
('H01', 2, 0),
('H02', 2, 0),
('H03', 2, 0),
('H04', 2, 0),
('H05', 2, 0),
('H06', 2, 0),
('H07', 2, 0),
('H08', 2, 0),
('H09', 2, 0),
('H10', 2, 0),
('H11', 2, 0),
('H12', 2, 0),
('H13', 2, 0),
('H14', 2, 0),
('H15', 2, 0),
('H16', 2, 0),
('H17', 2, 0),
('H18', 2, 0),
('H19', 2, 0),
('H20', 2, 0),
('I01', 4, 0),
('I02', 3, 0),
('I03', 3, 0),
('I04', 3, 0),
('I05', 3, 0),
('I06', 3, 0),
('I07', 3, 0),
('I08', 3, 0),
('I09', 3, 0),
('I10', 3, 0),
('I11', 3, 0),
('I12', 3, 0),
('I13', 3, 0),
('I14', 3, 0),
('I15', 3, 0),
('I16', 3, 0),
('I17', 3, 0),
('I18', 3, 0),
('I19', 3, 0),
('I20', 3, 0),
('J01', 3, 0),
('J02', 3, 0),
('J03', 3, 0),
('J04', 3, 0),
('J05', 3, 0),
('J06', 3, 0),
('J07', 3, 0),
('J08', 3, 0),
('J09', 3, 0),
('J10', 3, 0),
('J11', 3, 0),
('J12', 3, 0),
('J13', 3, 0),
('J14', 3, 0),
('J15', 3, 0),
('J16', 3, 0),
('J17', 3, 0),
('J18', 3, 0),
('J19', 3, 0),
('J20', 3, 0),
('K01', 4, 0),
('K02', 4, 0),
('K03', 4, 0),
('K04', 4, 0),
('K05', 4, 0),
('K06', 4, 0),
('K07', 4, 0),
('K08', 4, 0),
('K09', 4, 0),
('K10', 4, 0),
('K11', 4, 0),
('K12', 4, 0),
('K13', 4, 0),
('K14', 4, 0),
('K15', 4, 0),
('K16', 4, 0),
('K17', 4, 0),
('K18', 4, 0),
('K19', 4, 0),
('K20', 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(7) NOT NULL,
  `Order_ID` int(10) NOT NULL COMMENT 'No. Orden',
  `Customer_ID` int(7) NOT NULL COMMENT 'Id_Cliente',
  `DateOrder` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de pedido',
  `DateDelivery` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha envío pedido',
  `Invoice_ID` varchar(26) NOT NULL COMMENT 'No. Factura',
  `Line` int(2) NOT NULL COMMENT 'Línea de pedido',
  `Item_ID` varchar(10) NOT NULL COMMENT 'Id_Item',
  `Qty` int(3) NOT NULL COMMENT 'Cantidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `Order_ID`, `Customer_ID`, `DateOrder`, `DateDelivery`, `Invoice_ID`, `Line`, `Item_ID`, `Qty`) VALUES
(1, 1000001, 1000001, '2021-10-23 15:30:00', '2021-10-25 15:30:00', '11202110231530A11234567890', 1, 'T601012345', 3),
(2, 1000001, 1000001, '2021-10-23 15:30:00', '2021-10-25 15:30:00', '11202110231530A11234567890', 2, 'T701012345', 10),
(3, 1000001, 1000001, '2021-10-23 15:30:00', '2021-10-25 15:30:00', '11202110231530A11234567890', 3, 'T801012345', 23),
(4, 1000002, 1000012, '2021-10-26 13:30:00', '2021-10-28 15:30:00', '11202110261330A11234567891', 1, 'T601012345', 15),
(5, 1000002, 1000012, '2021-10-26 13:30:00', '2021-10-28 15:30:00', '11202110261330A11234567891', 2, 'T801012345', 32),
(6, 1000003, 1000023, '2021-10-28 15:30:00', '2021-10-30 15:30:00', '11202110281530A11234567892', 1, 'T701012345', 99),
(7, 1000004, 1000037, '2021-10-28 16:00:00', '2021-10-30 15:30:00', '11202110281600A11234567893', 1, 'ALIFIN1234', 1),
(8, 1000005, 1000012, '2021-10-28 15:30:00', '2021-10-30 15:30:00', '11202110280902A11234567894', 1, 'TU50100003', 10),
(9, 1000005, 1000012, '2021-10-28 15:30:00', '2021-10-30 15:30:00', '11202110280902A11234567894', 2, 'TU80100006', 2),
(10, 1000006, 1000013, '2021-12-01 15:30:00', '2021-12-04 15:30:00', '11202112011630A11234567895', 1, 'ALIFIN1234', 3),
(11, 1000006, 1000013, '2021-12-01 15:30:00', '2021-12-04 15:30:00', '11202112011630A11234567895', 2, 'ALIGRU1115', 3),
(12, 1000006, 1000013, '2021-12-01 15:30:00', '2021-12-04 15:30:00', '11202112011630A11234567895', 3, 'TU50100003', 15),
(13, 1000006, 1000013, '2021-12-01 15:30:00', '2021-12-04 15:30:00', '11202112011630A11234567895', 4, 'TU60100004', 10),
(14, 1000007, 1000037, '2021-12-05 15:30:00', '2021-12-08 15:30:00', '11202112051530A11234567896', 1, 'T701012345', 9),
(15, 1000007, 1000037, '2021-12-05 15:30:00', '2021-12-08 15:30:00', '11202112051530A11234567896', 2, 'TU70100005', 9),
(16, 1000008, 1000001, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202201021630A11234567897', 1, 'ALIFIN1234', 3),
(17, 1000008, 1000001, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202210240902A11234567897', 2, 'ALIGRU1115', 1),
(18, 1000009, 1000023, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202201021630A11234567898', 1, 'T601012345', 20),
(19, 1000009, 1000023, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202201021630A11234567898', 2, 'T701012345', 20),
(20, 1000009, 1000023, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202201021630A11234567898', 3, 'T801012345', 10),
(21, 1000009, 1000023, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202201021630A11234567898', 4, 'TU60100004', 20),
(22, 1000009, 1000023, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202201021630A11234567898', 5, 'TU70100005', 20),
(23, 1000009, 1000023, '2022-01-02 16:30:00', '2022-01-05 15:30:00', '11202201021630A11234567898', 6, 'TU80100006', 10),
(24, 1000010, 1000002, '2022-01-05 15:30:00', '2022-01-08 15:30:00', '11202201051530A11234567899', 1, 'T601012345', 46),
(25, 1000010, 1000002, '2022-01-05 15:30:00', '2022-01-08 15:30:00', '11202201051530A11234567899', 2, 'T701012345', 36),
(26, 1000010, 1000002, '2022-01-05 15:30:00', '2022-01-08 15:30:00', '11202201051530A11234567899', 3, 'T801012345', 12),
(27, 1000010, 1000002, '2022-01-05 15:30:00', '2022-01-08 15:30:00', '11202201051530A11234567899', 4, 'TU60100004', 46),
(28, 1000010, 1000002, '2022-01-05 15:30:00', '2022-01-08 15:30:00', '11202201051530A11234567899', 5, 'TU70100005', 36),
(29, 1000010, 1000002, '2022-01-05 15:30:00', '2022-01-08 15:30:00', '11202201051530A11234567899', 6, 'TU80100006', 12),
(30, 1000010, 1000003, '2022-02-04 15:30:00', '2022-02-07 15:30:00', '11202202041530A11234567900', 1, 'ALIFIN1234', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `packagestypes`
--

CREATE TABLE `packagestypes` (
  `PackageType_ID` varchar(2) NOT NULL COMMENT 'Tipos de embalajes',
  `Description` varchar(20) NOT NULL COMMENT 'Descripción',
  `ActivePackage` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Formato de embalaje activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `packagestypes`
--

INSERT INTO `packagestypes` (`PackageType_ID`, `Description`, `ActivePackage`) VALUES
('1', 'Sobre', 1),
('2', 'Caja pequeña', 1),
('3', 'Caja grande', 1),
('4', 'Palé', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pickups`
--

CREATE TABLE `pickups` (
  `PickUp_ID` varchar(25) NOT NULL COMMENT 'Id_Recogida',
  `Customer_ID` int(7) NOT NULL COMMENT 'Id_Cliente',
  `ID_User` int(4) NOT NULL COMMENT 'Id_Usuario',
  `Date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de solicitud',
  `AssociatedOrder_ID` int(10) NOT NULL COMMENT 'Pedido asociado',
  `DateRequest` date NOT NULL COMMENT 'Fecha solicitada',
  `PreferentialTimetable` int(1) DEFAULT NULL COMMENT 'Horario preferente',
  `Urgently` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Urgente',
  `MerchandiseRemarks` varchar(300) DEFAULT NULL COMMENT 'Comentarios mercancía',
  `Department_ID` int(2) NOT NULL COMMENT 'Departamento de destino',
  `Agency_ID` varchar(3) NOT NULL COMMENT 'Agencia transporte',
  `PickUpRemarks` varchar(300) DEFAULT NULL COMMENT 'Indicaciones recogida',
  `Received` int(1) DEFAULT 0 COMMENT 'Mercancía recibida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pickups`
--

INSERT INTO `pickups` (`PickUp_ID`, `Customer_ID`, `ID_User`, `Date`, `AssociatedOrder_ID`, `DateRequest`, `PreferentialTimetable`, `Urgently`, `MerchandiseRemarks`, `Department_ID`, `Agency_ID`, `PickUpRemarks`, `Received`) VALUES
('1001202205222316', 1000003, 1, '2022-05-22 23:16:02', 1000004, '2022-05-26', 2, 1, 'Roto', 1, 'MRW', '', 0),
('1001202205222320', 1000003, 1, '2022-05-22 23:20:25', 1000004, '2022-05-25', 1, 0, '', 1, 'MRW', '', 0),
('1001202205231212', 1000002, 1, '2022-05-23 12:12:09', 1000008, '2022-05-26', 1, 0, '', 3, 'MRW', '', 0),
('1001202205231222', 1000002, 1, '2022-05-23 12:22:40', 1000008, '2022-06-03', 1, 0, '', 1, 'MRW', '', 0),
('1001202205231304', 1000019, 1, '2022-05-23 13:04:59', 1000003, '2022-05-25', 1, 0, 'ghjkdghk', 1, 'MRW', 'hghjk', 0),
('1001202205231348100000110', 1000001, 1, '2022-05-23 13:48:12', 1000009, '2022-05-25', 1, 0, '', 1, 'MRW', '', 0),
('2325202205231223', 1000003, 1, '2022-05-23 12:23:55', 1000007, '2022-06-03', 1, 0, '', 1, 'UPS', '', 0),
('2325220523132510', 1000003, 1, '2022-05-23 13:25:40', 1000009, '2022-05-25', 1, 0, '', 1, 'UPS', '', 0),
('2628202205222317', 1000024, 1, '2022-05-22 23:17:05', 1000008, '2022-05-26', 1, 1, 'Mal servido se pide otra referencia a la enviada', 1, 'TIP', '', 0),
('2632202205222242', 1000004, 1, '2022-05-22 22:42:36', 1000003, '2022-05-23', 1, 1, '', 1, 'GLS', '', 0),
('2632202205222245', 1000004, 1, '2022-05-22 22:45:08', 1000003, '2022-05-25', 2, 0, 'Roto en transporte', 1, 'GLS', 'No molestar a los clientes', 0),
('2632202205231117', 1000003, 1, '2022-05-23 11:17:33', 1000010, '2022-05-26', 2, 1, 'fgjfgj', 14, 'GLS', 'fgjhfgj', 0),
('2632220523131410', 1000005, 1, '2022-05-23 13:14:32', 1000005, '2022-05-25', 1, 0, '', 1, 'GLS', '', 0),
('2633202205222315', 1000006, 1, '2022-05-22 23:15:08', 1000004, '2022-05-26', 2, 1, 'jkhlghjkl', 1, 'MEN', 'jkljk', 0),
('2633202205231121', 1000003, 1, '2022-05-23 11:21:44', 1000007, '2022-05-24', 2, 1, 'hjk', 1, 'MEN', 'hvjk', 0),
('2633202205231123', 1000025, 1, '2022-05-23 11:23:29', 1000010, '2022-05-24', 1, 1, 'yutytryjtyj', 1, 'MEN', 'ytuyetu', 0),
('2634202205231300', 1000002, 1, '2022-05-23 13:00:50', 1000003, '2022-05-26', 1, 0, 'hjkh', 5, 'SEN', 'iuytko', 0),
('4611202205222244', 1000019, 1, '2022-05-22 22:44:11', 1000007, '2022-05-23', 1, 1, 'Defecto de superficie y acabado mate', 1, 'CHR', 'Llamar antes de entrar', 0),
('4611202205231110', 1000003, 1, '2022-05-23 11:10:36', 1000002, '2022-05-26', 1, 1, 'Defecto de tratamiento', 5, 'CHR', 'Usar puerta trasera', 0),
('4611202205231135', 1000023, 1, '2022-05-23 11:35:24', 1000008, '2022-05-24', 2, 1, 'yhjfgjh', 1, 'CHR', 'fgdfgj', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferentialtime`
--

CREATE TABLE `preferentialtime` (
  `Type` varchar(10) NOT NULL COMMENT 'Horario preferente',
  `Id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preferentialtime`
--

INSERT INTO `preferentialtime` (`Type`, `Id`) VALUES
('Mañana', 1),
('Tarde', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quality`
--

CREATE TABLE `quality` (
  `Quality_ID` int(7) NOT NULL COMMENT 'Id_Control',
  `Return_ID` int(7) NOT NULL COMMENT 'Id_Devolución',
  `User_ID` int(4) NOT NULL COMMENT 'Id_Ususario',
  `DateEntry` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha / Hora de entrada',
  `Item_ID` varchar(10) NOT NULL COMMENT 'Id_Item',
  `Qty` int(4) NOT NULL COMMENT 'Cantidad',
  `Analysis` text NOT NULL COMMENT 'Ánalisis',
  `Proceded` tinyint(1) NOT NULL COMMENT 'Procede abono',
  `Reason` int(2) DEFAULT NULL COMMENT 'Motivo',
  `NextTrackingStatus` int(2) DEFAULT NULL COMMENT 'Próximo status',
  `Locker_ID` varchar(3) DEFAULT NULL COMMENT 'Casillero asignado',
  `DateOut` datetime DEFAULT NULL COMMENT 'Fecha y hora de salida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptions`
--

CREATE TABLE `receptions` (
  `Reception_ID` int(7) NOT NULL COMMENT 'No. Recepción',
  `PickUp_ID` varchar(25) NOT NULL COMMENT 'No. Recogida',
  `User_ID` int(4) NOT NULL COMMENT 'Id_Usuario',
  `DateReception` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora de recepción',
  `PackageType` varchar(2) NOT NULL COMMENT 'Tipo de embalaje',
  `NextTrackingStatus` int(2) NOT NULL COMMENT 'Status',
  `Locker_ID` varchar(3) NOT NULL COMMENT 'Id_Casillero',
  `Comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `returnreasons`
--

CREATE TABLE `returnreasons` (
  `ReturnReason_ID` int(2) NOT NULL COMMENT 'Motivos de devolución',
  `Description` varchar(50) NOT NULL COMMENT 'Descripción'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `returnreasons`
--

INSERT INTO `returnreasons` (`ReturnReason_ID`, `Description`) VALUES
(1, 'Mercancía defectuosa'),
(2, 'Error al realizar el pedido'),
(3, 'Exceso de producto'),
(4, 'Error de preparación'),
(5, 'Pedido de más'),
(6, 'Error de envío'),
(7, 'Dañado en transporte'),
(8, 'Cortesia comercial'),
(9, 'Sin motivo'),
(10, 'Otros motivos'),
(11, 'Sin defecto aparente'),
(12, 'Pedido correcto'),
(13, 'No pertenece al pedido'),
(14, 'Producto OK'),
(15, 'Devolución a cliente'),
(16, 'No procede');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `returns`
--

CREATE TABLE `returns` (
  `Return_ID` int(7) NOT NULL COMMENT 'Id_Devolución',
  `Reception_ID` int(7) NOT NULL COMMENT 'Id_Recepción',
  `User_ID` int(4) NOT NULL COMMENT 'Id_Usuario',
  `DateEntry` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora de entrada',
  `Item` varchar(10) NOT NULL COMMENT 'Id_Item',
  `Qty` int(4) NOT NULL COMMENT 'Cantidad',
  `Remarks` varchar(200) DEFAULT NULL COMMENT 'Comentarios',
  `NextTrackingStatus` int(2) DEFAULT NULL COMMENT 'Status',
  `Locker_ID` varchar(3) DEFAULT NULL COMMENT 'Id_Casillero',
  `DateOut` datetime DEFAULT NULL COMMENT 'Fecha y hora salida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tracking`
--

CREATE TABLE `tracking` (
  `Tracking_ID` int(9) NOT NULL COMMENT 'Registro tracking',
  `Reception_ID` int(7) NOT NULL COMMENT 'Id_Recepción\r\n',
  `Customer_ID` int(7) NOT NULL COMMENT 'Id_Cliente',
  `Return_ID` int(7) DEFAULT NULL COMMENT 'Id_Devolución',
  `Quality_ID` int(7) DEFAULT NULL COMMENT 'Id_Control',
  `Expedition_ID` varchar(21) DEFAULT NULL COMMENT 'Id_Expedición',
  `LastStatus` int(2) NOT NULL COMMENT 'Status actual',
  `Locker_ID` varchar(3) NOT NULL COMMENT 'No. Casillero',
  `LastMovement` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha último movimiento',
  `Split` tinyint(1) DEFAULT 0 COMMENT 'Devolución dividida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trackingstatus`
--

CREATE TABLE `trackingstatus` (
  `Track_ID` int(2) NOT NULL COMMENT 'Estados tracking',
  `Description` varchar(100) NOT NULL COMMENT 'Descripción'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trackingstatus`
--

INSERT INTO `trackingstatus` (`Track_ID`, `Description`) VALUES
(1, 'Recepción de mercancía'),
(2, 'En espera de entrada en Gestión de Devoluciones'),
(3, 'Gestión de devoluciones'),
(4, 'En espera de entrada en Gestión de Calidad'),
(5, 'Gestión de Calidad'),
(6, 'En espera de entrada en Almacén'),
(7, 'Almacén'),
(8, 'En espera de reubicación en stock'),
(9, 'En espera de entrada en Gestión Medioambiental'),
(10, 'Gestión Medioambiental'),
(11, 'En espera de entrada de en Almacén de residuos'),
(12, 'Almacén de residuos'),
(13, 'Almacén de residuos. En espera de gestión.'),
(14, 'Gestionado / Destruido'),
(15, 'En espera de entrada Área de distribución'),
(16, 'Área de distribución'),
(17, 'En espera de entrada Expediciones'),
(18, 'Expediciones'),
(19, 'Expedicones. En espera de entrada Enviado a cliente'),
(20, 'Enviado a cliente'),
(21, 'En espera de entrada en Producción'),
(22, 'Producción'),
(23, 'En espera de entrada en Mantenimiento'),
(24, 'Mantenimiento'),
(25, 'En espera de entrada en Servicios Generales'),
(26, 'Servicios Generales'),
(27, 'En espera de entrada en Financiero'),
(28, 'Financiero'),
(29, 'En espera de entrada en Compras'),
(30, 'Compras'),
(31, 'En espera de entrada en Administración'),
(32, 'Administración'),
(33, 'En espera de entrada en Dirección General'),
(34, 'Dirección General'),
(35, 'En espera de entrada en Recursos Humanos'),
(36, 'Recursos Humanos'),
(37, 'En espera de entrada en Marketing'),
(38, 'Marketing'),
(39, 'En espera de entrada en Ventas'),
(40, 'Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportagencies`
--

CREATE TABLE `transportagencies` (
  `Agency_ID` varchar(3) NOT NULL COMMENT 'Id_Agencia',
  `CIF` varchar(9) NOT NULL COMMENT 'CIF',
  `Name` varchar(50) NOT NULL COMMENT 'Nombre Agencia',
  `Direction1` varchar(150) NOT NULL COMMENT 'Dirección',
  `Direction2` varchar(150) DEFAULT NULL COMMENT 'Complemento dirección',
  `ZIPCode` int(5) NOT NULL COMMENT 'Código Postal',
  `Town` varchar(50) NOT NULL COMMENT 'Población',
  `Province` varchar(30) NOT NULL COMMENT 'Provincia',
  `CustomerServiceContact` varchar(100) NOT NULL COMMENT 'Contacto Atención al Cliente',
  `CustServPhone` int(9) NOT NULL COMMENT 'Teléfono Atención al Cliente',
  `CustServMail` varchar(100) NOT NULL COMMENT 'Correo Atención al Cliente',
  `BusinessRep` varchar(100) NOT NULL COMMENT 'Agente Comercial',
  `BusinessRepPhone` int(9) NOT NULL COMMENT 'Teléfono Agente Comercial',
  `BusinessRepEmail` varchar(100) NOT NULL COMMENT 'Correo Agente Comercial',
  `Remarks` text DEFAULT NULL COMMENT 'Comentarios',
  `ReturnsAccount` int(5) NOT NULL COMMENT 'No. Cuenta Devoluciones',
  `ShippingAccount` int(5) NOT NULL COMMENT 'No. Cuenta Envíos',
  `Disponible` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Agencia disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transportagencies`
--

INSERT INTO `transportagencies` (`Agency_ID`, `CIF`, `Name`, `Direction1`, `Direction2`, `ZIPCode`, `Town`, `Province`, `CustomerServiceContact`, `CustServPhone`, `CustServMail`, `BusinessRep`, `BusinessRepPhone`, `BusinessRepEmail`, `Remarks`, `ReturnsAccount`, `ShippingAccount`, `Disponible`) VALUES
('CEX', 'A12345686', 'Castilla Express', 'Calle Valgrande, 20', 'Nave 15', 28108, 'Alcobendas', 'Madrid', 'Lorena', 919876543, '', 'Angel Sanchez', 698765432, 'angelsanchez@castillaexpress.es', NULL, 2633, 6531, 1),
('CHR', 'A12345678', 'Correos Express', 'Av. Europa, 8', NULL, 28820, 'Coslada', 'Madrid', 'Fina Fernández', 902111021, 'ATC2@correosexpress.com', 'Carlos Rodriguez', 555666777, 'carlosrodriguez@correosexpress.com', 'Para urgencias marcar Ext. 345', 4611, 46523, 1),
('GLS', 'A12345681', 'GLS', 'Av. De la Cañada 64', 'Posterior', 28823, 'Coslada', 'Madrid', 'Genérico', 915555666, 'ATC@gls.es', 'Lorena Gijón', 555353535, 'lorenagijón@gls.es', NULL, 2632, 4656, 1),
('MEN', 'A12345684', 'Mensapacket', 'Ernesto Anastasio, 79', NULL, 46011, 'Valencia', 'Valencia', 'Ma. Carmen Garcia', 960001234, 'atc@mensapacket.com', 'Reyes Garcia', 666555666, 'reyesgarcia@mensapacket.com', 'Reparto local Valencia', 2633, 4952, 1),
('MRW', 'A12345679', 'MRW', 'Manuel Tovar, 33', 'Bajo - Izq', 28034, 'Madrid', 'Madrid', 'Ramón Reina', 915555555, 'ATC@mrw.es', 'Marina Peña', 555888999, 'marinapeña@mrw.es', 'Telefono particular de Reyes: 555696969', 1001, 4652, 1),
('SEN', 'A12345685', 'Sending', 'A. Suiza, 26', NULL, 28821, 'Coslada', 'Madrid', 'Patricia Tavares', 911234567, 'atc@sending.es', 'Esther Miquel', 696969696, 'esthermiquel@sending.com', NULL, 2634, 4653, 1),
('SEU', 'A12345682', 'SEUR', 'Av. Italia, 9', NULL, 28821, 'Coslada', 'Madrid', 'Fany Rodriguez', 908252501, 'atc@seur.com', 'Brendán Burgos', 555222111, 'brendanburgos@seur.com', NULL, 2627, 7789, 1),
('TIP', 'A12345683', 'TIPSA', 'Fuencaliente, 8', 'Bajo', 46023, 'Valencia', 'Valencia', 'Genérico', 960000001, 'atc@tipsa.es', 'Miguel Carrión', 961234567, 'miguelcarrion@tipsa.es', NULL, 2628, 4456, 1),
('UPS', 'A12345680', 'UPS', 'Av. De la Cañada 64 -66', 'Modulo F', 28820, 'Coslada', 'Madrid', 'Genérico', 916666666, 'ATC@ups.com', 'Rafael Medina', 555999777, 'rafaelmedina@ups.com', 'Recogidas para entrega al día siguiente antes de las 18:00h', 2325, 1234, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `urgent`
--

CREATE TABLE `urgent` (
  `id` tinyint(1) NOT NULL COMMENT 'Urgencia',
  `Description` varchar(10) NOT NULL COMMENT 'Si / No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `urgent`
--

INSERT INTO `urgent` (`id`, `Description`) VALUES
(0, 'false'),
(1, 'true');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `User_ID` int(4) NOT NULL COMMENT 'Id_Usuario',
  `Name` varchar(50) NOT NULL COMMENT 'Nombre',
  `Surname1` varchar(50) NOT NULL COMMENT 'Primer Apellido',
  `Surname2` varchar(50) DEFAULT NULL COMMENT 'Segundo Apellido',
  `User` varchar(20) NOT NULL COMMENT 'Usuario',
  `Password` varchar(20) NOT NULL COMMENT 'Contraseña',
  `Profile` varchar(8) NOT NULL COMMENT 'Perfil de usuario',
  `UsuarioActivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Usuario activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`User_ID`, `Name`, `Surname1`, `Surname2`, `User`, `Password`, `Profile`, `UsuarioActivo`) VALUES
(1, 'José Manuel', 'Domínguez', 'Hernández', 'jmd', 'jmd', 'Admin', 1),
(2, 'Ramón', 'Garcia', 'Gracia', 'RGG', 'RGG', 'Client', 1),
(3, 'Susana', 'Pérez', 'Ramos', 'SPR', 'SPR', 'Client', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warehouse`
--

CREATE TABLE `warehouse` (
  `Warehouse_ID` int(7) NOT NULL COMMENT 'ID_Almacén',
  `Quality_ID` int(7) NOT NULL COMMENT 'Id_Calidad',
  `User_ID` int(4) NOT NULL COMMENT 'Id_Usuario',
  `DateEntry` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora entrada',
  `Item_ID` varchar(10) NOT NULL COMMENT 'Id_Item',
  `Qty` int(3) NOT NULL COMMENT 'Cantidad',
  `NextTrackingStatus` int(2) NOT NULL COMMENT 'Siguiente paso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `warehouseitems`
--

CREATE TABLE `warehouseitems` (
  `Item_ID` varchar(10) NOT NULL COMMENT 'Id_Item',
  `Description` varchar(300) NOT NULL COMMENT 'Descripción Item',
  `Aisle` int(2) NOT NULL COMMENT 'Pasillo',
  `Rack` int(2) NOT NULL COMMENT 'Estantería',
  `Position` varchar(3) NOT NULL COMMENT 'Posición',
  `Qty` int(4) NOT NULL COMMENT 'Cantidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `warehouseitems`
--

INSERT INTO `warehouseitems` (`Item_ID`, `Description`, `Aisle`, `Rack`, `Position`, `Qty`) VALUES
('ALIFIN1234', 'Alicate Universal Punta fina', 2, 3, 'B03', 6),
('ALIGRU1115', 'Alicate Universal Punta gruesa', 2, 3, 'B05', 14),
('T601012345', 'Tornillo 10x60mm', 1, 1, 'A01', 90),
('T701012345', 'Tornillo 10x70mm', 1, 1, 'A07', 128),
('T801012345', 'Tornillo 10x80mm', 1, 1, 'A09', 265),
('TU50100003', 'Tuerca 50x10mm', 3, 2, 'A03', 989),
('TU60100004', 'Tuerca 60x10mm', 3, 2, 'A04', 526),
('TU70100005', 'Tuerca 70x10mm', 3, 2, 'A05', 193),
('TU80100006', 'Tuerca 80x10mm', 3, 2, 'A06', 147);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wastemanagers`
--

CREATE TABLE `wastemanagers` (
  `WasteManager_ID` int(2) NOT NULL COMMENT 'Id_Gestor Residuos',
  `WasteType` varchar(50) NOT NULL COMMENT 'Tipo de residuo',
  `CIF` varchar(9) NOT NULL COMMENT 'CIF',
  `Name` varchar(50) NOT NULL COMMENT 'Nombre Gestor',
  `Direction1` varchar(150) NOT NULL COMMENT 'Dirección',
  `Direction2` varchar(150) DEFAULT NULL COMMENT 'Complemento dirección',
  `ZIPCode` int(5) NOT NULL COMMENT 'Código Postal',
  `Town` varchar(50) NOT NULL COMMENT 'Población',
  `Province` varchar(30) NOT NULL COMMENT 'Provincia',
  `Email` varchar(100) NOT NULL COMMENT 'Correo electrónico',
  `Phone` int(9) NOT NULL COMMENT 'Teléfono contacto',
  `ClientAccount` int(5) NOT NULL COMMENT 'Cuenta Cliente',
  `Activo` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Proveedor activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `wastemanagers`
--

INSERT INTO `wastemanagers` (`WasteManager_ID`, `WasteType`, `CIF`, `Name`, `Direction1`, `Direction2`, `ZIPCode`, `Town`, `Province`, `Email`, `Phone`, `ClientAccount`, `Activo`) VALUES
(1, 'Inflamables', 'A23456789', 'Gestión de Residuos Peligrosos S.L.', 'C/ Peligro, 1', NULL, 46001, 'Valencia', 'Valencia', 'solicitudrecogida@gestionderesiduospeligrosos.com', 965551245, 56895, 1),
(2, 'Tóxicos', 'A23456790', 'Gestión de Residuos Peligrosos S.L.', 'C/ Peligro, 1', NULL, 46001, 'Valencia', 'Valencia', 'solicitudrecogida@gestionderesiduospeligrosos.com', 965551245, 56895, 1),
(3, 'Irritantes', 'A23456791', 'Gestión de Residuos Peligrosos S.L.', 'C/ Peligro, 1', NULL, 46001, 'Valencia', 'Valencia', 'solicitudrecogida@gestionderesiduospeligrosos.com', 965551245, 56895, 1),
(4, 'Plásticos', 'A34567891', 'Gestiones Integrales S.A.', 'C/ Newton, 13', 'P.I. Ciencias', 28109, 'Alcobendas', 'Madrid', 'recogidaresiduos@gestionesintegrales.es', 911234567, 23658, 1),
(5, 'Orgánico', 'A34567891', 'Gestiones Integrales S.A.', 'C/ Newton, 13', 'P.I. Ciencias', 28109, 'Alcobendas', 'Madrid', 'recogidaresiduos@gestionesintegrales.es', 911234567, 23658, 1),
(6, 'Papel', 'A34567891', 'Gestiones Integrales S.A.', 'C/ Newton, 13', 'P.I. Ciencias', 28109, 'Alcobendas', 'Madrid', 'recogidaresiduos@gestionesintegrales.es', 911234567, 23658, 1),
(7, 'Chatarra', 'A34567891', 'Gestiones Integrales S.A.', 'C/ Newton, 13', 'P.I. Ciencias', 28109, 'Alcobendas', 'Madrid', 'recogidaresiduos@gestionesintegrales.es', 911234567, 23658, 1),
(8, 'Cristal', 'A34567891', 'Gestiones Integrales S.A.', 'C/ Newton, 13', 'P.I. Ciencias', 28109, 'Alcobendas', 'Madrid', 'recogidaresiduos@gestionesintegrales.es', 911234567, 23658, 1),
(9, 'Papel', 'A45678912', 'Reciclajes Manolo S.L.U.', 'C/ Cartón, 9', NULL, 46100, 'Burjassot', 'Valencia', 'manolorecogidas@gmail.com', 666555777, 10002, 1),
(10, 'Chatarra', 'A45678912', 'Reciclajes Manolo S.L.U.', 'C/ Cartón, 9', NULL, 46100, 'Burjassot', 'Valencia', 'manolorecogidas@gmail.com', 666555777, 10002, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `waste_id`
--

CREATE TABLE `waste_id` (
  `WasteType_ID` int(2) NOT NULL COMMENT 'Ubicación almacenaje residuo',
  `Type` varchar(25) NOT NULL COMMENT 'Tipo de residuo',
  `Ubicación` varchar(50) NOT NULL COMMENT 'Contenedor / Almacén'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `waste_id`
--

INSERT INTO `waste_id` (`WasteType_ID`, `Type`, `Ubicación`) VALUES
(1, 'Plástico', 'Contenedor Amarillo'),
(2, 'Orgánico', 'Contenedor Marrón'),
(3, 'Papel', 'Contenedor Azúl'),
(4, 'Inflamables', 'Almacén de Residuos Peligrosos'),
(5, 'Tóxicos', 'Almacén de Residuos Peligrosos'),
(6, 'Irritantes', 'Almacén de Residuos Peligrosos'),
(7, 'Chatarra', 'Contenedor Rojo'),
(8, 'Cristal', 'Contenedor Verde');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `Agency_ID` (`Agency_ID`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indices de la tabla `distributionarea`
--
ALTER TABLE `distributionarea`
  ADD PRIMARY KEY (`Expedition_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Agency_ID` (`Agency_ID`);

--
-- Indices de la tabla `enviromentmanagement`
--
ALTER TABLE `enviromentmanagement`
  ADD PRIMARY KEY (`EM_ID`),
  ADD KEY `Quality_ID` (`Quality_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `WasteType` (`WasteType`),
  ADD KEY `Management_ID` (`Management_ID`),
  ADD KEY `WasteManager_ID` (`WasteManager_ID`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indices de la tabla `packagestypes`
--
ALTER TABLE `packagestypes`
  ADD PRIMARY KEY (`PackageType_ID`);

--
-- Indices de la tabla `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`PickUp_ID`),
  ADD KEY `AssociatedOrder_ID` (`AssociatedOrder_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`) USING BTREE,
  ADD KEY `User_ID` (`ID_User`) USING BTREE,
  ADD KEY `ID_User` (`ID_User`),
  ADD KEY `Urgently` (`Urgently`),
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `Agency_ID` (`Agency_ID`),
  ADD KEY `PreferentialTimetable` (`PreferentialTimetable`);

--
-- Indices de la tabla `preferentialtime`
--
ALTER TABLE `preferentialtime`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `quality`
--
ALTER TABLE `quality`
  ADD PRIMARY KEY (`Quality_ID`),
  ADD KEY `Return_ID` (`Return_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `Locker_ID` (`Locker_ID`),
  ADD KEY `NextTrackingStatus` (`NextTrackingStatus`),
  ADD KEY `Reason` (`Reason`);

--
-- Indices de la tabla `receptions`
--
ALTER TABLE `receptions`
  ADD PRIMARY KEY (`Reception_ID`),
  ADD KEY `PickUp_ID` (`PickUp_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Locker_ID` (`Locker_ID`),
  ADD KEY `PackageType` (`PackageType`),
  ADD KEY `NextTrackingStatus` (`NextTrackingStatus`);

--
-- Indices de la tabla `returnreasons`
--
ALTER TABLE `returnreasons`
  ADD PRIMARY KEY (`ReturnReason_ID`);

--
-- Indices de la tabla `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`Return_ID`),
  ADD KEY `Reception_ID` (`Reception_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Item` (`Item`),
  ADD KEY `NextTrackingStatus` (`NextTrackingStatus`),
  ADD KEY `Locker_ID` (`Locker_ID`);

--
-- Indices de la tabla `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`Tracking_ID`),
  ADD KEY `Reception_ID` (`Reception_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Return_ID` (`Return_ID`),
  ADD KEY `Quality_ID` (`Quality_ID`),
  ADD KEY `Locker_ID` (`Locker_ID`),
  ADD KEY `LastStatus` (`LastStatus`),
  ADD KEY `Expedition_ID` (`Expedition_ID`);

--
-- Indices de la tabla `trackingstatus`
--
ALTER TABLE `trackingstatus`
  ADD PRIMARY KEY (`Track_ID`);

--
-- Indices de la tabla `transportagencies`
--
ALTER TABLE `transportagencies`
  ADD PRIMARY KEY (`Agency_ID`);

--
-- Indices de la tabla `urgent`
--
ALTER TABLE `urgent`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indices de la tabla `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`Warehouse_ID`),
  ADD KEY `Quality_ID` (`Quality_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `NextTrackingStatus` (`NextTrackingStatus`);

--
-- Indices de la tabla `warehouseitems`
--
ALTER TABLE `warehouseitems`
  ADD PRIMARY KEY (`Item_ID`);

--
-- Indices de la tabla `wastemanagers`
--
ALTER TABLE `wastemanagers`
  ADD PRIMARY KEY (`WasteManager_ID`);

--
-- Indices de la tabla `waste_id`
--
ALTER TABLE `waste_id`
  ADD PRIMARY KEY (`WasteType_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `Customer_ID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Id_Clientes', AUTO_INCREMENT=1000038;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `Department_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Id Departamento', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `enviromentmanagement`
--
ALTER TABLE `enviromentmanagement`
  MODIFY `EM_ID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Id_GestiónMA', AUTO_INCREMENT=3456794;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `preferentialtime`
--
ALTER TABLE `preferentialtime`
  MODIFY `Id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `quality`
--
ALTER TABLE `quality`
  MODIFY `Quality_ID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Id_Control', AUTO_INCREMENT=2345682;

--
-- AUTO_INCREMENT de la tabla `receptions`
--
ALTER TABLE `receptions`
  MODIFY `Reception_ID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'No. Recepción', AUTO_INCREMENT=1234573;

--
-- AUTO_INCREMENT de la tabla `returnreasons`
--
ALTER TABLE `returnreasons`
  MODIFY `ReturnReason_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Motivos de devolución', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `returns`
--
ALTER TABLE `returns`
  MODIFY `Return_ID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'Id_Devolución', AUTO_INCREMENT=1000004;

--
-- AUTO_INCREMENT de la tabla `tracking`
--
ALTER TABLE `tracking`
  MODIFY `Tracking_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT 'Registro tracking', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `trackingstatus`
--
ALTER TABLE `trackingstatus`
  MODIFY `Track_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Estados tracking', AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Id_Usuario', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `Warehouse_ID` int(7) NOT NULL AUTO_INCREMENT COMMENT 'ID_Almacén', AUTO_INCREMENT=4567892;

--
-- AUTO_INCREMENT de la tabla `wastemanagers`
--
ALTER TABLE `wastemanagers`
  MODIFY `WasteManager_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Id_Gestor Residuos', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `waste_id`
--
ALTER TABLE `waste_id`
  MODIFY `WasteType_ID` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Ubicación almacenaje residuo', AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `distributionarea`
--
ALTER TABLE `distributionarea`
  ADD CONSTRAINT `distributionarea_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distributionarea_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `distributionarea_ibfk_4` FOREIGN KEY (`Agency_ID`) REFERENCES `transportagencies` (`Agency_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `enviromentmanagement`
--
ALTER TABLE `enviromentmanagement`
  ADD CONSTRAINT `enviromentmanagement_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enviromentmanagement_ibfk_4` FOREIGN KEY (`WasteType`) REFERENCES `waste_id` (`WasteType_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enviromentmanagement_ibfk_5` FOREIGN KEY (`WasteManager_ID`) REFERENCES `wastemanagers` (`WasteManager_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enviromentmanagement_ibfk_6` FOREIGN KEY (`Quality_ID`) REFERENCES `quality` (`Quality_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `quality`
--
ALTER TABLE `quality`
  ADD CONSTRAINT `quality_ibfk_1` FOREIGN KEY (`Return_ID`) REFERENCES `returns` (`Return_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quality_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quality_ibfk_3` FOREIGN KEY (`Item_ID`) REFERENCES `warehouseitems` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quality_ibfk_4` FOREIGN KEY (`NextTrackingStatus`) REFERENCES `trackingstatus` (`Track_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quality_ibfk_6` FOREIGN KEY (`Reason`) REFERENCES `returnreasons` (`ReturnReason_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tracking`
--
ALTER TABLE `tracking`
  ADD CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`Reception_ID`) REFERENCES `receptions` (`Reception_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracking_ibfk_3` FOREIGN KEY (`Return_ID`) REFERENCES `returns` (`Return_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracking_ibfk_4` FOREIGN KEY (`Quality_ID`) REFERENCES `quality` (`Quality_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracking_ibfk_6` FOREIGN KEY (`LastStatus`) REFERENCES `trackingstatus` (`Track_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tracking_ibfk_7` FOREIGN KEY (`Expedition_ID`) REFERENCES `distributionarea` (`Expedition_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`Quality_ID`) REFERENCES `quality` (`Quality_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_ibfk_3` FOREIGN KEY (`Item_ID`) REFERENCES `warehouseitems` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_ibfk_4` FOREIGN KEY (`NextTrackingStatus`) REFERENCES `trackingstatus` (`Track_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
