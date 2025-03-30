CREATE TABLE Lessons (
    id INT PRIMARY KEY IDENTITY(1,1),
    pair_number INT,
    start_time TIME,
    end_time TIME,
    date DATE,
    id_subject INT,
    id_group INT,
    id_teacher INT,
    CONSTRAINT FK_Lessons_Subjects FOREIGN KEY (id_subject) REFERENCES Subjects(id),
    CONSTRAINT FK_Lessons_Groups FOREIGN KEY (id_group) REFERENCES Groups(id),
    CONSTRAINT FK_Lessons_Teachers FOREIGN KEY (id_teacher) REFERENCES Teachers(id)
);