SELECT 
    g.name AS Группа,
    d.name AS Направление,
    SUM(IF(ft.name = 'Бюджет', 1, 0)) AS Бюджет,
    SUM(IF(ft.name = 'Платно', 1, 0)) AS Платное
FROM 
    Students s
JOIN 
    Groups g ON s.group_id = g.id
JOIN 
    Directions d ON g.direction_id = d.id
JOIN 
    FundingTypes ft ON s.funding_type_id = ft.id
GROUP BY 
    g.name, d.name
ORDER BY 
    g.name, d.name;