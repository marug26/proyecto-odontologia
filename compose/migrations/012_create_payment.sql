CREATE TABLE payment (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    invoice_id UUID NOT NULL REFERENCES invoice(id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('CASH', 'CARD', 'TRANSFER', 'CHECK', 'OTHER')),
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    reference VARCHAR(100),
    notes TEXT,
    received_by UUID REFERENCES staff(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_payment_invoice ON payment (invoice_id);
CREATE INDEX idx_payment_date ON payment (payment_date);
