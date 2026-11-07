SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

INSERT INTO `clientes` (`id`, `nombre`, `telefono`, `email`, `direccion`, `numDireccion`, `colonia`, `rfc`, `fechaRegistro`, `estatus`) VALUES
(1, 'Equipo de Desarrollo PAESA', '6181112233', 'contacto@paesa.com.mx', 'Cualquiera', 3, 'Super', 'IAI081012HG4', '2026-11-03', 'activo'),
(2, 'Arauco Industrial Durango', '6181115566', 'compras@arauco.com', '6 de Enero', 512, 'Constitución', 'ABC010101ABC', '2026-10-30', 'activo'),
(3, 'Constructora Guadiana S.A. de C.V.', '6188123456', 'licitaciones@guadiana.com.mx', 'Blvd. Felipe Pescador', 1200, 'Centro', 'CGU980415A23', '2026-08-15', 'activo'),
(4, 'Minera San Luis Pelayo', '6188259012', 'proveedores@minerasanluis.com', 'Av. 20 de Noviembre', 804, 'Zona Centro', 'MSL8509199K2', '2026-09-01', 'activo'),
(5, 'Metalúrgica del Norte', '6181304455', 'compras@metalurgicanorte.com', 'Zona Industrial', 14, 'Ciudad Industrial', 'MNO120304RL8', '2026-07-20', 'inactivo'),
(6, 'Hotel Gobernador Durango', '6188118500', 'mantenimiento@hotelgobernador.com', 'Av. 20 de Noviembre Pte.', 257, 'Centro Histórico', 'HGO7502108T5', '2026-09-12', 'activo'),
(7, 'Restaurantes y Banquetes Durango', '6181298877', 'administracion@banquetesdgo.com', 'Calle Constitución Sur', 402, 'Analco', 'RBD190522PQ1', '2026-10-05', 'activo'),
(8, 'Grupo Agropecuario La Laguna', '6188331122', 'insumos@agrolaguna.com.mx', 'Carretera a Torreón Km 8.5', 850, 'Ejido Lerdo', 'GAL1511303M9', '2026-10-18', 'activo'),
(9, 'Comercializadora de Acero del Centro', '6188176655', 'ventas@acerosdelcentro.com', 'Av. De los Insurgentes', 305, 'Los Ángeles', 'CAC0506187U4', '2026-10-25', 'activo'),
(10, 'Inmobiliaria Nueva Era', '6188409988', 'proyectos@nuevaerainmo.com', 'Calle Victoria Norte', 112, 'Hidalgo', 'INE2101158A1', '2026-11-04', 'activo'); -- Caso Límite: Cliente nuevo sin cotizaciones

INSERT INTO `cotizaciones` (`numCotizacion`, `total`, `estado`, `revisado`, `ordenCompra`, `docOrdenCompra`, `tiempo`, `trabajadores`, `id_cliente`, `descripcion`) VALUES
(1, 20000.00, 'en revision', 'Eduardo Trujillo Soto', 202203, 'compro_01.pdf', 40, 3, 1, 'Portón industrial de acero metálico con automatización'),
(2, 4000.00, 'aprobado', 'Erick Trujillo Soto', 304224, 'araucoProyecto.pdf', 15, 4, 2, 'Bancas y mesas metálicas de cafetería en la planta Arauco'),
(3, 35000.00, 'aprobado', 'Eduardo Trujillo Soto', 401122, 'oc_guadiana_35k.pdf', 60, 5, 3, 'Estructura metálica pesada para nave industrial módulo B'),
(4, 18500.00, 'aprobado', 'Erick Trujillo Soto', 502233, 'oc_minera_18k.pdf', 25, 3, 4, 'Barandales y pasamanos de seguridad en acero inoxidable'),
(5, 12000.00, 'rechazado', 'Eduardo Trujillo Soto', 0, 'sin_doc.pdf', 10, 2, 5, 'Mantenimiento y pintura anticorrosiva de racks de almacenaje'),
(6, 8500.00, 'aprobado', 'Erick Trujillo Soto', 603344, 'oc_hotel_8k.pdf', 12, 2, 6, 'Reparación de pérgola de aluminio y acero en área de alberca'),
(7, 15000.00, 'en revision', 'Eduardo Trujillo Soto', 704455, 'oc_banquetes_pending.pdf', 20, 3, 7, 'Mobiliario de cocina industrial en acero inoxidable cal. 16'),
(8, 45000.00, 'aprobado', 'Erick Trujillo Soto', 805566, 'oc_agrolaguna_45k.pdf', 90, 6, 8, 'Techo de lámina galvanizada y armaduras para bodega de granos'),
(9, 6200.00, 'aprobado', 'Eduardo Trujillo Soto', 906677, 'oc_comercializadora.pdf', 8, 2, 9, 'Estantería de alta resistencia para almacén de carga pesada'),
(10, 28000.00, 'en revision', 'Pendiente de Revisión', 0, 'cotizacion_borrador_10.pdf', 30, 4, 1, 'Techumbre para estacionamiento de flotilla vehicular');


