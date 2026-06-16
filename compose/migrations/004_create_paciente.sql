-- migrate:up
CREATE TABLE paciente (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombres VARCHAR(150) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(255),
    tipo_paciente VARCHAR(20) NOT NULL CHECK (tipo_paciente IN ('ESTUDIANTE', 'DOCENTE', 'EXTERNO')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_paciente_nombres ON paciente USING gin (to_tsvector('spanish', nombres));
CREATE INDEX idx_paciente_identificacion ON paciente (identificacion);

-- migrate:down
DROP TABLE IF EXISTS paciente;
