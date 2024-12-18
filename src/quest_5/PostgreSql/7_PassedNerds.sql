SELECT 
    s.first_name AS Имя,
    s.surname AS Фамилия,
    s.last_name AS Отчество
FROM 
    Students s
WHERE 
    s.id NOT IN (
        SELECT 
            g.student_id
        FROM 
            Grades g
        WHERE 
            g.grade < 3
    )
    AND s.id NOT IN (
        SELECT 
            s.id
        FROM 
            Students s
        LEFT JOIN 
            Grades g ON s.id = g.student_id
        WHERE 
            g.grade IS NULL
    );