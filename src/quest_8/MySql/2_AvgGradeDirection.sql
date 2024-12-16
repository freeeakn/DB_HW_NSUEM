CREATE FUNCTION avg_grade_by_subject_and_direction(subject_id INT, direction_id INT)
RETURNS DECIMAL(3,2)
BEGIN
    DECLARE avg_grade DECIMAL(3,2);
    SELECT AVG(g.grade) INTO avg_grade
    FROM Grades g
    JOIN Students st ON g.student_id = st.id
    JOIN Groups gr ON st.group_id = gr.id
    WHERE g.subject_id = subject_id AND gr.direction_id = direction_id;
    RETURN IFNULL(avg_grade, 0);
END;
SELECT avg_grade_by_subject_and_direction(1, 1) AS средняя_оценка;