-- migrate:up
CREATE TABLE procedimiento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    duracion_minutos SMALLINT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO procedimiento (codigo, nombre, duracion_minutos, valor) VALUES
    ('CON-001', 'Valoración', 30, 100.00),
    ('CON-002', 'Consulta de control', 20, 70.00),
    ('CON-003', 'Urgencia', 30, 120.00),
    ('PRE-001', 'Profilaxis (limpieza)', 45, 150.00),
    ('PRE-002', 'Aplicación de flúor', 15, 50.00),
    ('PRE-003', 'Sellante por diente', 15, 60.00),
    ('OPE-001', 'Resina compuesta 1 superficie', 40, 200.00),
    ('OPE-002', 'Resina compuesta 2 superficies', 50, 280.00),
    ('OPE-003', 'Resina compuesta 3+ superficies', 60, 350.00),
    ('OPE-004', 'Corona de acero', 60, 400.00),
    ('ENDO-001', 'Endodoncia unirradicular', 60, 500.00),
    ('ENDO-002', 'Endodoncia birradicular', 75, 650.00),
    ('ENDO-003', 'Endodoncia multirradicular', 90, 800.00),
    ('CIR-001', 'Exodoncia simple', 30, 250.00),
    ('CIR-002', 'Exodoncia quirúrgica', 60, 450.00),
    ('CIR-003', 'Cirugía de tercer molar', 60, 500.00),
    ('PERIO-001', 'Raspaje y alisado (por sextante)', 30, 180.00),
    ('PERIO-002', 'Curetaje abierto', 60, 350.00),
    ('ORT-001', 'Consulta de ortodoncia', 30, 100.00),
    ('PRO-001', 'Corona metal-cerámica', 60, 600.00),
    ('PRO-002', 'Prótesis parcial removible', 45, 1200.00),
    ('DGN-001', 'Toma de radiografía periapical', 10, 40.00),
    ('DGN-002', 'Panorámica', 15, 80.00),
    ('DGN-003', 'Modelos de estudio', 20, 100.00);

-- migrate:down
DROP TABLE IF EXISTS procedimiento;