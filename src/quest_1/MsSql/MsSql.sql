CREATE TABLE Addresses (
    id INT PRIMARY KEY IDENTITY(1,1),
    city NVARCHAR(255) NOT NULL,
    street NVARCHAR(255) NOT NULL,
    house_number NVARCHAR(20) NOT NULL
);

CREATE TABLE Directions (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE FundingTypes (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Groups (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL,
    direction_id INT NOT NULL,
    CONSTRAINT FK_Groups_Directions FOREIGN KEY (direction_id) REFERENCES Directions(id)
);

CREATE TABLE Students (
    id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(100) NOT NULL,
    surname NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100),
    birth_date DATE NOT NULL,
    address_id INT NOT NULL,
    group_id INT NOT NULL,
    email NVARCHAR(255) UNIQUE,
    funding_type_id INT NOT NULL,
    CONSTRAINT FK_Students_Addresses FOREIGN KEY (address_id) REFERENCES Addresses(id),
    CONSTRAINT FK_Students_Groups FOREIGN KEY (group_id) REFERENCES Groups(id),
    CONSTRAINT FK_Students_FundingTypes FOREIGN KEY (funding_type_id) REFERENCES FundingTypes(id)
);

CREATE TABLE PhoneNumbers (
    id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    phone_number NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_PhoneNumbers_Students FOREIGN KEY (student_id) REFERENCES Students(id)
);