-- migrate:up

-- =============================================
-- SEED: 100 CITAS + PROCEDIMIENTOS REALIZADOS
-- Distribución: 5 odontólogos × 20 citas cada uno
-- Estados: 70 ATENDIDA, 15 PROGRAMADA, 10 CANCELADA, 5 NO_ASISTIO
-- =============================================

-- ---- DR. ALEJANDRO VARGAS (Odontología General, 20 citas) ----
INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-15', '11:00', 'CONSULTORIO_1', 'ATENDIDA', 'Exodoncia simple de molar'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304001' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-11-05', '15:00', 'CONSULTORIO_1', 'ATENDIDA', 'Sensibilidad dental al frío'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304002' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-15', '15:00', 'CONSULTORIO_3', 'CANCELADA', 'Paciente solicita reprogramación'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304003' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-10', '11:00', 'CONSULTORIO_3', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304004' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-15', '08:00', 'CONSULTORIO_2', 'ATENDIDA', 'Dolor persistente en zona molar'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304005' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-15', '15:00', 'CONSULTORIO_2', 'ATENDIDA', 'Control post-tratamiento de conducto'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304006' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-05', '14:00', 'CONSULTORIO_2', 'ATENDIDA', 'Endodoncia unirradicular'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304007' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-20', '09:00', 'CONSULTORIO_2', 'PROGRAMADA', 'Cita de control ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304008' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-09-25', '10:00', 'CONSULTORIO_3', 'ATENDIDA', 'Limpieza y pulido dental'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304009' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-20', '16:00', 'CONSULTORIO_3', 'PROGRAMADA', 'Cita de control ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '10203040010' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-20', '16:00', 'CONSULTORIO_2', 'PROGRAMADA', 'Control mensual de ortodoncia'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304001' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-15', '09:00', 'CONSULTORIO_2', 'ATENDIDA', 'Ajuste de aparato ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304002' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-25', '09:00', 'CONSULTORIO_3', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304003' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-15', '11:00', 'CONSULTORIO_3', 'ATENDIDA', 'Endodoncia unirradicular'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304004' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-09-10', '11:00', 'CONSULTORIO_2', 'PROGRAMADA', 'Limpieza dental de control'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304005' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-10', '14:00', 'CONSULTORIO_1', 'ATENDIDA', 'Exodoncia simple de molar'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304006' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-20', '14:00', 'CONSULTORIO_3', 'ATENDIDA', 'Revisión general y limpieza dental'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304007' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-15', '16:00', 'CONSULTORIO_3', 'CANCELADA', 'Paciente canceló por compromiso laboral'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304008' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-03-25', '11:00', 'CONSULTORIO_1', 'PROGRAMADA', 'Seguimiento de tratamiento'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304009' AND o.registro_profesional = 1001;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-10', '11:00', 'CONSULTORIO_2', 'ATENDIDA', 'Blanqueamiento dental'
FROM paciente p, odontologo o WHERE p.identificacion = '10203040010' AND o.registro_profesional = 1001;

