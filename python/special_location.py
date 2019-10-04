import mysql.connector
import time

SPECIAL_LOCATIONS = [
    ('airport','airport', 'airports'),
    ('train station', '', 'train station'),
    ('shopping center', 'mall', 'shopping centers'),
    ('shopping center', 'shopping center', 'shopping centers')

]
INSERT_STATEMENT = '''INSERT INTO located_in
(SELECT b.id, l.id, '{}' FROM business b,
  (SELECT id, Address, postal_code, business_name from business WHERE Address <> "\\"\\"" AND business_name LIKE '%{}%' AND categories LIKE '%{}%') l
  WHERE b.id <> l.id AND b.address = l.address AND b.postal_code = l.postal_code)'''


def select_and_insert(cursor):
    cursor.execute('USE project1_main')
    cursor.execute('SET autocommit = 0')
    start = time.time()
    for tuple in SPECIAL_LOCATIONS:
        try:
            print(INSERT_STATEMENT.format(tuple[0], tuple[1], tuple[2]))
            cursor.execute(INSERT_STATEMENT.format(tuple[0], tuple[1], tuple[2]))
        except mysql.connector.errors.IntegrityError as e:
            print(e)

    end = time.time()
    print(end - start)

def execute_statements(cursor, f, statement):
    start = time.time()
    try:
        cursor.executemany(statement, [tuple(row.split(',')) for row in f])
    except mysql.connector.errors.IntegrityError as e:
        print(e)

    end = time.time()
    print(end - start)


limit = 1000
conn = mysql.connector.connect(host='68.180.87.215',
                               database='project1_main',
                               user='jss7268',
                               password='Iceemrr8')
cursor = conn.cursor()
start = time.time()

try:
    select_and_insert(cursor)
    conn.commit()

    # for offset in range(0, 1800000, limit):
    #     print('starting, offset={}'.format(offset))
    #     select_and_insert(cursor, 'friends_with.csv', limit, offset)
    #     print('ending, offset={}'.format(offset))
    #     conn.commit()
finally:

    end = time.time()
    print('final end: {}'.format(end - start))
    cursor.close()
    conn.close()
