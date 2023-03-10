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



CREATE Table vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id INTEGER NOT NULL,
  vet_id INTEGER NOT NULL,
  CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id),
  CONSTRAINT fk_vet_id FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id INTEGER NOT NULL,
  vet_id INTEGER NOT NULL,
  date_of_visit DATE,
  CONSTRAINT fk_animal_id FOREIGN KEY (animal_id) REFERENCES animals(id),
  CONSTRAINT fk_vet_id FOREIGN KEY (vet_id) REFERENCES vets(id)
);

