SELECT students.students_name
FROM students
JOIN students_groups ON students.group_id = students_groups.id
WHERE students_groups.groups_name = 'Group 1';
