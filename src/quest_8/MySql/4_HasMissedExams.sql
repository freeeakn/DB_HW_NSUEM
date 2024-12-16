CREATE FUNCTION has_missed_exams(student_id INT)
RETURNS BOOLEAN
BEGIN
    DECLARE has_missed BOOLEAN;
    SELECT EXISTS (
        SELECT 1
        FROM Grades g
        WHERE g.student_id = student_id AND (g.grade = 2 OR g.grade IS NULL)
    ) INTO has_missed;
    RETURN has_missed;
END;
SELECT has_missed_exams(1) AS есть_несданные_экзамены;