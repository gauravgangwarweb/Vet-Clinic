/* Database schema to keep the structure of entire database. */

create table animals ( 
    id int serial primary key, 
    name text, 
    date_of_birth date, 
    escape_attempts int, 
    neutered boolean, 
    weight_kg decimal
    );

alter table animals add column species text;

-- Create a table named owners
CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(100),
    age INT
);

-- Create a table named species
CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100)
);

-- Remove column species
ALTER TABLE animals DROP species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals 
 ADD species_id INT, 
 ADD CONSTRAINT fk_species 
 FOREIGN KEY (species_id) 
 REFERENCES species (id);

 -- Add column owner_id which is a foreign key referencing the owners table
 ALTER TABLE animals 
  ADD owner_id,
  ADD CONSTRAINT fk_owners
  FOREIGN KEY (owner_id) 
  REFERENCES owners (id);