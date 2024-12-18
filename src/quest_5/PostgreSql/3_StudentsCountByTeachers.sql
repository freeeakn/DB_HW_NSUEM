SELECT 
    CONCAT(t.last_name, ' ', t.first_name, ' ', t.surname) AS "Фио преподавателя",
    COUNT(DISTINCT g.student_id) AS "Кол-во студентов"
FROM 
    Grades g
JOIN 
    Subjects s ON g.subject_id = s.id
JOIN 
    Teachers t ON s.teacher_id = t.id
GROUP BY 
    t.last_name, t.first_name, t.surname
ORDER BY 
    t.last_name, t.first_name, t.surname;