INSERT INTO `materiales` (`id`, `nombre`, `descrpcion`, `medida`, `precioU`, `cantidad`, `comprado`, `cotizacion`) VALUES
(1, 'Tubo cuadrado de acero', 'Tubo cuadrado de acero 1" x 1" cal. 14', 'metro', 120.00, 25, 1, 2),
(2, 'Lámina de acero', 'Lámina de acero cal. 18 rolada en frío', 'hoja', 950.00, 2, 1, 2),
(3, 'Tornillo hexagonal', 'Tornillo de acero galvanizado 1/4" x 2"', 'pieza', 4.00, 40, 1, 2),
(4, 'Tuerca de seguridad', 'Tuerca con inserto de nylon 1/4"', 'pieza', 2.00, 40, 1, 2),
(5, 'Electrodo para soldar', 'Electrodo E6013 1/8" para soldadura general', 'caja', 180.00, 1, 1, 2),
(6, 'Viga IPR 6" x 4"', 'Viga estructural IPR de acero A36', 'tramo 6m', 2850.00, 6, 1, 3),
(7, 'Placa de acero 1/2"', 'Placa comercial de acero A36 4x8 pies', 'hoja', 3400.00, 3, 1, 3),
(8, 'Tubo redondo inoxidable', 'Tubo de acero inoxidable AISI 304 1.5"', 'metro', 310.00, 18, 1, 4),
(9, 'Lámina galvanizada C22', 'Lámina zintro alum acanalada R-101', 'hoja', 620.00, 35, 0, 8),
(10, 'Pintura esmalte anticorrosivo', 'Esmalte alquidálico secado rápido color gris', 'cubeta 19L', 1450.00, 2, 0, 1);

INSERT INTO `proyectos` (`id`, `fechaInicio`, `fechaFinal`, `cometarios`, `estatus`, `ordenProyecto`, `estatusCob`, `fechaEntreg`, `fechaPago`, `totalPagar`) VALUES
(1, '2026-11-01', '2026-11-30', 'Proyecto de portón principal en fase de soldadura y ensamble', 'en proceso', 1, 'pendiente de pago', '2026-11-28', '2026-11-30', 20000.00),
(2, '2026-11-05', '2026-11-18', 'Proyecto de mesa para comedor en Arauco a punto de ser terminado', 'en proceso', 2, 'pendiente de pago', '2026-11-16', '2026-11-20', 4000.00),
(3, '2026-11-05', '2026-11-20', 'Instalación de bancas auxiliares sin inconvenientes reportados', 'en proceso', 2, 'pendiente de pago', '2026-11-19', '2026-11-22', 4000.00),
(4, '2026-09-01', '2026-10-15', 'Fabricación de estructura industrial entregada conforme a especificaciones', 'finalizado', 3, 'pagado', '2026-10-15', '2026-10-25', 35000.00),
(5, '2026-09-10', '2026-10-02', 'Pasamanos para minera instalados y recibidos por el departamento de SST', 'finalizado', 4, 'pagado', '2026-10-02', '2026-10-10', 18500.00),
(6, '2026-10-01', '2026-10-12', 'Mantenimiento de pérgola de hotel concluido a satisfacción', 'finalizado', 6, 'pagado', '2026-10-12', '2026-10-18', 8500.00),
(7, '2026-10-15', '2026-11-10', 'Estructura de techo en bodega agrolaguna en fase final de montaje', 'en proceso', 8, 'anticipo pagado', '2026-11-12', '2026-10-14', 45000.00),
(8, '2026-10-20', '2026-10-28', 'Estantería metálica instalada en almacén central', 'finalizado', 9, 'pagado', '2026-10-28', '2026-11-02', 6200.00),
(9, '2026-11-02', '2026-11-22', 'Mobiliario de acero inox para cocina en etapa de pulido y control de calidad', 'en proceso', 7, 'pendiente de pago', '2026-11-20', '2026-11-25', 15000.00),
(10, '2026-10-05', '2026-10-07', 'Proyecto cancelado por el cliente por cambio en presupuesto interno', 'cancelado', 5, 'sin cobro', '2026-10-07', '2026-10-07', 0.00);

