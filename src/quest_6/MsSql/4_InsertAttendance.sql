INSERT INTO Attendance (id_lesson, id_student)
SELECT l.id, st.id
FROM Lessons l
JOIN Groups g ON l.id_group = g.id
JOIN Students st ON g.id = st.group_id
WHERE l.date = '2024-09-01' AND l.id_group = 1;

INSERT INTO Attendance (id_lesson, id_student)
SELECT l.id, st.id
FROM Lessons l
JOIN Groups g ON l.id_group = g.id
JOIN Students st ON g.id = st.group_id
WHERE l.date = '2024-09-02' AND l.id_group = 6;

INSERT INTO Attendance (id_lesson, id_student)
SELECT l.id, st.id
FROM Lessons l
JOIN Groups g ON l.id_group = g.id
JOIN Students st ON g.id = st.group_id
WHERE l.date = '2024-09-03' AND l.id_group = 9;