-- ---- DRA. ISABELLA MONTOYA (Ortodoncia, 20 citas) ----
INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-10', '08:00', 'CONSULTORIO_3', 'ATENDIDA', 'Inflamación en encía superior'
FROM paciente p, odontologo o WHERE p.identificacion = '80123456' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-05', '10:00', 'CONSULTORIO_2', 'ATENDIDA', 'Control de tratamiento periodontal'
FROM paciente p, odontologo o WHERE p.identificacion = '80123457' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-25', '16:00', 'CONSULTORIO_3', 'ATENDIDA', 'Fractura dental por trauma'
FROM paciente p, odontologo o WHERE p.identificacion = '80123458' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-25', '09:00', 'CONSULTORIO_3', 'NO_ASISTIO', 'Paciente no asistió sin aviso previo'
FROM paciente p, odontologo o WHERE p.identificacion = '80123459' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-10', '10:00', 'CONSULTORIO_3', 'PROGRAMADA', 'Valoración para blanqueamiento'
FROM paciente p, odontologo o WHERE p.identificacion = '80123460' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-11-20', '09:00', 'CONSULTORIO_1', 'ATENDIDA', 'Sangrado de encías al cepillarse'
FROM paciente p, odontologo o WHERE p.identificacion = '80123461' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-09-25', '11:00', 'CONSULTORIO_3', 'PROGRAMADA', 'Seguimiento de tratamiento'
FROM paciente p, odontologo o WHERE p.identificacion = '80123462' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-05', '10:00', 'CONSULTORIO_1', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '80123463' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-15', '16:00', 'CONSULTORIO_1', 'CANCELADA', 'Cancelación por enfermedad del paciente'
FROM paciente p, odontologo o WHERE p.identificacion = '80123464' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-01-25', '10:00', 'CONSULTORIO_2', 'ATENDIDA', 'Exodoncia simple de molar'
FROM paciente p, odontologo o WHERE p.identificacion = '80123465' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-05', '08:00', 'CONSULTORIO_1', 'ATENDIDA', 'Evaluación para extracción'
FROM paciente p, odontologo o WHERE p.identificacion = '80123456' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-25', '16:00', 'CONSULTORIO_3', 'ATENDIDA', 'Caries en molar inferior'
FROM paciente p, odontologo o WHERE p.identificacion = '80123457' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-25', '15:00', 'CONSULTORIO_1', 'ATENDIDA', 'Revisión de elásticos ortodónticos'
FROM paciente p, odontologo o WHERE p.identificacion = '80123458' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-15', '15:00', 'CONSULTORIO_3', 'ATENDIDA', 'Endodoncia unirradicular'
FROM paciente p, odontologo o WHERE p.identificacion = '80123459' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-25', '11:00', 'CONSULTORIO_1', 'PROGRAMADA', 'Valoración para blanqueamiento'
FROM paciente p, odontologo o WHERE p.identificacion = '80123460' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-01-15', '10:00', 'CONSULTORIO_1', 'ATENDIDA', 'Evaluación para extracción'
FROM paciente p, odontologo o WHERE p.identificacion = '80123461' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-03-25', '08:00', 'CONSULTORIO_2', 'NO_ASISTIO', 'Paciente no se presentó a la cita'
FROM paciente p, odontologo o WHERE p.identificacion = '80123462' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-01-20', '08:00', 'CONSULTORIO_1', 'ATENDIDA', 'Sensibilidad dental al frío'
FROM paciente p, odontologo o WHERE p.identificacion = '80123463' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-25', '10:00', 'CONSULTORIO_1', 'CANCELADA', 'Paciente canceló por compromiso laboral'
FROM paciente p, odontologo o WHERE p.identificacion = '80123464' AND o.registro_profesional = 1002;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-10', '10:00', 'CONSULTORIO_1', 'ATENDIDA', 'Ajuste de aparato ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '80123465' AND o.registro_profesional = 1002;

