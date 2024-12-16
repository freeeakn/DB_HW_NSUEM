SELECT 
    d.name AS Направление,
    COUNT(s.id) AS Количество
FROM 
    Students s
JOIN 
    Groups g ON s.group_id = g.id
JOIN 
    Directions d ON g.direction_id = d.id
GROUP BY 
    d.name
ORDER BY 
    d.name;