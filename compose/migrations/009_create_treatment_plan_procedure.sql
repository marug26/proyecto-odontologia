CREATE TABLE treatment_plan_procedure (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    treatment_plan_id UUID NOT NULL REFERENCES treatment_plan(id),
    procedure_id UUID NOT NULL REFERENCES procedure_catalog(id),
    tooth_number SMALLINT,
    surface VARCHAR(10),
    notes TEXT,
    sequence_order SMALLINT NOT NULL,
    estimated_fee DECIMAL(10, 2),
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING'
        CHECK (status IN ('PENDING', 'COMPLETED', 'SKIPPED')),
    UNIQUE (treatment_plan_id, sequence_order)
);

CREATE INDEX idx_tpp_plan ON treatment_plan_procedure (treatment_plan_id);