-- ---- DR. CARLOS RESTREPO (Endodoncia, 20 citas) ----
INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-10', '08:00', 'CONSULTORIO_1', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '90123456' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-01-25', '16:00', 'CONSULTORIO_2', 'ATENDIDA', 'Blanqueamiento dental'
FROM paciente p, odontologo o WHERE p.identificacion = '90123457' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-10', '15:00', 'CONSULTORIO_2', 'ATENDIDA', 'Evaluación para extracción'
FROM paciente p, odontologo o WHERE p.identificacion = '90123458' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-05', '14:00', 'CONSULTORIO_3', 'ATENDIDA', 'Control de brackets - ajuste mensual'
FROM paciente p, odontologo o WHERE p.identificacion = '90123459' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-20', '10:00', 'CONSULTORIO_1', 'ATENDIDA', 'Revisión general y limpieza dental'
FROM paciente p, odontologo o WHERE p.identificacion = '90123460' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-15', '15:00', 'CONSULTORIO_1', 'ATENDIDA', 'Dolor persistente en zona molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123461' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-03-05', '09:00', 'CONSULTORIO_2', 'ATENDIDA', 'Exodoncia simple de molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123462' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-05', '11:00', 'CONSULTORIO_3', 'ATENDIDA', 'Control de tratamiento periodontal'
FROM paciente p, odontologo o WHERE p.identificacion = '90123463' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-05', '11:00', 'CONSULTORIO_1', 'ATENDIDA', 'Control post-tratamiento de conducto'
FROM paciente p, odontologo o WHERE p.identificacion = '90123464' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-10', '14:00', 'CONSULTORIO_3', 'ATENDIDA', 'Exodoncia simple de molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123465' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-20', '14:00', 'CONSULTORIO_3', 'NO_ASISTIO', 'Paciente no asistió sin aviso previo'
FROM paciente p, odontologo o WHERE p.identificacion = '90123456' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-05', '08:00', 'CONSULTORIO_1', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '90123457' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-25', '11:00', 'CONSULTORIO_3', 'ATENDIDA', 'Dolor persistente en zona molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123458' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-25', '09:00', 'CONSULTORIO_3', 'ATENDIDA', 'Control post-tratamiento de conducto'
FROM paciente p, odontologo o WHERE p.identificacion = '90123459' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-01-15', '11:00', 'CONSULTORIO_2', 'ATENDIDA', 'Dolor persistente en zona molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123460' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-25', '08:00', 'CONSULTORIO_2', 'ATENDIDA', 'Endodoncia unirradicular'
FROM paciente p, odontologo o WHERE p.identificacion = '90123461' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-15', '15:00', 'CONSULTORIO_1', 'ATENDIDA', 'Aplicación de flúor preventiva'
FROM paciente p, odontologo o WHERE p.identificacion = '90123462' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-03-25', '10:00', 'CONSULTORIO_1', 'ATENDIDA', 'Aplicación de flúor preventiva'
FROM paciente p, odontologo o WHERE p.identificacion = '90123463' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-03-20', '16:00', 'CONSULTORIO_2', 'ATENDIDA', 'Blanqueamiento dental'
FROM paciente p, odontologo o WHERE p.identificacion = '90123464' AND o.registro_profesional = 1003;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-25', '14:00', 'CONSULTORIO_2', 'ATENDIDA', 'Fractura dental por trauma'
FROM paciente p, odontologo o WHERE p.identificacion = '90123465' AND o.registro_profesional = 1003;

-- ---- DRA. MARÍA OSPINA (Periodoncia, 20 citas) ----
INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-25', '16:00', 'CONSULTORIO_2', 'ATENDIDA', 'Dolor de muelas desde hace una semana'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304001' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-09-20', '09:00', 'CONSULTORIO_3', 'ATENDIDA', 'Sensibilidad dental al frío'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304002' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-25', '08:00', 'CONSULTORIO_1', 'ATENDIDA', 'Inflamación en encía superior'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304003' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-03-15', '11:00', 'CONSULTORIO_1', 'ATENDIDA', 'Control de brackets - ajuste mensual'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304004' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-05', '09:00', 'CONSULTORIO_1', 'PROGRAMADA', 'Control mensual de ortodoncia'
FROM paciente p, odontologo o WHERE p.identificacion = '90123456' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-25', '09:00', 'CONSULTORIO_3', 'ATENDIDA', 'Control de brackets - ajuste mensual'
FROM paciente p, odontologo o WHERE p.identificacion = '90123457' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-15', '09:00', 'CONSULTORIO_1', 'PROGRAMADA', 'Limpieza dental de control'
FROM paciente p, odontologo o WHERE p.identificacion = '90123458' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-25', '16:00', 'CONSULTORIO_1', 'ATENDIDA', 'Fractura dental por trauma'
FROM paciente p, odontologo o WHERE p.identificacion = '80123456' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-09-05', '15:00', 'CONSULTORIO_3', 'CANCELADA', 'Cancelación por enfermedad del paciente'
FROM paciente p, odontologo o WHERE p.identificacion = '80123457' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-15', '14:00', 'CONSULTORIO_1', 'ATENDIDA', 'Ajuste de aparato ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '80123458' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-05', '14:00', 'CONSULTORIO_3', 'ATENDIDA', 'Fractura dental por trauma'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304001' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-05', '11:00', 'CONSULTORIO_2', 'NO_ASISTIO', 'Paciente no se presentó a la cita'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304002' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-20', '08:00', 'CONSULTORIO_2', 'ATENDIDA', 'Control de tratamiento periodontal'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304003' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-15', '14:00', 'CONSULTORIO_3', 'CANCELADA', 'Paciente solicita reprogramación'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304004' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-05', '15:00', 'CONSULTORIO_1', 'ATENDIDA', 'Dolor persistente en zona molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123456' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-11-05', '14:00', 'CONSULTORIO_3', 'CANCELADA', 'Cancelación por enfermedad del paciente'
FROM paciente p, odontologo o WHERE p.identificacion = '90123457' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-11-25', '10:00', 'CONSULTORIO_2', 'ATENDIDA', 'Sangrado de encías al cepillarse'
FROM paciente p, odontologo o WHERE p.identificacion = '90123458' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-08-05', '14:00', 'CONSULTORIO_3', 'PROGRAMADA', 'Control mensual de ortodoncia'
FROM paciente p, odontologo o WHERE p.identificacion = '80123456' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-05', '09:00', 'CONSULTORIO_2', 'PROGRAMADA', 'Cita de control ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '80123457' AND o.registro_profesional = 1004;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-01-15', '08:00', 'CONSULTORIO_1', 'PROGRAMADA', 'Cita de control ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '80123458' AND o.registro_profesional = 1004;

