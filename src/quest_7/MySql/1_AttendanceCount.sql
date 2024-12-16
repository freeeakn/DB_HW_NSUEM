SELECT COUNT(a.id) AS "Кол-во посещенных занятий"
FROM Attendance a
  JOIN Lessons l ON a.id_lesson = l.id
  JOIN Subjects s ON l.id_subject = s.id
WHERE s.name = 'Математический анализ';