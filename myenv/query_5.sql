SELECT subjects.subjects_name
FROM subjects
JOIN teachers ON subjects.teachers_id = teachers.id
WHERE teachers.teachers_name = 'Богодар Гаврилець';

