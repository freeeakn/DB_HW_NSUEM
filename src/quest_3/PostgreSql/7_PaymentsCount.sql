SELECT 
    g.name AS Группа,
    d.name AS Направление,
    SUM(CASE WHEN ft.name = 'Бюджет' THEN 1 ELSE 0 END) AS Бюджет,
    SUM(CASE WHEN ft.name = 'Платно' THEN 1 ELSE 0 END) AS Платное
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