-- migrate:up
CREATE TABLE empleado (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombres VARCHAR(150) NOT NULL,
    apellidos VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    rol VARCHAR(20) NOT NULL CHECK (rol IN ('ADMINISTRADOR', 'ODONTOLOGO', 'RECEPCIONISTA')),
    active BOOLEAN NOT NULL DEFAULT true,
    google_sub VARCHAR(255) UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO empleado (nombres, apellidos, email, identificacion, rol)
VALUES ('Administrador', 'Sistema', 'admin@gmail.com', '0000000000', 'ADMINISTRADOR');

-- migrate:down
DROP TABLE IF EXISTS empleado;
