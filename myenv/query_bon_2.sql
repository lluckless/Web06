SELECT rating.rating
FROM rating
JOIN students ON rating.students_id = students.id
JOIN subjects ON rating.subjects_id = subjects.id
JOIN students_groups ON students.group_id = students_groups.id
WHERE subjects.subjects_name = 'Chemistry' 
    AND students_groups.groups_name = 'Group 3'
    AND rating.date_received = (
        SELECT MAX(rating.date_received)
        FROM rating
);

