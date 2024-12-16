CREATE FUNCTION nerds_count(group_id INT)
RETURNS INT
BEGIN
    DECLARE count_nerd INT;
    SELECT COUNT(*) INTO count_nerd
    FROM Students st
    WHERE st.group_id = group_id AND NOT EXISTS (
        SELECT 1
        FROM Grades g
        WHERE g.student_id = st.id AND g.grade < 5
    );
    RETURN count_nerd;
END;
SELECT nerds_count(1) AS количество_отличников;