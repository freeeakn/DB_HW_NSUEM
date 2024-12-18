CREATE TABLE IF NOT EXISTS Addresses (
    id SERIAL PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    house_number VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Directions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS FundingTypes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    direction_id INTEGER NOT NULL REFERENCES Directions(id)
);

CREATE TABLE IF NOT EXISTS Students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    birth_date DATE NOT NULL,
    address_id INTEGER NOT NULL REFERENCES Addresses(id),
    group_id INTEGER NOT NULL REFERENCES Groups(id),
    email VARCHAR(255) UNIQUE,
    funding_type_id INTEGER NOT NULL REFERENCES FundingTypes(id)
);

CREATE TABLE IF NOT EXISTS PhoneNumbers (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES Students(id),
    phone_number VARCHAR(20) NOT NULL
);