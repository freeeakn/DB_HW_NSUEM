SELECT 
    t.surname + ' ' + t.first_name + ' ' + ISNULL(t.last_name, '') AS [ФИО преподавателя],
    s.name AS Предмет,
    g.name AS Группа,
    STRING_AGG(st.first_name + ' ' + st.surname + ' ' + ISNULL(st.last_name, ''), ', ') AS [ФИО студента]
FROM 
    Subjects s
JOIN 
    Teachers t ON s.teacher_id = t.id
JOIN 
    Directions d ON s.direction_id = d.id
JOIN 
    Groups g ON d.id = g.direction_id
JOIN 
    Students st ON g.id = st.group_id
LEFT JOIN 
    Grades gr ON st.id = gr.student_id AND s.id = gr.subject_id
GROUP BY 
    t.id, t.surname, t.first_name, t.last_name, s.id, s.name, g.id, g.name
ORDER BY 
    t.surname, s.name, g.name;