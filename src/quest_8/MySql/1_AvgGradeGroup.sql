CREATE FUNCTION avg_grade_by_subject_and_group(subject_id INT, group_id INT)
RETURNS DECIMAL(3,2)
BEGIN
    DECLARE avg_grade DECIMAL(3,2);
    SELECT AVG(g.grade) INTO avg_grade
    FROM Grades g
    JOIN Students st ON g.student_id = st.id
    WHERE g.subject_id = subject_id AND st.group_id = group_id;
    RETURN IFNULL(avg_grade, 0);
END;
SELECT avg_grade_by_subject_and_group(1, 1) AS средняя_оценка;