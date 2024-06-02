import sqlite3

# Підключення до бази даних SQLite
conn = sqlite3.connect('create_table.db')
cursor = conn.cursor()

# Отримання списку всіх таблиць, ігноруючи sqlite_sequence
cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name != 'sqlite_sequence';")
tables = cursor.fetchall()

# Видалення кожної таблиці
for table in tables:
    table_name = table[0]
    cursor.execute(f"DROP TABLE IF EXISTS {table_name};")

# Збереження змін до бази даних
conn.commit()

# Закриття з'єднання з базою даних
conn.close()
