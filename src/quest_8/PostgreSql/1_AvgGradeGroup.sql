CREATE OR REPLACE FUNCTION avg_grade_by_subject_and_group(
    p_subject_id INT,
    p_group_id INT
)
RETURNS DECIMAL(3,2) AS $$
DECLARE
    v_avg_grade DECIMAL(3,2);
BEGIN
    SELECT AVG(g.grade) INTO v_avg_grade
    FROM Grades g
    JOIN Students st ON g.student_id = st.id
    WHERE g.subject_id = p_subject_id AND st.group_id = p_group_id;
    RETURN COALESCE(v_avg_grade, 0);
END;
$$ LANGUAGE plpgsql;

SELECT avg_grade_by_subject_and_group(1, 1) AS средняя_оценка;