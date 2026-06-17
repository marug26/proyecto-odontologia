-- migrate:up

ALTER TABLE odontologo
ADD COLUMN tipo VARCHAR(20) NOT NULL
CHECK (tipo IN ('DOCENTE', 'RESIDENTE'));

-- migrate:down

ALTER TABLE odontologo
DROP COLUMN IF EXISTS tipo;


