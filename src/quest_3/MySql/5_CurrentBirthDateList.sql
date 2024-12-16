SELECT 
    CONCAT(s.surname, ' ', s.first_name, ' ', s.last_name) AS ФИО,
    DAY(s.birth_date) AS День,
    MONTHNAME(s.birth_date) AS Месяц
FROM 
    Students s
WHERE 
    MONTH(s.birth_date) = MONTH(CURDATE())
ORDER BY 
    s.surname, s.first_name, s.last_name;