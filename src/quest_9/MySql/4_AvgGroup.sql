CREATE TABLE IF NOT EXISTS `AverageGradesByGroup` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    group_id INT NOT NULL,
    average_grade DECIMAL(3,2),
    FOREIGN KEY (group_id) REFERENCES Groups(id)
);

CREATE TRIGGER calculate_average_grade_by_group_after_insert
AFTER INSERT ON Grades
FOR EACH ROW
BEGIN
    INSERT INTO AverageGradesByGroup (group_id, average_grade)
    VALUES ((SELECT group_id FROM Students WHERE id = NEW.student_id), (SELECT AVG(g.grade) FROM Grades g JOIN Students s ON g.student_id = s.id WHERE s.group_id = (SELECT group_id FROM Students WHERE id = NEW.student_id)))
    ON DUPLICATE KEY UPDATE average_grade = (SELECT AVG(g.grade) FROM Grades g JOIN Students s ON g.student_id = s.id WHERE s.group_id = (SELECT group_id FROM Students WHERE id = NEW.student_id));
END;

INSERT INTO Grades (student_id, subject_id, teacher_id, grade)
VALUES (2, 1, 1, 5);

SELECT * FROM AverageGradesByGroup