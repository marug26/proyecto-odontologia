-- migrate:up

-- =============================================
-- SEED: 6 EMPLEADOS (1 recepcionista + 5 odontólogos)
-- El administrador ya existe de la migración 002
-- =============================================

-- Recepcionista
INSERT INTO empleado (nombres, apellidos, email, identificacion, rol, active)
VALUES ('Sandra Milena', 'Torres Giraldo', 'sandra.torres@clinica.com', '1098765432', 'RECEPCIONISTA', true);

-- Odontólogos
INSERT INTO empleado (nombres, apellidos, email, identificacion, rol, active)
VALUES
('Alejandro', 'Vargas Mora', 'alejandro.vargas@clinica.com', '1087654321', 'ODONTOLOGO', true),
('Isabella', 'Montoya Duque', 'isabella.montoya@clinica.com', '1076543210', 'ODONTOLOGO', true),
('Mateo', 'Restrepo Herrera', 'mateo.restrepo@clinica.com', '1065432109', 'ODONTOLOGO', true),
('Camila', 'Ospina Londoño', 'camila.ospina@clinica.com', '1054321098', 'ODONTOLOGO', true),
('Daniel', 'Cardona Álvarez', 'daniel.cardona@clinica.com', '1043210987', 'ODONTOLOGO', true);

-- =============================================
-- SEED: ODONTOLOGOS (5 registros)
-- =============================================

INSERT INTO odontologo (id, registro_profesional, especialidad, tipo)
SELECT id, 1001, 'Odontología General', 'DOCENTE'
FROM empleado WHERE identificacion = '1087654321';

INSERT INTO odontologo (id, registro_profesional, especialidad, tipo)
SELECT id, 1002, 'Ortodoncia', 'RESIDENTE'
FROM empleado WHERE identificacion = '1076543210';

INSERT INTO odontologo (id, registro_profesional, especialidad, tipo)
SELECT id, 1003, 'Endodoncia', 'DOCENTE'
FROM empleado WHERE identificacion = '1065432109';

INSERT INTO odontologo (id, registro_profesional, especialidad, tipo)
SELECT id, 1004, 'Periodoncia', 'RESIDENTE'
FROM empleado WHERE identificacion = '1054321098';

INSERT INTO odontologo (id, registro_profesional, especialidad, tipo)
SELECT id, 1005, 'Cirugía Oral', 'DOCENTE'
FROM empleado WHERE identificacion = '1043210987';

-- migrate:down
DELETE FROM odontologo WHERE registro_profesional BETWEEN 1001 AND 1005;
DELETE FROM empleado WHERE identificacion IN ('1098765432', '1087654321', '1076543210', '1065432109', '1054321098', '1043210987');
