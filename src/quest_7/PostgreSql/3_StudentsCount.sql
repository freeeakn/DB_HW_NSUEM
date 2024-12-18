SELECT l.date,
  l.start_time,
  COUNT(a.id) AS "Кол-во студентов"
FROM Lessons l
  JOIN Teachers t ON l.id_teacher = t.id
  JOIN Attendance a ON l.id = a.id_lesson
WHERE t.id = 2
GROUP BY l.date,
  l.start_time;