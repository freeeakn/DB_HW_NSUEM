SELECT 
    s.first_name AS Имя,
    s.surname AS Фамилия,
    s.last_name AS Отчество
FROM 
    Students s
WHERE 
    s.id IN (
        SELECT 
            g.student_id
        FROM 
            Grades g
        WHERE 
            g.grade <= 2
        GROUP BY 
            g.student_id
        HAVING 
            COUNT(g.subject_id) >= 2
    );