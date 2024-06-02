SELECT AVG(rating.rating) AS average_rating
FROM rating
JOIN students ON rating.students_id = students.id
JOIN subjects ON rating.subjects_id = subjects.id
JOIN teachers ON subjects.teachers_id = teachers.id
WHERE students.students_name = 'добродійка Оксенія Хорішко'
    AND teachers.teachers_name = 'Клавдія Безбородько';
