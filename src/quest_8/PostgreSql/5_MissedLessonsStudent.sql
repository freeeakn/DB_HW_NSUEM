CREATE OR REPLACE FUNCTION count_missed_lessons(
    p_student_id INT
)
RETURNS INT AS $$
DECLARE
    v_count_missed INT;
BEGIN
    SELECT COUNT(*) INTO v_count_missed
    FROM Lessons l
    WHERE NOT EXISTS (
        SELECT 1
        FROM Attendance a
        WHERE a.id_lesson = l.id AND a.id_student = p_student_id
    );
    RETURN v_count_missed;
END;
$$ LANGUAGE plpgsql;

SELECT count_missed_lessons(1) AS количество_пропущенных_занятий;