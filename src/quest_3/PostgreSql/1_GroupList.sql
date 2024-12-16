SELECT 
    CONCAT(s.surname, ' ', s.first_name, ' ', s.last_name) AS ФИО,
    ft.name AS "Тип обучения",
    g.name AS Группа,
    d.name AS Направление
FROM 
    Students s
JOIN 
    Groups g ON s.group_id = g.id
JOIN 
    Directions d ON g.direction_id = d.id
JOIN 
    FundingTypes ft ON s.funding_type_id = ft.id
WHERE 
    d.id = 1
ORDER BY 
    s.surname, s.first_name, s.last_name;