CREATE OR REPLACE FUNCTION count_missed_lessons_by_teacher(
    p_teacher_id INT
)
RETURNS INT AS $$
DECLARE
    v_count_missed INT;
BEGIN
    SELECT COUNT(*) INTO v_count_missed
    FROM Lessons l
    WHERE l.id_teacher = p_teacher_id AND NOT EXISTS (
        SELECT 1
        FROM Attendance a
        WHERE a.id_lesson = l.id
    );
    RETURN v_count_missed;
END;
$$ LANGUAGE plpgsql;

SELECT count_missed_lessons_by_teacher(1) AS количество_пропущенных_занятий;