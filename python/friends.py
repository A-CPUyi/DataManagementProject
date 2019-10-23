import mysql.connector
import time

INSERT_FRIENDS = "INSERT INTO friends_with VALUES(%s, %s)"
INSERT_CHECKIN = "INSERT INTO business_checkin VALUES (%s, %s, %s)"
FRIENDS_SELECT = 'SELECT user_id, friends_list_str FROM user LIMIT {}, {}'
CHECKIN_SELECT = "SELECT business_id, dates FROM checkin LIMIT {}, {}"

def select_and_insert(cursor, limit, offset, type):
    cursor.execute('USE project1_main')
    cursor.execute('SET autocommit = 0')
    if type == "friends":
        select_statement = FRIENDS_SELECT
        insert_statement = INSERT_FRIENDS
    else:
        select_statement = CHECKIN_SELECT
        insert_statement = INSERT_CHECKIN

    cursor.execute(select_statement.format(offset, limit))

    list = []
    if type == "friends":
        for row in cursor:
            append_list(list, row[0], row[1])
    else:
        set = dict()
        for row in cursor:
            set[row[0]] = dict()
            for date in row[1].split(', '):
                set[row[0]][date] = set[row[0]].get(date, 0) + 1

        for id, dates in set.items():
            for date, num in dates.items():
                list.append((id, date, num))

    try:
        cursor.executemany(insert_statement, list)
    except mysql.connector.errors.IntegrityError as e:
        print(e)

def append_list(list, user_id, friends_list_str):
    if friends_list_str == 'None' or friends_list_str == None:
        return
    for friend_id in friends_list_str.split(', '):
        if user_id < friend_id:
                list.append((user_id, friend_id))


limit = 5000
conn = mysql.connector.connect(host='68.180.87.215',
                                         database='project1_main',
                                         user='jss7268',
                                         password='')
cursor = conn.cursor()
start = time.time()

try:

    for offset in range(3000, 162000, limit):
        print('starting, offset={}'.format(offset))
        start = time.time()

        select_and_insert(cursor, limit, offset, 'checkin') # or friends
        conn.commit()

        end = time.time()
        print(end - start)
        print('ending, offset={}'.format(offset))
finally:

    end = time.time()
    print('final end: {}'.format(end - start))
    cursor.close()
    conn.close()

