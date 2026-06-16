CREATE TABLE clinical_note (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    appointment_id UUID NOT NULL UNIQUE REFERENCES appointment(id),
    patient_id UUID NOT NULL REFERENCES patient(id),
    subjective TEXT,
    objective TEXT,
    assessment TEXT,
    plan TEXT,
    created_by UUID REFERENCES staff(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_clinical_note_patient ON clinical_note (patient_id, created_at DESC);
