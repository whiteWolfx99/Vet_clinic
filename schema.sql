/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

Alter table animals ADD COLUMN species VARCHAR(100);


CREATE TABLE owners (
id SERIAL PRIMARY KEY,
full_name VARCHAR(150) NOT NULL,
age INTEGER
)

CREATE TABLE species (
id SERIAL PRIMARY KEY,
name VARCHAR(150) NOT NULL
)

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD COLUMN owner_id INTEGER;