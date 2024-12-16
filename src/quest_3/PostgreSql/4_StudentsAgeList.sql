SELECT 
    CONCAT(s.surname, ' ', s.first_name, ' ', s.last_name) AS ФИО,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, s.birth_date)) AS Возраст
FROM 
    Students s
ORDER BY 
    s.surname, s.first_name, s.last_name;