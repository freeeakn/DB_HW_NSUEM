SELECT COUNT(l.id) - COUNT(a.id) AS "Кол-во пропущенных занятий"
FROM Lessons l
  JOIN Subjects s ON l.id_subject = s.id
  LEFT JOIN Attendance a ON l.id = a.id_lesson
WHERE s.name = 'Линейная алгебра';