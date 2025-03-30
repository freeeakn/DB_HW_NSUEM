SELECT 
    s.name AS Предмет,
    COUNT(CASE WHEN g.grade > 2 THEN g.student_id END) AS [Кол-во сдавших],
    COUNT(g.student_id) AS [Общее кол-во студентов],
    CAST(COUNT(CASE WHEN g.grade > 2 THEN g.student_id END) * 100.0 / COUNT(g.student_id) AS DECIMAL(5,2)) AS [Доля сдавших]
FROM 
    Grades g
JOIN 
    Subjects s ON g.subject_id = s.id
GROUP BY 
    s.name
ORDER BY 
    s.name;