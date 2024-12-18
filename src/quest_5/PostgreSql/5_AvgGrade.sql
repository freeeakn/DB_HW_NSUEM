SELECT 
    CONCAT(st.first_name, ' ', st.surname, ' ', st.last_name) AS "ФИО студента",
    s.name AS Предмет,
    AVG(g.grade) AS Средняя_оценка
FROM 
    Students st
JOIN 
    Grades g ON st.id = g.student_id
JOIN 
    Subjects s ON g.subject_id = s.id
WHERE 
    g.grade > 2
GROUP BY 
    st.first_name, st.surname, st.last_name, s.name
ORDER BY 
    st.surname, st.first_name, s.name;