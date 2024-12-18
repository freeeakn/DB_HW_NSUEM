CREATE OR REPLACE FUNCTION count_missed_lessons_by_group(
    p_group_id INT
)
RETURNS INT AS $$
DECLARE
    v_count_missed INT;
BEGIN
    SELECT COUNT(*) INTO v_count_missed
    FROM Lessons l
    JOIN Groups gr ON l.id_group = gr.id
    WHERE gr.id = p_group_id AND NOT EXISTS (
        SELECT 1
        FROM Attendance a
        JOIN Students st ON a.id_student = st.id
        WHERE a.id_lesson = l.id AND st.group_id = p_group_id
    );
    RETURN v_count_missed;
END;
$$ LANGUAGE plpgsql;

SELECT count_missed_lessons_by_group(1) AS количество_пропущенных_занятий;