SELECT TOP 1 WITH TIES
    s.name AS Предмет,
    COUNT(g.student_id) AS [Кол-во студентов]
FROM 
    Grades g
JOIN 
    Subjects s ON g.subject_id = s.id
GROUP BY 
    s.name
ORDER BY 
    COUNT(g.student_id) DESC;