INSERT INTO `trabajadores` (`id`, `nombre`, `apellido1`, `apellido2`, `username`, `password`, `puesto`, `telefono`, `email`, `estatus`, `fechaRegistro`, `proyectoAsg`) VALUES
(1, 'Eduardo', 'Trujillo', 'Soto', 'eduartrus', '$2y$10$e84.g.Hj9N.3yX3vQzK1eO7d/6Zp1q.x9Y2W10mG2K1P9L8M7N6O5', 'supervisor sistemas', '6182702252', 'eduardotrujillosoto@gmail.com', 'activo', '2026-11-04 00:51:33', 1),
(2, 'Erick', 'Trujillo', 'Soto', 'ericktrus', '$2y$10$f95.h.Ik0O.4zY4wRAL2fP8e/7Aq2r.y0Z3X11nH3L2Q0M9N8O7P6', 'supervisor sistemas', '6182222222', 'ericktrujillo2007@gmail.com', 'activo', '2026-11-06 01:37:49', 2),
(3, 'Carlos', 'Mendoza', 'Hernández', 'cmendoza', '$2y$10$a12.b.Cd3E.1uV1tOXI9cM5b/4Xn9o.v7W0T88kE0I9N6K7L8M9N0', 'herrero especialista', '6181239876', 'carlos.mendoza@paesa.com.mx', 'activo', '2026-08-01 09:00:00', 3),
(4, 'José Luis', 'Ramírez', 'Gómez', 'jlramirez', '$2y$10$b23.c.De4F.2wW2uPYJ0dN6c/5Yo0p.w8X1U99lF1J0O7L8M9N0O1', 'soldador certificado', '6182348765', 'jl.ramirez@paesa.com.mx', 'activo', '2026-08-15 10:30:00', 3),
(5, 'Roberto', 'García', 'Valenzuela', 'rgarcia', '$2y$10$c34.d.Ef5G.3xX3vQZK1eO7d/6Zp1q.x9Y2V00mG2K1P8M9N0O1P2', 'armador industrial', '6183457654', 'roberto.garcia@paesa.com.mx', 'activo', '2026-09-01 08:15:00', 4),
(6, 'Miguel Ángel', 'Torres', 'López', 'mtorres', '$2y$10$d45.e.Fg6H.4yY4wRAL2fP8e/7Aq2r.y0Z3W11nH3L2Q9N0O1P2Q3', 'pintor industrial', '6184566543', 'miguel.torres@paesa.com.mx', 'activo', '2026-09-10 11:20:00', 6),
(7, 'Fernando', 'Sánchez', 'Castro', 'fsanchez', '$2y$10$e56.f.Gh7I.5zZ5xSBM3gQ9f/8Br3s.z1A4X22oI4M3R0O1P2Q3R4', 'soldador argonero', '6185675432', 'fernando.sanchez@paesa.com.mx', 'activo', '2026-09-20 14:00:00', 7),
(8, 'Alejandro', 'Vargas', 'Ríos', 'avargas', '$2y$10$f67.g.Hi8J.6aA6yTCN4hR0g/9Cs4t.a2B5Y33pJ5N4S1P2Q3R4S5', 'tornero / fresador', '6186784321', 'alejandro.vargas@paesa.com.mx', 'activo', '2026-10-01 08:00:00', 8),
(9, 'Daniel', 'Morales', 'Ibarra', 'dmorales', '$2y$10$g78.h.Ij9K.7bB7zUDO5iS1h/0Dt5u.b3C6Z44qK6O5T2Q3R4S5T6', 'auxiliar de taller', '6187893210', 'daniel.morales@paesa.com.mx', 'activo', '2026-10-15 12:45:00', 9),
(10, 'Manuel', 'González', 'Reyes', 'mgonzalez', '$2y$10$h89.i.Jk0L.8cC8aVEP6jT2i/1Eu6v.c4D7A55rL7P6U3R4S5T6U7', 'auxiliar general (disponible)', '6188902109', 'manuel.gonzalez@paesa.com.mx', 'inactivo', '2026-06-01 07:30:00', NULL);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`numCotizacion`),
  ADD KEY `fk_cotizaciones_clientes` (`id_cliente`);

ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_materiales_cotizaciones` (`cotizacion`);

ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proyectos_ordenproyecto` (`ordenProyecto`);

ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_trabajadores_cotizaciones` (`proyectoAsg`);

ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `materiales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `trabajadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `fk_cotizaciones_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

ALTER TABLE `materiales`
  ADD CONSTRAINT `fk_materiales_cotizaciones` FOREIGN KEY (`cotizacion`) REFERENCES `cotizaciones` (`numCotizacion`);

ALTER TABLE `proyectos`
  ADD CONSTRAINT `fk_proyectos_ordenproyecto` FOREIGN KEY (`ordenProyecto`) REFERENCES `cotizaciones` (`numCotizacion`);

ALTER TABLE `trabajadores`
  ADD CONSTRAINT `fk_trabajadores_cotizaciones` FOREIGN KEY (`proyectoAsg`) REFERENCES `cotizaciones` (`numCotizacion`);
COMMIT;
