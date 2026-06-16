CREATE TABLE staff (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    google_sub VARCHAR(255) UNIQUE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('ADMIN', 'DENTIST', 'RECEPTIONIST')),
    specialization VARCHAR(100),
    phone VARCHAR(20),
    active BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO staff (id, name, email, role)
VALUES (gen_random_uuid(), 'Administrador', 'admin@clinicadental.com', 'ADMIN');
