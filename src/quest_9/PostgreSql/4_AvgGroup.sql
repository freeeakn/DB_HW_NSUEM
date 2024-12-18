CREATE TABLE IF NOT EXISTS AverageGradesByGroup (
    id SERIAL PRIMARY KEY,
    group_id INT NOT NULL,
    average_grade DECIMAL(3,2),
    CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES Groups(id)
);

CREATE OR REPLACE FUNCTION calculate_average_grade_by_group_after_insert()
RETURNS TRIGGER AS $$
DECLARE
    v_group_id INT;
BEGIN
    SELECT group_id INTO v_group_id FROM Students WHERE id = NEW.student_id;
    INSERT INTO AverageGradesByGroup (group_id, average_grade)
    VALUES (v_group_id, (SELECT AVG(g.grade) FROM Grades g JOIN Students s ON g.student_id = s.id WHERE s.group_id = v_group_id))
    ON CONFLICT (group_id) DO UPDATE SET average_grade = (SELECT AVG(g.grade) FROM Grades g JOIN Students s ON g.student_id = s.id WHERE s.group_id = v_group_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calculate_average_grade_by_group_after_insert_trigger
AFTER INSERT ON Grades
FOR EACH ROW
EXECUTE FUNCTION calculate_average_grade_by_group_after_insert();

INSERT INTO Grades (student_id, subject_id, teacher_id, grade)
VALUES (2, 1, 1, 5);

SELECT * FROM AverageGradesByGroup;