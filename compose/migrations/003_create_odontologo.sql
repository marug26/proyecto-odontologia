-- migrate:up
CREATE TABLE odontologo (
    id UUID PRIMARY KEY REFERENCES empleado(id),
    registro_profesional INTEGER NOT NULL UNIQUE,
    especialidad VARCHAR(100) NOT NULL
);

-- migrate:down
DROP TABLE IF EXISTS odontologo;