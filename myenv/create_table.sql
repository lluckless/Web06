-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    students_name VARCHAR(255) UNIQUE NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES students_groups (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teachers_name VARCHAR(255) UNIQUE NOT NULL
);

-- Table: students_groups
DROP TABLE IF EXISTS students_groups;
CREATE TABLE students_groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    groups_name VARCHAR(255) UNIQUE NOT NULL
);


-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subjects_name VARCHAR(255) UNIQUE NOT NULL,
    teachers_id INTEGER,
    FOREIGN KEY (teachers_id) REFERENCES teachers (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: rating
DROP TABLE IF EXISTS rating;
CREATE TABLE rating (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    students_id INTEGER,
    subjects_id INTEGER,
    rating INTEGER NOT NULL,
    date_received DATE NOT NULL,
    FOREIGN KEY (students_id) REFERENCES students (id)
       ON DELETE CASCADE
       ON UPDATE CASCADE,
    FOREIGN KEY (subjects_id) REFERENCES subjects (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
