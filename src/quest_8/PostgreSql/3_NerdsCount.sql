CREATE OR REPLACE FUNCTION nerds_count(
    p_group_id INT
)
RETURNS INT AS $$
DECLARE
    v_count_nerd INT;
BEGIN
    SELECT COUNT(*) INTO v_count_nerd
    FROM Students st
    WHERE st.group_id = p_group_id AND NOT EXISTS (
        SELECT 1
        FROM Grades g
        WHERE g.student_id = st.id AND g.grade < 5
    );
    RETURN v_count_nerd;
END;
$$ LANGUAGE plpgsql;

SELECT nerds_count(1) AS количество_отличников;