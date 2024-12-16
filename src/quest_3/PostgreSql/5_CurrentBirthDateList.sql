SELECT 
    CONCAT(s.surname, ' ', s.first_name, ' ', s.last_name) AS ФИО,
    EXTRACT(DAY FROM s.birth_date) AS День,
    TO_CHAR(s.birth_date, 'Month') AS Месяц
FROM 
    Students s
WHERE 
    EXTRACT(MONTH FROM s.birth_date) = EXTRACT(MONTH FROM CURRENT_DATE)
ORDER BY 
    s.surname, s.first_name, s.last_name;