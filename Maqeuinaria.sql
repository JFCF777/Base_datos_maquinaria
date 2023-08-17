-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id_alquiler` int(9) NOT NULL,
  `id_usuario` int(9) NOT NULL,
  `id_maquinaria` int(9) NOT NULL,
  `detalle` varchar(150) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `estado` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`estado`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico`
--

CREATE TABLE `historico` (
  `id_alquiler` int(9) NOT NULL,
  `nombre_maquinaria` varchar(30) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `detalle` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinaria`
--

CREATE TABLE `maquinaria` (
  `id_maquinaria` int(9) NOT NULL,
  `nombre_maquinaria` varchar(30) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `estado_maquinaria` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contrasena` varchar(15) NOT NULL,
  `estado _usuario` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id_alquiler`),
  ADD UNIQUE KEY `id_alquiler` (`id_alquiler`),
  ADD KEY `alquilermaquinaria_fk1` (`id_maquinaria`),
  ADD KEY `alquilerusuario_fk1` (`id_usuario`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`estado`);

--
-- Indices de la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD PRIMARY KEY (`id_maquinaria`),
  ADD UNIQUE KEY `id_maquinaria` (`id_maquinaria`),
  ADD KEY `maquinariaestado_fk1` (`estado_maquinaria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `id` (`id_usuario`),
  ADD KEY `usuarioestado_fk1` (`estado _usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquilermaquinaria_fk1` FOREIGN KEY (`id_maquinaria`) REFERENCES `maquinaria` (`id_maquinaria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `alquilerusuario_fk1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `maquinaria`
--
ALTER TABLE `maquinaria`
  ADD CONSTRAINT `maquinariaestado_fk1` FOREIGN KEY (`estado_maquinaria`) REFERENCES `estados` (`estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarioestado_fk1` FOREIGN KEY (`estado _usuario`) REFERENCES `estados` (`estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
