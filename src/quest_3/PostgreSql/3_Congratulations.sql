SELECT 
    CONCAT(s.surname, ' ', SUBSTR(s.first_name, 1, 1), '. ', SUBSTR(s.last_name, 1, 1), '.') AS ФИО,
    EXTRACT(DAY FROM s.birth_date) AS День,
    TO_CHAR(s.birth_date, 'Month') AS Месяц,
    g.name AS Группа,
    d.name AS Направление
FROM 
    Students s
JOIN 
    Groups g ON s.group_id = g.id
JOIN 
    Directions d ON g.direction_id = d.id
ORDER BY 
    EXTRACT(MONTH FROM s.birth_date);