SELECT 
    st.surname + ' ' + st.first_name + ' ' + ISNULL(st.last_name, '') AS [ФИО студента],
    s.name AS Предмет,
    AVG(CAST(g.grade AS DECIMAL(3,1))) AS Средняя_оценка
FROM 
    Students st
JOIN 
    Grades g ON st.id = g.student_id
JOIN 
    Subjects s ON g.subject_id = s.id
WHERE 
    g.grade > 2
GROUP BY 
    st.id, st.surname, st.first_name, st.last_name, s.id, s.name
ORDER BY 
    st.surname, st.first_name, s.name;