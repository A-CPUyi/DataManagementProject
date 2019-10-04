import mysql.connector
import csv
import os
import time

INSERT_STATEMENT = "INSERT INTO friends_with VALUES(%s, %s)"

def select_and_insert(cursor, csv_file, limit, offset):
    cursor.execute('USE project1_main')
    cursor.execute('SET autocommit = 0')
    cursor.execute('SELECT user_id, friends_list_str FROM user LIMIT {}, {}'.format(offset, limit))

    i = 0
    list = []
    for row in cursor:
        append_list(list, row[0], row[1])

    try:
        cursor.executemany(INSERT_STATEMENT, list)
    except mysql.connector.errors.IntegrityError as e:
        print(e)


    # if os.path.exists(csv_file):
    #     os.remove(csv_file)
    # with open(csv_file, "w") as f:
    #     for row in cursor:
    #         create_csv(f, row[0], row[1])
    #         i += 1
    #
    #
    #
    # with open(csv_file, "r") as f:
    #     execute_statements(cursor, f, INSERT_STATEMENT)

def create_csv(f, user_id, friends_list_str):
    if friends_list_str == 'None' or friends_list_str == None:
        return
    for friend_id in friends_list_str.split(', '):
        if user_id < friend_id:
                f.write("{},{}\n".format(user_id, friend_id))

def append_list(list, user_id, friends_list_str):
    if friends_list_str == 'None' or friends_list_str == None:
        return
    for friend_id in friends_list_str.split(', '):
        if user_id < friend_id:
                list.append((user_id, friend_id))


def execute_statements(cursor, f, statement):
    start = time.time()
    try:
        cursor.executemany(statement, [tuple(row.split(',')) for row in f])
    except mysql.connector.errors.IntegrityError as e:
        print(e)


    end = time.time()
    print(end - start)


limit = 100000
conn = mysql.connector.connect(host='68.180.87.215',
                                         database='project1_main',
                                         user='jss7268',
                                         password='')
cursor = conn.cursor()
start = time.time()

try:

    for offset in range(953100, 1800000, limit):
        print('starting, offset={}'.format(offset))
        start = time.time()

        select_and_insert(cursor, 'friends_with.csv', limit, offset)
        conn.commit()

        end = time.time()
        print(end - start)
        print('ending, offset={}'.format(offset))
finally:

    end = time.time()
    print('final end: {}'.format(end - start))
    cursor.close()
    conn.close()

