SELECT AVG(rating.rating) AS avg_rating
FROM rating
JOIN subjects ON rating.subjects_id = subjects.id
JOIN teachers ON subjects.teachers_id = teachers.id
WHERE teachers.teachers_name = 'Юстина Жарко';
