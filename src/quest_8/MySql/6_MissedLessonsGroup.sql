CREATE FUNCTION count_missed_lessons_by_group(group_id INT)
RETURNS INT
BEGIN
    DECLARE count_missed INT;
    SELECT COUNT(*) INTO count_missed
    FROM Lessons l
    JOIN Groups gr ON l.id_group = gr.id
    WHERE gr.id = group_id AND NOT EXISTS (
        SELECT 1
        FROM Attendance a
        WHERE a.id_lesson = l.id AND a.id_student IN (
            SELECT id
            FROM Students
            WHERE group_id = group_id
        )
    );
    RETURN count_missed;
END;
SELECT count_missed_lessons_by_group(1) AS количество_пропущенных_занятий;