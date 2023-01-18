/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31'

SELECT name from animals WHERE escape_attempts > 3 and neutered = true

SELECT date_of_birth FROM animals where name = 'Agumon' or name = 'Pikachu'

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;



begin;
update animals set species = 'unspecified';
select * from animals


rollback;
select * from animals

begin;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is NULL;
commit;
select * from animals;

begin;
delete from animals;
select * from animals;

rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
SAVEPOINT animal_first_savepoint;
select * from animals

ROllback to SAVEPOINT animal_first_savepoint;
select * from animals;

UPDATE animals set weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;
select * from animals;



SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals where escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals

select neutered, sum(escape_attempts) as total_escape from animals group by neutered;

SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) as escape_attempts_avg FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;



SELECT * from animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT * FROM animals WHERE species_id = (SELECT id FROM species WHERE name = 'Pokemon');

SELECT * FROM owners 
LEFT JOIN animals 
ON owners.id = animals.id;

SELECT s.name, COUNT(a.species_id)
FROM animals a
INNER JOIN species s ON a.species_id = s.id
GROUP BY s.name;

SELECT a.*, s.name as species_name, o.full_name as owner_name
FROM animals a
INNER JOIN species s ON a.species_id = s.id
INNER JOIN owners o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.*, o.full_name
FROM animals a
INNER JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester'
AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(a.owner_id) as total_animals
FROM animals a
INNER JOIN owners o ON a.owner_id = o.id
GROUP BY o.full_name
ORDER BY total_animals DESC
LIMIT 1;



