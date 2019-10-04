import mysql.connector
import time

UPDATE_STATEMENT = 'UPDATE business_chain SET is_chain=1 WHERE business_name in (%s)'

def update_chains(cursor):
    cursor.execute('USE project1_main')
    cursor.execute('SET autocommit = 0')
    cursor.execute('SELECT business_name from business b join business_location l on b.id = l.id group by business_name having count(DISTINCT l.Address, l.postal_code) > 1')

    list = [row[0] for row in cursor]

    print("updating")
    start = time.time()
    try:
        format_strings = ','.join(['%s'] * len(list))
        cursor.execute(UPDATE_STATEMENT % format_strings, list)
    except mysql.connector.errors.IntegrityError as e:
        print(e)

    end = time.time()
    print(end - start)

conn = mysql.connector.connect(host='68.180.87.215',
                                         database='project1_main',
                                         user='jss7268',
                                         password='')
cursor = conn.cursor()
start = time.time()

try:
    update_chains(cursor)
    conn.commit()

finally:
    end = time.time()
    print('final end: {}'.format(end - start))
    cursor.close()
    conn.close()

