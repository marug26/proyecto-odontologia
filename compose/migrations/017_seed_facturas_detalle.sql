-- migrate:up

-- =============================================
-- SEED: FACTURAS + DETALLE_FACTURA
-- Una factura por paciente con al menos 1 cita ATENDIDA
-- El total coincide con la suma del detalle
-- =============================================

-- Crear facturas: una por paciente con al menos 1 cita ATENDIDA
INSERT INTO factura (paciente_facturado_id, numero_factura, fecha_emision, total, metodo_pago, estado_factura)
WITH pacientes_con_atendida AS (
    SELECT
        p.id AS paciente_id,
        p.identificacion,
        ROW_NUMBER() OVER (ORDER BY p.identificacion) AS rn,
        MIN(c.fecha_cita) AS primera_fecha,
        COALESCE(SUM(proc.valor), 0) AS total_paciente
    FROM paciente p
    JOIN cita c ON c.paciente_id = p.id
    LEFT JOIN procedimiento_realizado pr ON pr.cita_id = c.id
    LEFT JOIN procedimiento proc ON pr.procedimiento_id = proc.id
    WHERE c.estado_cita = 'ATENDIDA'
    GROUP BY p.id, p.identificacion
)
SELECT
    paciente_id,
    'FAC-2025-' || LPAD(rn::TEXT, 6, '0'),
    primera_fecha,
    total_paciente,
    CASE rn % 4
        WHEN 0 THEN 'EFECTIVO'
        WHEN 1 THEN 'TARJETA'
        WHEN 2 THEN 'TRANSFERENCIA'
        WHEN 3 THEN 'OTRO'
    END,
    CASE WHEN rn % 5 = 0 THEN 'PENDIENTE' ELSE 'PAGADO' END
FROM pacientes_con_atendida;

-- Crear detalle_factura: UNA FILA POR CADA procedimiento_realizado en CUALQUIER cita ATENDIDA del paciente
INSERT INTO detalle_factura (factura_id, descripcion, cantidad, valor_unitario, total)
SELECT
    f.id,
    proc.nombre,
    1,
    proc.valor,
    proc.valor
FROM factura f
JOIN cita c ON c.paciente_id = f.paciente_facturado_id AND c.estado_cita = 'ATENDIDA'
JOIN procedimiento_realizado pr ON pr.cita_id = c.id
JOIN procedimiento proc ON pr.procedimiento_id = proc.id
WHERE f.numero_factura LIKE 'FAC-2025-%';

-- migrate:down
DELETE FROM detalle_factura WHERE factura_id IN (SELECT id FROM factura WHERE numero_factura LIKE 'FAC-2025-%');
DELETE FROM factura WHERE numero_factura LIKE 'FAC-2025-%';
