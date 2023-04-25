/* 1. Create a database */
CREATE DATABASE animals; --or `createdb animals` from bash (use postgresql wrapper function)
/* 2. Create a table */
\c animals
CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age int,
  species varchar(15)
);
/* 3. Insert data */
INSERT INTO birds (name, age, species)
  VALUES ('Charlie', 3, 'Finch'),
         ('Allie', 5, 'Owl'),
         ('Jennifer', 3, 'Magpie'),
         ('Jamie', 4, 'Owl'),
         ('Roy', 8, 'Crow');
/* 4. Select data */
SELECT * FROM birds;
/* 5. WHERE Clause */
SELECT * FROM birds
  WHERE age < 5;
/* 6. Update Data */
UPDATE birds
  SET species = 'Raven'
  WHERE species = 'Crow';
UPDATE birds
  SET species = 'Hawk'
  WHERE id = 4;
/* 7. Delete Data */
DELETE FROM birds
WHERE species = 'Finch' AND age = 3;
/* 8.Add Constraint */
ALTER TABLE birds
  ADD CONSTRAINT check_age CHECK (age > 0);
INSERT INTO birds (age) VALUES (-1); -- returns an error
/* 9.Drop Table */
DROP TABLE birds;
/* 10.Drop Database */
\c ec2-user
DROP DATABASE animals; --or dropdb animals from bash