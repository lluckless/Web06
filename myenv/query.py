import sqlite3

def execquery():
    with sqlite3.connect('create_table.db') as con:
        cursor = con.cursor()
        
        with open('query_3.sql', "r") as file:
            que = file.read()
        
        # виконуємо скрипт із файлу, який створить таблиці в БД
        cursor.execute(que)

        results = cursor.fetchall()
        print(results)

if __name__ == "__main__":
    execquery()
