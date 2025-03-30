INSERT INTO Grades (student_id, subject_id, teacher_id, grade)
SELECT 
    student_id,
    subject_id,
    FLOOR(RAND(CHECKSUM(NEWID())) * 4) + 1 AS Учитель,
    FLOOR(RAND(CHECKSUM(NEWID())) * 4) + 2 AS Оценка
FROM (
    SELECT 
        s.id AS student_id,
        FLOOR(RAND(CHECKSUM(NEWID())) * 7) + 1 AS subject_id
    FROM Students s
    WHERE s.id BETWEEN 1 AND 99
) AS students
WHERE NOT EXISTS (
    SELECT 1 
    FROM Grades g 
    WHERE g.student_id = students.student_id 
    AND g.subject_id = students.subject_id 
    AND g.teacher_id = FLOOR(RAND(CHECKSUM(NEWID())) * 4) + 1
)
ORDER BY NEWID()
OFFSET 0 ROWS FETCH NEXT 500 ROWS ONLY;