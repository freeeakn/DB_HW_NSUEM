CREATE FUNCTION count_missed_lessons(student_id INT)
RETURNS INT
BEGIN
    DECLARE count_missed INT;
    SELECT COUNT(*) INTO count_missed
    FROM Lessons l
    WHERE NOT EXISTS (
        SELECT 1
        FROM Attendance a
        WHERE a.id_lesson = l.id AND a.id_student = student_id
    );
    RETURN count_missed;
END;
SELECT count_missed_lessons(1) AS количество_пропущенных_занятий;