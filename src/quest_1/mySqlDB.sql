CREATE TABLE IF NOT EXISTS `Addresses` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    house_number VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Directions` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `FundingTypes` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `Groups` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    direction_id INT NOT NULL,
    FOREIGN KEY (direction_id) REFERENCES Directions(id)
);

CREATE TABLE IF NOT EXISTS `Students` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    birth_date DATE NOT NULL,
    address_id INT NOT NULL,
    group_id INT NOT NULL,
    email VARCHAR(255) UNIQUE,
    funding_type_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES Addresses(id),
    FOREIGN KEY (group_id) REFERENCES Groups(id),
    FOREIGN KEY (funding_type_id) REFERENCES FundingTypes(id)
);

CREATE TABLE IF NOT EXISTS `PhoneNumbers` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(id)
);