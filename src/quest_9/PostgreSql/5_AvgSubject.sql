CREATE OR REPLACE FUNCTION calculate_average_grade_by_subject_after_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO AverageGradesBySubject (subject_id, average_grade)
    VALUES (NEW.subject_id, (SELECT AVG(grade) FROM Grades WHERE subject_id = NEW.subject_id))
    ON CONFLICT (subject_id) DO UPDATE SET average_grade = (SELECT AVG(grade) FROM Grades WHERE subject_id = NEW.subject_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calculate_average_grade_by_subject_after_insert_trigger
AFTER INSERT ON Grades
FOR EACH ROW
EXECUTE FUNCTION calculate_average_grade_by_subject_after_insert();

INSERT INTO Grades (student_id, subject_id, teacher_id, grade)
VALUES (1, 1, 1, 5);

SELECT * FROM AverageGradesBySubject;