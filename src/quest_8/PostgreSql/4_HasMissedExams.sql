CREATE OR REPLACE FUNCTION has_missed_exams(
    p_student_id INT
)
RETURNS BOOLEAN AS $$
DECLARE
    v_has_missed BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM Grades g
        WHERE g.student_id = p_student_id AND (g.grade = 2 OR g.grade IS NULL)
    ) INTO v_has_missed;
    RETURN v_has_missed;
END;
$$ LANGUAGE plpgsql;

SELECT has_missed_exams(1) AS есть_несданные_экзамены;