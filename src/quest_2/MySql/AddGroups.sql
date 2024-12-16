INSERT INTO Groups (name, direction_id)
SELECT name, (SELECT id FROM Directions WHERE name = sub.direction_name)
FROM (
    SELECT 'Разработка ПО 1' AS name, 'Информационные технологии' AS direction_name UNION ALL
    SELECT 'Веб-разработка 1', 'Информационные технологии' UNION ALL
    SELECT 'Системное администрирование 1', 'Информационные технологии' UNION ALL
    SELECT 'Финансы 1', 'Финансы и экономика' UNION ALL
    SELECT 'Экономика 1', 'Финансы и экономика' UNION ALL
    SELECT 'Бухгалтерский учет 1', 'Финансы и экономика' UNION ALL
    SELECT 'История 1', 'Гуманитарные науки' UNION ALL
    SELECT 'Филология 1', 'Гуманитарные науки' UNION ALL
    SELECT 'Психология 1', 'Гуманитарные науки'
) AS sub;
