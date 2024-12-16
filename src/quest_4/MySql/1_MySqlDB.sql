CREATE TABLE IF NOT EXISTS `Teachers` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    last_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Subjects` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    direction_id INT NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (direction_id) REFERENCES Directions(id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

CREATE TABLE IF NOT EXISTS `Grades` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    grade TINYINT CHECK (grade IN (2, 3, 4, 5)),
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(id),
    UNIQUE (student_id, subject_id)
);