DROP TABLE pets;
DROP TABLE stores;

CREATE TABLE stores (
  id serial4 primary key,
  name varchar(255),
  address varchar(255),
  stock varchar(255)
); 

CREATE TABLE pets (
  id serial4 primary key,
  name varchar(255),
  type varchar(255),
  pet_id int4 references stores(id)
);