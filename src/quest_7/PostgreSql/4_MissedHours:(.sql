SELECT CONCAT(
    st.first_name,
    ' ',
    st.last_name,
    ' ',
    st.surname
  ) AS студент,
  s.name AS предмет,
  SUM(EXTRACT(EPOCH FROM (l.end_time - l.start_time))) / 3600 AS общее_время
FROM Students st
  JOIN Attendance a ON st.id = a.id_student
  JOIN Lessons l ON a.id_lesson = l.id
  JOIN Subjects s ON l.id_subject = s.id
GROUP BY st.first_name,
  st.last_name,
  st.surname,
  s.name;