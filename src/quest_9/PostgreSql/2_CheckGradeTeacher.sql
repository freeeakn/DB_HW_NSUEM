CREATE OR REPLACE FUNCTION check_teacher()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Lessons l
        JOIN Groups g ON l.id_group = g.id
        WHERE l.id_teacher = NEW.teacher_id
        AND g.id = (SELECT group_id FROM Students WHERE id = NEW.student_id)
        AND l.id_subject = NEW.subject_id
    ) THEN
        RAISE EXCEPTION 'Преподаватель не назначен на этот предмет у этой группы';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_teacher_trigger
BEFORE INSERT ON Grades
FOR EACH ROW
EXECUTE FUNCTION check_teacher();

INSERT INTO Grades (student_id, subject_id, teacher_id, grade) VALUES (1, 1, 2, 5);