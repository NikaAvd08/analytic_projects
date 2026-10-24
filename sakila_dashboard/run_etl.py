import sqlite3
import os

def run_pipline():
    print("Агрегация данных...")

    os.makedirs('data', exist_ok = True)

    conn = sqlite3.connect('data/sakila.db')
    cursor = conn.cursor()

    with open('sql/vitrine_creation.sql','r', encoding = 'utf-8') as f:
        sql_script = f.read()

    try:
        cursor.executescript(sql_script)
        conn.commit
        print("обновлены витрины в data/vitrine.db")
    except sqlite3.Error as e:
        print(f'Ошибка SQL: {e}')
    finally:
        conn.close()

if __name__ == '__main__':
    run_pipline()