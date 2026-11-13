-- =============================================================================
-- ACTIVIDAD A09: SCRIPT DE CONSULTAS DE NEGOCIO (03_consultas.sql)
-- Base de Datos: paesabd
-- =============================================================================

USE `paesabd`;

-- -----------------------------------------------------------------------------
-- Q1: JOIN de 3 tablas
-- Caso de Uso: CU-04 Consultar Detalle de Materiales por Cotización y Cliente
-- Descripción: Muestra el nombre del cliente, la descripción de su cotización
--              y el detalle de los materiales requeridos con su subtotal.
-- -----------------------------------------------------------------------------
SELECT 
    cl.nombre AS cliente,
    c.numCotizacion,
    c.descripcion AS cotizacion,
    m.nombre AS material,
    m.cantidad,
    m.medida,
    m.precioU AS precio_unitario,
    (m.cantidad * m.precioU) AS subtotal_material
FROM materiales m
JOIN cotizaciones c ON m.cotizacion = c.numCotizacion
JOIN clientes cl ON c.id_cliente = cl.id;


-- -----------------------------------------------------------------------------
-- Q2: GROUP BY con HAVING
-- Caso de Uso: CU-05 Reporte de Cotizaciones con Alto Costo en Materiales
-- Descripción: Agrupa los materiales por cotización para obtener la cantidad total 
--              de insumos y el costo acumulado, filtrando solo aquellas cotizaciones
--              cuyo gasto total en materiales supere los $1,000 MXN.
-- -----------------------------------------------------------------------------
SELECT 
    c.numCotizacion,
    c.descripcion AS cotizacion,
    COUNT(m.id) AS total_tipos_material,
    SUM(m.cantidad * m.precioU) AS costo_total_materiales
FROM cotizaciones c
JOIN materiales m ON c.numCotizacion = m.cotizacion
GROUP BY c.numCotizacion, c.descripcion
HAVING SUM(m.cantidad * m.precioU) > 1000
ORDER BY costo_total_materiales DESC;


-- -----------------------------------------------------------------------------
-- Q3: Subconsulta
-- Caso de Uso: CU-03 Identificar Cotizaciones de Alto Valor
-- Descripción: Obtiene las cotizaciones cuyo monto total sea superior al promedio 
--              general de todas las cotizaciones registradas en la empresa.
-- -----------------------------------------------------------------------------
SELECT 
    c.numCotizacion,
    cl.nombre AS cliente,
    c.descripcion,
    c.total,
    c.estado
FROM cotizaciones c
JOIN clientes cl ON c.id_cliente = cl.id
WHERE c.total > (
    SELECT AVG(total) 
    FROM cotizaciones
);


-- -----------------------------------------------------------------------------
-- Q4: Vista (CREATE VIEW)
-- Caso de Uso: CU-06 Panel de Monitoreo de Proyectos en Proceso y Personal Asignado
-- Descripción: Crea una vista reutilizable que une proyectos en proceso, 
--              sus cotizaciones de origen y el personal encargado del proyecto.
-- -----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_proyectos_en_proceso AS
SELECT 
    p.id AS id_proyecto,
    c.numCotizacion,
    c.descripcion AS descripcion_trabajo,
    p.estatus AS estatus_proyecto,
    p.totalPagar,
    CONCAT(t.nombre, ' ', t.apellido1, ' ', t.apellido2) AS trabajador_asignado,
    t.puesto
FROM proyectos p
JOIN cotizaciones c ON p.ordenProyecto = c.numCotizacion
JOIN trabajadores t ON t.proyectoAsg = c.numCotizacion
WHERE p.estatus = 'en proceso';


SELECT * FROM v_proyectos_en_proceso;


-- -----------------------------------------------------------------------------
-- Q5: Consulta Complementaria (Relación Clientes - Cotizaciones en Revisión)
-- Caso de Uso: CU-01 Consultar Cotizaciones Pendientes de Aprobación por Cliente
-- Descripción: Consulta las cotizaciones que se encuentran en estado 'en revision',
--              mostrando los datos de contacto del cliente para seguimiento.
-- -----------------------------------------------------------------------------
SELECT 
    cl.id AS id_cliente,
    cl.nombre AS cliente,
    cl.telefono,
    cl.email,
    c.numCotizacion,
    c.total,
    c.revisado AS revisado_por
FROM clientes cl
JOIN cotizaciones c ON cl.id = c.id_cliente
WHERE cl.estatus = 'activo' 
  AND c.estado = 'en revision';