-- ---- DR. ANDRÉS CARDONA (Cirugía Oral, 20 citas) ----
INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-03-10', '11:00', 'CONSULTORIO_3', 'ATENDIDA', 'Exodoncia simple de molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123456' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-20', '09:00', 'CONSULTORIO_2', 'ATENDIDA', 'Control post-tratamiento de conducto'
FROM paciente p, odontologo o WHERE p.identificacion = '90123457' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-05', '15:00', 'CONSULTORIO_3', 'ATENDIDA', 'Dolor de muelas desde hace una semana'
FROM paciente p, odontologo o WHERE p.identificacion = '90123458' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-07-15', '09:00', 'CONSULTORIO_1', 'CANCELADA', 'Paciente solicita reprogramación'
FROM paciente p, odontologo o WHERE p.identificacion = '90123459' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-15', '15:00', 'CONSULTORIO_3', 'NO_ASISTIO', 'Paciente no se presentó a la cita'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304001' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-05', '09:00', 'CONSULTORIO_3', 'ATENDIDA', 'Endodoncia unirradicular'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304002' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-10-10', '11:00', 'CONSULTORIO_3', 'ATENDIDA', 'Caries en molar inferior'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304003' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-25', '15:00', 'CONSULTORIO_2', 'PROGRAMADA', 'Control mensual de ortodoncia'
FROM paciente p, odontologo o WHERE p.identificacion = '80123456' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-01-25', '16:00', 'CONSULTORIO_3', 'ATENDIDA', 'Ajuste de aparato ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '80123457' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-11-15', '14:00', 'CONSULTORIO_1', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '80123458' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-11-15', '09:00', 'CONSULTORIO_2', 'CANCELADA', 'Paciente solicita reprogramación'
FROM paciente p, odontologo o WHERE p.identificacion = '90123456' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-10', '14:00', 'CONSULTORIO_2', 'ATENDIDA', 'Caries en molar inferior'
FROM paciente p, odontologo o WHERE p.identificacion = '90123457' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-20', '15:00', 'CONSULTORIO_3', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '90123458' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-02-20', '16:00', 'CONSULTORIO_3', 'ATENDIDA', 'Dolor persistente en zona molar'
FROM paciente p, odontologo o WHERE p.identificacion = '90123459' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-12-10', '09:00', 'CONSULTORIO_1', 'ATENDIDA', 'Caries en molar inferior'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304001' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2025-11-10', '14:00', 'CONSULTORIO_2', 'ATENDIDA', 'Sensibilidad dental al frío'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304002' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-10', '10:00', 'CONSULTORIO_2', 'CANCELADA', 'Paciente solicita reprogramación'
FROM paciente p, odontologo o WHERE p.identificacion = '1020304003' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-04-15', '10:00', 'CONSULTORIO_1', 'ATENDIDA', 'Radiografía periapical de control'
FROM paciente p, odontologo o WHERE p.identificacion = '80123456' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-06-25', '08:00', 'CONSULTORIO_3', 'ATENDIDA', 'Revisión de elásticos ortodónticos'
FROM paciente p, odontologo o WHERE p.identificacion = '80123457' AND o.registro_profesional = 1005;

