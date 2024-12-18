CREATE OR REPLACE FUNCTION check_grade()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.grade NOT IN (2, 3, 4, 5) THEN
        RAISE EXCEPTION 'Недопустимая оценка';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_grade_trigger
BEFORE INSERT ON Grades
FOR EACH ROW
EXECUTE FUNCTION check_grade();

INSERT INTO Grades (student_id, subject_id, grade) VALUES (1, 1, 6);