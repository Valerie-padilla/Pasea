CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `numDireccion` int(11) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `estatus` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cotizaciones` (
  `numCotizacion` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `estado` text NOT NULL,
  `revisado` text NOT NULL,
  `ordenCompra` int(11) NOT NULL,
  `docOrdenCompra` varchar(100) NOT NULL,
  `tiempo` int(11) NOT NULL,
  `trabajadores` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `materiales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descrpcion` varchar(250) NOT NULL,
  `medida` varchar(40) NOT NULL,
  `precioU` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `comprado` tinyint(1) NOT NULL,
  `cotizacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `proyectos` (
  `id` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `cometarios` text NOT NULL,
  `estatus` text NOT NULL,
  `ordenProyecto` int(11) NOT NULL,
  `estatusCob` varchar(40) NOT NULL,
  `fechaEntreg` date NOT NULL,
  `fechaPago` date NOT NULL,
  `totalPagar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `trabajadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estatus` varchar(20) DEFAULT 'activo',
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp(),
  `proyectoAsg` int(11) DEFAULT NULL,
  `apellido2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
