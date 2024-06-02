from random import randint, choice
import sqlite3
from faker import Faker

fake_data = Faker(locale='uk_UA')


def generate_fake_data(number_students, number_teachers, number_groups, subjects) -> tuple:
    fake_students = [fake_data.name() for _ in range(number_students)] 
    fake_groups = [f"Group {i}" for i in range(1, number_groups + 1)]
    fake_teachers = [fake_data.name() for _ in range(number_teachers)]
    
    return fake_students, fake_teachers, fake_groups, subjects

def prepare_data(students, teachers, groups, subjects) -> tuple:
    for_students = [(student, choice(range(1, len(groups) + 1))) for student in students]
    for_groups = [(group,) for group in groups]
    for_subjects = [(subject, choice(range(1, len(teachers) + 1))) for subject in subjects]
    for_teachers = [(teacher,) for teacher in teachers]

    for_ratings = []
    for student_id in range(1, len(students) + 1):
        for subject_id in range(1, len(subjects) + 1):
            date_received = fake_data.date_this_year()
            for_ratings.append((student_id, subject_id, randint(1, 100), date_received))

    return for_students, for_teachers, for_groups, for_subjects, for_ratings


def insert_data_to_db(students, teachers, groups, subjects, ratings) -> None:
    # Створимо з'єднання з нашою БД та отримаємо об'єкт курсору для маніпуляцій з даними
    with sqlite3.connect('create_table.db') as con:
        cur = con.cursor()
     
        sql_to_students = """INSERT INTO students (students_name, group_id) VALUES (?, ?)"""
        cur.executemany(sql_to_students, students)

        sql_to_teachers = """INSERT INTO teachers (teachers_name) VALUES (?)"""
        cur.executemany(sql_to_teachers, teachers)

        sql_to_groups = """INSERT INTO students_groups (groups_name) VALUES (?)"""
        cur.executemany(sql_to_groups, groups)

        sql_to_subjects = """INSERT INTO subjects (subjects_name, teachers_id) VALUES (?, ?)"""
        cur.executemany(sql_to_subjects, subjects)
      
        sql_to_ratings = """INSERT INTO rating (students_id, subjects_id, rating, date_received) VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_ratings, ratings)

        con.commit()


if __name__ == "__main__":
    subjects =['Mathematics', 'Physics', 'Chemistry', 'Biology', 'History', 'Geography', 'Literature', 'Computer Science']
    number_students = 50
    number_teachers = 5
    number_groups = 3

    students, teachers, groups, subjects = generate_fake_data(number_students, number_teachers, number_groups, subjects)
    data = prepare_data(students, teachers, groups, subjects)
    insert_data_to_db(*data)
