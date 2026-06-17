-- migrate:up
UPDATE empleado
SET email = 'marcelaruiz1996@gmail.com'
WHERE email = 'admin@gmail.com';

-- migrate:down
UPDATE empleado
SET email = 'admin@gmail.com'
WHERE email = 'marcelaruiz1996@gmail.com';