INSERT INTO cita (paciente_id, odontologo_id, fecha_cita, hora_cita, consultorio_asignado, estado_cita, motivo_consulta)
SELECT p.id, o.id, '2026-05-15', '15:00', 'CONSULTORIO_2', 'PROGRAMADA', 'Cita de control ortodóntico'
FROM paciente p, odontologo o WHERE p.identificacion = '80123458' AND o.registro_profesional = 1005;

-- =============================================
-- PROCEDIMIENTOS REALIZADOS (solo citas ATENDIDAS)
-- 1-3 procedimientos por cita ATENDIDA
-- =============================================

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304001' AND c.fecha_cita = '2025-08-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304001' AND c.fecha_cita = '2025-08-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304001' AND c.fecha_cita = '2025-08-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304002' AND c.fecha_cita = '2025-11-05' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-007';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304002' AND c.fecha_cita = '2025-11-05' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-05-10' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-010';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 45 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-05-10' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 48 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304005' AND c.fecha_cita = '2026-05-15' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 38 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304006' AND c.fecha_cita = '2025-08-15' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 24 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304007' AND c.fecha_cita = '2025-12-05' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304009' AND c.fecha_cita = '2025-09-25' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304002' AND c.fecha_cita = '2025-08-15' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304003' AND c.fecha_cita = '2026-05-25' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 46 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304003' AND c.fecha_cita = '2026-05-25' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304003' AND c.fecha_cita = '2026-05-25' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-06-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-06-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 35 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-06-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 34 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304006' AND c.fecha_cita = '2026-04-10' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 24 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304006' AND c.fecha_cita = '2026-04-10' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 21 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304007' AND c.fecha_cita = '2025-10-20' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 35 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304007' AND c.fecha_cita = '2025-10-20' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '1020304007' AND c.fecha_cita = '2025-10-20' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 13 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '10203040010' AND c.fecha_cita = '2025-10-10' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 36 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '10203040010' AND c.fecha_cita = '2025-10-10' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1001 AND p.identificacion = '10203040010' AND c.fecha_cita = '2025-10-10' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 42 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123456' AND c.fecha_cita = '2025-08-10' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123456' AND c.fecha_cita = '2025-08-10' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 26 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123457' AND c.fecha_cita = '2026-02-05' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123458' AND c.fecha_cita = '2026-02-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-010';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 19 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123458' AND c.fecha_cita = '2026-02-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-007';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123458' AND c.fecha_cita = '2026-02-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 21 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123461' AND c.fecha_cita = '2025-11-20' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 35 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123463' AND c.fecha_cita = '2025-07-05' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 44 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123463' AND c.fecha_cita = '2025-07-05' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-007';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 45 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123465' AND c.fecha_cita = '2026-01-25' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123465' AND c.fecha_cita = '2026-01-25' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 21 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123456' AND c.fecha_cita = '2026-05-05' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-007';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123457' AND c.fecha_cita = '2025-07-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123458' AND c.fecha_cita = '2025-07-25' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 20 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123458' AND c.fecha_cita = '2025-07-25' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123459' AND c.fecha_cita = '2025-12-15' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123461' AND c.fecha_cita = '2026-01-15' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 34 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123461' AND c.fecha_cita = '2026-01-15' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123463' AND c.fecha_cita = '2026-01-20' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1002 AND p.identificacion = '80123465' AND c.fecha_cita = '2026-05-10' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123456' AND c.fecha_cita = '2025-08-10' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123457' AND c.fecha_cita = '2026-01-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 36 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123458' AND c.fecha_cita = '2026-05-10' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 39 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123458' AND c.fecha_cita = '2026-05-10' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123459' AND c.fecha_cita = '2026-04-05' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123460' AND c.fecha_cita = '2026-02-20' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123461' AND c.fecha_cita = '2026-02-15' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123461' AND c.fecha_cita = '2026-02-15' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123462' AND c.fecha_cita = '2026-03-05' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123463' AND c.fecha_cita = '2025-08-05' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 41 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123464' AND c.fecha_cita = '2025-10-05' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-010';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123464' AND c.fecha_cita = '2025-10-05' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 17 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123464' AND c.fecha_cita = '2025-10-05' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 37 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123465' AND c.fecha_cita = '2026-05-10' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-007';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 36 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123457' AND c.fecha_cita = '2026-04-05' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123457' AND c.fecha_cita = '2026-04-05' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123457' AND c.fecha_cita = '2026-04-05' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-010';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123458' AND c.fecha_cita = '2026-04-25' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 28 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123458' AND c.fecha_cita = '2026-04-25' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123459' AND c.fecha_cita = '2025-10-25' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123460' AND c.fecha_cita = '2026-01-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 37 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123461' AND c.fecha_cita = '2025-07-25' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123462' AND c.fecha_cita = '2025-07-15' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123462' AND c.fecha_cita = '2025-07-15' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-007';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 29 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123463' AND c.fecha_cita = '2026-03-25' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 46 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123463' AND c.fecha_cita = '2026-03-25' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-008';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123464' AND c.fecha_cita = '2026-03-20' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1003 AND p.identificacion = '90123465' AND c.fecha_cita = '2026-06-25' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-010';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 48 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304001' AND c.fecha_cita = '2026-04-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304001' AND c.fecha_cita = '2026-04-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304001' AND c.fecha_cita = '2026-04-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304002' AND c.fecha_cita = '2025-09-20' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304003' AND c.fecha_cita = '2026-06-25' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 16 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304003' AND c.fecha_cita = '2026-06-25' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-03-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-010';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-03-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 27 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304004' AND c.fecha_cita = '2026-03-15' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 40 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '90123457' AND c.fecha_cita = '2025-08-25' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '80123456' AND c.fecha_cita = '2025-07-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 24 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '80123458' AND c.fecha_cita = '2025-12-15' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304001' AND c.fecha_cita = '2026-06-05' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 21 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '1020304003' AND c.fecha_cita = '2025-07-20' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 11 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '90123456' AND c.fecha_cita = '2026-06-05' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '90123456' AND c.fecha_cita = '2026-06-05' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1004 AND p.identificacion = '90123458' AND c.fecha_cita = '2025-11-25' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-002';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 24 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '90123456' AND c.fecha_cita = '2026-03-10' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 43 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '90123457' AND c.fecha_cita = '2026-05-20' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 16 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '90123458' AND c.fecha_cita = '2025-10-05' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 11 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '1020304002' AND c.fecha_cita = '2025-12-05' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 21 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '1020304003' AND c.fecha_cita = '2025-10-10' AND c.hora_cita = '11:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123457' AND c.fecha_cita = '2026-01-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-007';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123457' AND c.fecha_cita = '2026-01-25' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123458' AND c.fecha_cita = '2025-11-15' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-001';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123458' AND c.fecha_cita = '2025-11-15' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '90123457' AND c.fecha_cita = '2026-05-10' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '90123458' AND c.fecha_cita = '2025-12-20' AND c.hora_cita = '15:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '90123459' AND c.fecha_cita = '2026-02-20' AND c.hora_cita = '16:00' AND pr.codigo = 'PROC-009';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 22 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '1020304001' AND c.fecha_cita = '2025-12-10' AND c.hora_cita = '09:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 32 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '1020304002' AND c.fecha_cita = '2025-11-10' AND c.hora_cita = '14:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 17 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123456' AND c.fecha_cita = '2026-04-15' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-004';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, 13 FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123456' AND c.fecha_cita = '2026-04-15' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-005';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123456' AND c.fecha_cita = '2026-04-15' AND c.hora_cita = '10:00' AND pr.codigo = 'PROC-003';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123457' AND c.fecha_cita = '2026-06-25' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-006';

INSERT INTO procedimiento_realizado (cita_id, procedimiento_id, diente_numero)
SELECT c.id, pr.id, NULL FROM cita c, procedimiento pr, odontologo o, paciente p
WHERE c.odontologo_id = o.id AND c.paciente_id = p.id AND o.registro_profesional = 1005 AND p.identificacion = '80123457' AND c.fecha_cita = '2026-06-25' AND c.hora_cita = '08:00' AND pr.codigo = 'PROC-005';

-- migrate:down
DELETE FROM procedimiento_realizado;
DELETE FROM cita;