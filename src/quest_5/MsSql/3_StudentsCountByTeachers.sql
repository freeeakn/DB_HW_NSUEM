SELECT 
    t.surname + ' ' + t.first_name + ' ' + ISNULL(t.last_name, '') AS [ФИО преподавателя],
    COUNT(DISTINCT g.student_id) AS [Кол-во студентов]
FROM 
    Grades g
JOIN 
    Subjects s ON g.subject_id = s.id
JOIN 
    Teachers t ON s.teacher_id = t.id
GROUP BY 
    t.first_name, t.surname, t.last_name
ORDER BY 
    t.surname, t.first_name, t.last_name;