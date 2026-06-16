-- migrate:up
CREATE TABLE factura (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    paciente_facturado_id UUID NOT NULL REFERENCES paciente(id),
    numero_factura VARCHAR(20) NOT NULL UNIQUE,
    fecha_emision DATE NOT NULL DEFAULT CURRENT_DATE,
    total DECIMAL(10, 2) NOT NULL DEFAULT 0,
    metodo_pago VARCHAR(20) NOT NULL CHECK (metodo_pago IN ('EFECTIVO', 'TARJETA', 'TRANSFERENCIA', 'OTRO')),
    estado_factura VARCHAR(20) NOT NULL DEFAULT 'PENDIENTE'
        CHECK (estado_factura IN ('PENDIENTE', 'PAGADO', 'CANCELADO')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_factura_paciente ON factura (paciente_facturado_id, fecha_emision);
CREATE INDEX idx_factura_estado ON factura (estado_factura);

-- migrate:down
DROP INDEX IF EXISTS idx_factura_estado;
DROP INDEX IF EXISTS idx_factura_paciente;
DROP TABLE IF EXISTS factura;