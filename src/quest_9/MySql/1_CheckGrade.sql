CREATE TRIGGER check_grade
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    IF NEW.grade NOT IN (2, 3, 4, 5) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Недопустимая оценка';
    END IF;
END;
INSERT INTO Grades (student_id, subject_id, grade) VALUES (1, 1, 6);