SELECT 
    CONCAT(s.surname, ' ', s.first_name, ' ', s.last_name) AS ФИО,
    TIMESTAMPDIFF(YEAR, s.birth_date, CURDATE()) AS Возраст
FROM 
    Students s
ORDER BY 
    s.surname, s.first_name, s.last_name;