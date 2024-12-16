SELECT 
    g.name AS Группа,
    AVG(COALESCE(gr.grade, 0)) AS "Средняя оценка"
FROM 
    Groups g
JOIN 
    Students st ON g.id = st.group_id
LEFT JOIN 
    Grades gr ON st.id = gr.student_id
GROUP BY 
    g.name
ORDER BY 
    AVG(COALESCE(gr.grade, 0)) DESC
LIMIT 1;