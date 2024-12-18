CREATE OR REPLACE FUNCTION avg_grade_by_subject_and_direction(
    p_subject_id INT,
    p_direction_id INT
)
RETURNS DECIMAL(3,2) AS $$
DECLARE
    v_avg_grade DECIMAL(3,2);
BEGIN
    SELECT AVG(g.grade) INTO v_avg_grade
    FROM Grades g
    JOIN Students st ON g.student_id = st.id
    JOIN Groups gr ON st.group_id = gr.id
    WHERE g.subject_id = p_subject_id AND gr.direction_id = p_direction_id;
    RETURN COALESCE(v_avg_grade, 0);
END;
$$ LANGUAGE plpgsql;

SELECT avg_grade_by_subject_and_direction(1, 1) AS средняя_оценка;