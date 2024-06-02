SELECT subjects.subjects_name
FROM subjects
JOIN rating ON subjects.id = rating.subjects_id
JOIN students ON rating.students_id = students.id
JOIN teachers ON subjects.teachers_id = teachers.id
WHERE students.students_name = 'добродійка Оксенія Хорішко'
	AND teachers.teachers_name = 'Клавдія Безбородько';
    