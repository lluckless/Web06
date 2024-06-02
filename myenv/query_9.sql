SELECT subjects.subjects_name
FROM subjects
JOIN rating ON subjects.id = rating.subjects_id
JOIN students ON rating.students_id = students.id
WHERE students.students_name = 'Амалія Смик';
