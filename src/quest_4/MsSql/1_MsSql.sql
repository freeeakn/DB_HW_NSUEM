CREATE TABLE Teachers (
    id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(100) NOT NULL,
    surname NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Subjects (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    direction_id INT NOT NULL,
    teacher_id INT NOT NULL,
    CONSTRAINT FK_Subjects_Directions FOREIGN KEY (direction_id) REFERENCES Directions(id),
    CONSTRAINT FK_Subjects_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

CREATE TABLE Grades (
    id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    grade TINYINT CHECK (grade IN (2, 3, 4, 5)),
    CONSTRAINT FK_Grades_Students FOREIGN KEY (student_id) REFERENCES Students(id),
    CONSTRAINT FK_Grades_Subjects FOREIGN KEY (subject_id) REFERENCES Subjects(id),
    CONSTRAINT FK_Grades_Teachers FOREIGN KEY (teacher_id) REFERENCES Teachers(id),
    CONSTRAINT UQ_Grades_StudentSubjectTeacher UNIQUE (student_id, subject_id, teacher_id)
);