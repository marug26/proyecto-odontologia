-- migrate:up

-- =============================================
-- SEED: 10 PROCEDIMIENTOS ODONTOLÓGICOS
-- Catálogo completo con código único, nombre,
-- descripción, duración y valor
-- =============================================

INSERT INTO procedimiento (codigo, nombre, descripcion, duracion_minutos, valor) VALUES
('PROC-001', 'Limpieza dental', 'Eliminación de sarro y placa bacteriana mediante ultrasonido y pulido dental profesional', 45, 80000.00),
('PROC-002', 'Profilaxis', 'Procedimiento preventivo de limpieza profunda con instrumentos manuales y pastas abrasivas especiales', 40, 70000.00),
('PROC-003', 'Aplicación de flúor', 'Aplicación tópica de gel fluorado para fortalecer el esmalte dental y prevenir caries', 20, 35000.00),
('PROC-004', 'Calza dental', 'Restauración de cavidades menores con material de calza indirecta o directa según el caso clínico', 50, 95000.00),
('PROC-005', 'Extracción simple', 'Extracción de pieza dental con anestesia local, sin necesidad de incisión quirúrgica', 35, 120000.00),
('PROC-006', 'Extracción compleja', 'Extracción quirúrgica de pieza dental impactada o fracturada con sutura', 75, 250000.00),
('PROC-007', 'Endodoncia', 'Tratamiento de conductos radiculares para eliminar infección del nervio dental', 90, 350000.00),
('PROC-008', 'Blanqueamiento', 'Procedimiento estético de aclaramiento dental con gel de peróxido de hidrógeno de alta concentración', 60, 200000.00),
('PROC-009', 'Ortodoncia inicial', 'Evaluación y diagnóstico para tratamiento de ortodoncia, toma de modelos y radiografías', 45, 150000.00),
('PROC-010', 'Valoración odontológica', 'Evaluación completa del estado bucal con diagnóstico y plan de tratamiento', 30, 60000.00);

-- migrate:down
DELETE FROM procedimiento WHERE codigo BETWEEN 'PROC-001' AND 'PROC-010';
