-- migrate:up
CREATE TABLE cita (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    paciente_id UUID NOT NULL REFERENCES paciente(id),
    odontologo_id UUID NOT NULL REFERENCES odontologo(id),
    fecha_cita DATE NOT NULL,
    hora_cita TIME NOT NULL,
    consultorio_asignado VARCHAR(20) NOT NULL CHECK (consultorio_asignado IN ('CONSULTORIO_1', 'CONSULTORIO_2', 'CONSULTORIO_3')),
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'PROGRAMADA'
        CHECK (estado_cita IN ('PROGRAMADA', 'ATENDIDA', 'CANCELADA', 'NO_ASISTIO')),
    motivo_consulta VARCHAR(255) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_cita_paciente ON cita (paciente_id, fecha_cita);
CREATE INDEX idx_cita_odontologo_fecha ON cita (odontologo_id, fecha_cita);
CREATE INDEX idx_cita_estado ON cita (estado_cita);

-- migrate:down
DROP INDEX IF EXISTS idx_cita_estado;
DROP INDEX IF EXISTS idx_cita_odontologo_fecha;
DROP INDEX IF EXISTS idx_cita_paciente;
DROP TABLE IF EXISTS cita;
