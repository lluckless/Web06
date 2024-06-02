SELECT students.students_name, rating.rating
FROM students
JOIN rating ON students.id = rating.students_id
JOIN subjects ON rating.subjects_id = subjects.id
JOIN students_groups ON students.group_id = students_groups.id
WHERE students_groups.groups_name = 'Group 2' 
  AND subjects.subjects_name = 'History';