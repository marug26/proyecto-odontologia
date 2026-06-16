CREATE TABLE appointment (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    patient_id UUID NOT NULL REFERENCES patient(id),
    staff_id UUID NOT NULL REFERENCES staff(id),
    appointment_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'SCHEDULED'
        CHECK (status IN ('SCHEDULED', 'CHECKED_IN', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED', 'NO_SHOW')),
    type VARCHAR(30),
    reason TEXT,
    notes TEXT,
    created_by UUID REFERENCES staff(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_appointment_patient ON appointment (patient_id, appointment_date);
CREATE INDEX idx_appointment_staff_date ON appointment (staff_id, appointment_date);
CREATE INDEX idx_appointment_status ON appointment (status);

CREATE EXTENSION IF NOT EXISTS btree_gist;

ALTER TABLE appointment ADD CONSTRAINT no_overlap_appointments
    EXCLUDE USING gist (
        staff_id WITH =,
        tstzrange(
            appointment_date + start_time,
            appointment_date + end_time,
            '[)'
        ) WITH &&
    );
