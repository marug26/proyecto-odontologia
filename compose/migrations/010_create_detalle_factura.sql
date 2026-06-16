-- migrate:up
CREATE TABLE detalle_factura (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    factura_id UUID NOT NULL REFERENCES factura(id),
    descripcion VARCHAR(300) NOT NULL,
    cantidad SMALLINT NOT NULL DEFAULT 1,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_detalle_factura_factura ON detalle_factura (factura_id);

-- migrate:down
DROP INDEX IF EXISTS idx_detalle_factura_factura;
DROP TABLE IF EXISTS detalle_factura;
