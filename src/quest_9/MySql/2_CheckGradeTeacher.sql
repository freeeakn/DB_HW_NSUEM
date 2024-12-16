CREATE TRIGGER check_teacher
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Lessons l
        JOIN Groups g ON l.id_group = g.id
        WHERE l.id_teacher = (SELECT id FROM Teachers WHERE id = NEW.teacher_id)
        AND g.id = (SELECT group_id FROM Students WHERE id = NEW.student_id)
        AND l.id_subject = NEW.subject_id
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Преподаватель не назначен на этот предмет у этой группы';
    END IF;
END;

INSERT INTO Grades (student_id, subject_id, teacher_id, grade) VALUES (1, 1, 2, 5);