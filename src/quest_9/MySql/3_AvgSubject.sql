CREATE TABLE IF NOT EXISTS `AverageGradesBySubject` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT NOT NULL,
    average_grade DECIMAL(3,2),
    FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);

CREATE TRIGGER calculate_average_grade_by_subject_after_insert
AFTER INSERT ON Grades
FOR EACH ROW
BEGIN
    INSERT INTO AverageGradesBySubject (subject_id, average_grade)
    VALUES (NEW.subject_id, (SELECT AVG(grade) FROM Grades WHERE subject_id = NEW.subject_id))
    ON DUPLICATE KEY UPDATE average_grade = (SELECT AVG(grade) FROM Grades WHERE subject_id = NEW.subject_id);
END;

INSERT INTO Grades (student_id, subject_id, teacher_id, grade)
VALUES (1, 1, 1, 5);

SELECT * FROM AverageGradesBySubject