SELECT 
    CONCAT(s.surname, ' ', SUBSTR(s.first_name, 1, 1), '. ', SUBSTR(s.last_name, 1, 1), '.') AS ФИО,
    DAY(s.birth_date) AS День,
    MONTHNAME(s.birth_date) AS Месяц,
    g.name AS Группа,
    d.name AS Направление
FROM 
    Students s
JOIN 
    Groups g ON s.group_id = g.id
JOIN 
    Directions d ON g.direction_id = d.id
ORDER BY 
    MONTH(s.birth_date);