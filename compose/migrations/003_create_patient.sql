CREATE TABLE patient (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    birth_date DATE,
    gender VARCHAR(20),
    cpf VARCHAR(11) UNIQUE,
    address_street VARCHAR(255),
    address_number VARCHAR(20),
    address_complement VARCHAR(100),
    address_neighborhood VARCHAR(100),
    address_city VARCHAR(100),
    address_state VARCHAR(50),
    address_zip VARCHAR(10),
    emergency_contact_name VARCHAR(150),
    emergency_contact_phone VARCHAR(20),
    responsible_person VARCHAR(150),
    medical_history JSONB NOT NULL DEFAULT '{}',
    medications TEXT,
    allergies TEXT,
    odontogram JSONB NOT NULL DEFAULT '{}',
    notes TEXT,
    active BOOLEAN NOT NULL DEFAULT true,
    created_by UUID REFERENCES staff(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_patient_name ON patient USING gin (to_tsvector('spanish', name));
CREATE INDEX idx_patient_phone ON patient (phone);
CREATE INDEX idx_patient_active ON patient (active);
