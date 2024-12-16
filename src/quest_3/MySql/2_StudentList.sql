SELECT 
    CONCAT(s.surname, ' ', s.first_name, ' ', s.last_name) AS ФИО,
    g.name AS Группа,
    d.name AS Направление
FROM 
    Students s
JOIN 
    Groups g ON s.group_id = g.id
JOIN 
    Directions d ON g.direction_id = d.id
WHERE 
    s.surname LIKE 'П%'
ORDER BY 
    s.surname, s.first_name, s.last_name;