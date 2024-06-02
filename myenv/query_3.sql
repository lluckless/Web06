SELECT students_groups.groups_name, AVG(rating.rating) AS avg_rating
FROM students_groups
JOIN rating ON students.id = rating.students_id
JOIN subjects ON rating.subjects_id = subjects.id
JOIN students ON students_groups.id = students.group_id
WHERE subjects.subjects_name = 'History'
GROUP BY students_groups.groups_name;

