CREATE FUNCTION count_missed_lessons_by_teacher(teacher_id INT)
RETURNS INT
BEGIN
    DECLARE count_missed INT;
    SELECT COUNT(*) INTO count_missed
    FROM Lessons l
    WHERE l.id_teacher = teacher_id AND NOT EXISTS (
        SELECT 1
        FROM Attendance a
        WHERE a.id_lesson = l.id
    );
    RETURN count_missed;
END;
SELECT count_missed_lessons_by_teacher(1) AS количество_пропущенных_занятий;