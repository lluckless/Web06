SELECT students_id, students_name, AVG(rating.rating) AS average_rating
FROM students
JOIN rating ON students.id = rating.students_id
GROUP BY students_id, students_name
ORDER BY average_rating DESC
LIMIT 5;
