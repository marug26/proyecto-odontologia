-- migrate:up

-- =============================================
-- SEED: 30 PACIENTES
-- Distribución: 10 ESTUDIANTE, 10 DOCENTE, 10 EXTERNO
-- =============================================

INSERT INTO paciente (nombres, apellidos, email, identificacion, telefono, fecha_nacimiento, direccion, tipo_paciente) VALUES
-- ESTUDIANTES (10)
('Carlos Andrés', 'Martínez López', 'carlos.martinez@estudiante.edu', '1020304001', '3101234567', '1998-03-15', 'Cra 10 #15-22', 'ESTUDIANTE'),
('María Fernanda', 'Rodríguez Pérez', 'maria.rodriguez@estudiante.edu', '1020304002', '3112345678', '1999-07-22', 'Calle 45 #8-16', 'ESTUDIANTE'),
('Juan Sebastián', 'García Muñoz', 'juan.garcia@estudiante.edu', '1020304003', '3123456789', '2000-01-10', 'Av 6N #32-48', 'ESTUDIANTE'),
('Valentina', 'López Hernández', 'valentina.lopez@estudiante.edu', '1020304004', '3134567890', '1997-11-05', 'Cra 7 #20-35', 'ESTUDIANTE'),
('Santiago', 'Ramírez Torres', 'santiago.ramirez@estudiante.edu', '1020304005', '3145678901', '2001-05-18', 'Calle 72 #11-20', 'ESTUDIANTE'),
('Daniela', 'Fernández Castro', 'daniela.fernandez@estudiante.edu', '1020304006', '3156789012', '1998-09-30', 'Cra 50 #25-14', 'ESTUDIANTE'),
('Andrés Felipe', 'Morales Ríos', 'andres.morales@estudiante.edu', '1020304007', '3167890123', '1999-12-25', 'Av El Poblado #10-08', 'ESTUDIANTE'),
('Laura Camila', 'Vargas Diaz', 'laura.vargas@estudiante.edu', '1020304008', '3178901234', '2000-04-12', 'Calle 15 #3-60', 'ESTUDIANTE'),
('Sebastián', 'Jiménez Moreno', 'sebastian.jimenez@estudiante.edu', '1020304009', '3189012345', '1997-08-07', 'Cra 14 #42-18', 'ESTUDIANTE'),
('Natalia', 'Suárez Villegas', 'natalia.suarez@estudiante.edu', '1020304010', '3190123456', '2001-02-28', 'Calle 10 #5-33', 'ESTUDIANTE'),

-- DOCENTES (10)
('Roberto', 'Sánchez Gómez', 'roberto.sanchez@universidad.edu', '80123456', '3201234567', '1975-06-14', 'Cra 30 #18-42', 'DOCENTE'),
('Patricia', 'Diaz Moreno', 'patricia.diaz@universidad.edu', '80123457', '3212345678', '1980-03-08', 'Calle 80 #22-15', 'DOCENTE'),
('Fernando', 'Castro Roldan', 'fernando.castro@universidad.edu', '80123458', '3223456789', '1972-11-20', 'Av 30 #14-05', 'DOCENTE'),
('Claudia', 'Ruiz Peña', 'claudia.ruiz@universidad.edu', '80123459', '3234567890', '1978-07-03', 'Cra 43 #5-28', 'DOCENTE'),
('Mauricio', 'Ospina Álvarez', 'mauricio.ospina@universidad.edu', '80123460', '3245678901', '1982-01-25', 'Calle 26 #12-40', 'DOCENTE'),
('Adriana', 'Gutiérrez Cardona', 'adriana.gutierrez@universidad.edu', '80123461', '3256789012', '1976-09-17', 'Cra 15 #30-22', 'DOCENTE'),
('Luis Miguel', 'Herrera Parra', 'luis.herrera@universidad.edu', '80123462', '3267890123', '1985-04-09', 'Av 6 #28-55', 'DOCENTE'),
('Sandra', 'Torres Benítez', 'sandra.torres@universidad.edu', '80123463', '3278901234', '1979-12-01', 'Calle 50 #18-36', 'DOCENTE'),
('Ricardo', 'Medina Velásquez', 'ricardo.medina@universidad.edu', '80123464', '3289012345', '1970-08-22', 'Cra 7 #40-12', 'DOCENTE'),
('Gloria', 'Peñaloza Rueda', 'gloria.penaloza@universidad.edu', '80123465', '3290123456', '1983-05-16', 'Calle 19 #7-48', 'DOCENTE'),

-- EXTERNOS (10)
('Pedro', 'Alvarado Echeverria', 'pedro.alvarado@gmail.com', '90123456', '3301234567', '1988-02-14', 'Cra 25 #40-30', 'EXTERNO'),
('Lucía', 'Mendoza Salazar', 'lucia.mendoza@gmail.com', '90123457', '3312345678', '1992-10-05', 'Calle 55 #12-18', 'EXTERNO'),
('Jorge', 'Vega Ocampo', 'jorge.vega@gmail.com', '90123458', '3323456789', '1985-06-30', 'Av 4N #22-42', 'EXTERNO'),
('Mónica', 'Aguilera Naranjo', 'monica.aguilera@gmail.com', '90123459', '3334567890', '1990-01-18', 'Cra 60 #15-25', 'EXTERNO'),
('Diego', 'Paredes Fuentes', 'diego.paredes@gmail.com', '90123460', '3345678901', '1987-08-09', 'Calle 40 #8-55', 'EXTERNO'),
('Carolina', 'Lozano Montoya', 'carolina.lozano@gmail.com', '90123461', '3356789012', '1993-04-22', 'Cra 35 #20-10', 'EXTERNO'),
('Ricardo', 'Palacios Guzmán', 'ricardo.palacios@gmail.com', '90123462', '3367890123', '1982-12-07', 'Av 8 #30-15', 'EXTERNO'),
('Tatiana', 'Rentería Solano', 'tatiana.renteria@gmail.com', '90123463', '3378901234', '1995-07-13', 'Calle 7 #12-38', 'EXTERNO'),
('Oscar', 'Gallego Arango', 'oscar.gallego@gmail.com', '90123464', '3389012345', '1980-03-28', 'Cra 48 #25-48', 'EXTERNO'),
('Angélica', 'Cárdenas Ríos', 'angelica.cardenas@gmail.com', '90123465', '3390123456', '1991-09-04', 'Calle 33 #14-22', 'EXTERNO');

-- =============================================
-- SEED: HISTORIAS CLÍNICAS (una por paciente)
-- =============================================

INSERT INTO historia_clinica (paciente_id, observaciones)
SELECT id, CASE
    WHEN tipo_paciente = 'ESTUDIANTE' THEN 'Sin antecedentes patológicos relevantes. Paciente joven sin alergias conocidas.'
    WHEN tipo_paciente = 'DOCENTE' THEN 'Hipertensión arterial controlada. Medicación actual: Losartán 50mg diario.'
    ELSE 'Paciente sin antecedentes de importancia. Alergia a la penicilina reportada.'
END
FROM paciente;

-- migrate:down
DELETE FROM historia_clinica WHERE paciente_id IN (SELECT id FROM paciente WHERE identificacion BETWEEN '1020304001' AND '1020304010' OR identificacion BETWEEN '80123456' AND '80123465' OR identificacion BETWEEN '90123456' AND '90123465');
DELETE FROM paciente WHERE identificacion BETWEEN '1020304001' AND '1020304010' OR identificacion BETWEEN '80123456' AND '80123465' OR identificacion BETWEEN '90123456' AND '90123465';
