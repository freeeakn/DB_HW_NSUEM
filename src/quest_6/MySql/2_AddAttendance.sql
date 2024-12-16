CREATE TABLE `Attendance` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_lesson INT,
    id_student INT,
    FOREIGN KEY (id_lesson) REFERENCES Lessons(id),
    FOREIGN KEY (id_student) REFERENCES Students(id)
);