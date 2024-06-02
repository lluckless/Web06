SELECT students.students_name, AVG(rating.rating) AS avg_rating
FROM students
JOIN rating ON students.id = rating.students_id
JOIN subjects ON rating.subjects_id = subjects.id
WHERE subjects.subjects_name = 'History'
GROUP BY students.students_name
ORDER BY avg_rating DESC
LIMIT 1;
