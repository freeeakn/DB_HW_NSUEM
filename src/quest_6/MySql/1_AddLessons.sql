CREATE TABLE `Lessons` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pair_number INT,
    start_time TIME,
    end_time TIME,
    date DATE,
    id_subject INT,
    id_group INT,
    id_teacher INT,
    FOREIGN KEY (id_subject) REFERENCES Subjects(id),
    FOREIGN KEY (id_group) REFERENCES Groups(id),
    FOREIGN KEY (id_teacher) REFERENCES Teachers(id)
);