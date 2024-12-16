SELECT 
    CONCAT(t.surname, ' ', t.first_name, ' ', t.last_name) AS "ФИО преподавателя",
    s.name AS Предмет,
    g.name AS Группа,
    GROUP_CONCAT(st.first_name, ' ', st.surname, ' ', st.last_name SEPARATOR ', ') AS "ФИО студента"
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
    t.id, s.id, g.id
ORDER BY 
    t.surname, s.name, g.name;