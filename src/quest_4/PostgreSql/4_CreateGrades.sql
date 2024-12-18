INSERT INTO Grades (student_id, subject_id, teacher_id, grade)
SELECT 
    student_id,
    subject_id,
    FLOOR(RANDOM() * 4) + 1 AS teacher_id,
    FLOOR(RANDOM() * 4) + 2 AS grade
FROM (
    SELECT 
        s.id AS student_id,
        FLOOR(RANDOM() * 7) + 1 AS subject_id
    FROM Students s
    WHERE s.id BETWEEN 1 AND 99
    LIMIT 500
) AS students
ON CONFLICT DO NOTHING;