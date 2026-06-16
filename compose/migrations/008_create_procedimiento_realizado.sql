-- migrate:up
CREATE TABLE procedimiento_realizado (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cita_id UUID NOT NULL REFERENCES cita(id),
    procedimiento_id UUID NOT NULL REFERENCES procedimiento(id),
    diente_numero SMALLINT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_procedimiento_realizado_cita ON procedimiento_realizado (cita_id);

-- migrate:down
DROP INDEX IF EXISTS idx_procedimiento_realizado_cita;
DROP TABLE IF EXISTS procedimiento_realizado;