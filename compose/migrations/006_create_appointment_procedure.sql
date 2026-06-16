CREATE TABLE appointment_procedure (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL REFERENCES appointment(id),
    procedure_id UUID NOT NULL REFERENCES procedure_catalog(id),
    tooth_number SMALLINT,
    surface VARCHAR(10),
    notes TEXT,
    fee DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_appt_proc_appointment ON appointment_procedure (appointment_id);
