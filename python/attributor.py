import mysql.connector
import time
import json
import re

ATTRIBUTES = [
    ('business', 'good_for_kids', 'GoodForKids'),
    ('business', 'accepts_credit_cards', 'BusinessAcceptsCreditCards'),
    ('business', 'parking', 'BusinessParking'),
    ('food', 'good_for_groups', 'RestaurantsGoodForGroups'),
    ('food', 'delivery', 'RestaurantsDelivery'),
    #('food', 'alcohol', 'Alcohol'),
    ('food', 'reservations', 'RestaurantsReservations'),
    ('food', 'outdoor_seating', 'OutdoorSeating'),
    ('food', 'good_for_meal', 'GoodForMeal'),
    ('food', 'table_service', 'RestaurantsTableService'),
    ('shopping', 'wheelchair_accessible', 'WheelchairAccessible'),
    ('shopping', 'dogs_allowed', 'DogsAllowed'),
    ('beauty', 'accepts_insurance', 'AcceptsInsurance'),

]

WEAK_ATTRIBUTES = [
    #('beauty', 'beauty_hair_specializes_in', 'HairSpecializesIn'),
    ('food', 'food_ambience', 'Ambience')
]

UPDATE_STATEMENT = 'UPDATE {} SET {}={} WHERE id in (%s)'
UPDATE_ALCOHOL = 'UPDATE food SET alcohol={} WHERE id in (%s)'
INSERT_WEAK = 'INSERT INTO {} VALUES (%s, %s, %s)'
SELECT_WEAK = 'SELECT id, attributes FROM business WHERE id in (SELECT id from {}) and attributes LIKE "%{}%"'


def update_simple(cursor, tup):
    cursor.execute('USE project1_main')
    cursor.execute('SET autocommit = 0')
    cursor.execute('SELECT id, attributes FROM business WHERE attributes LIKE "%{}%"'.format(tup[2]))

    # a list for true, and a list for false
    lists = ([], [])
    for row in cursor:
        if 'True' in json.loads(row[1])[tup[2]]:
            lists[1].append(row[0])
        else:
            lists[0].append(row[0])

    print("updating")
    start = time.time()
    for i in range(2):
        if (len(lists[i])):
            try:
                format_strings = ','.join(['%s'] * len(lists[i]))
                cursor.execute(UPDATE_STATEMENT.format(tup[0], tup[1], i) % format_strings,
                               tuple(lists[i]))
            except mysql.connector.errors.IntegrityError as e:
                print(e)

    end = time.time()
    print(end - start)

def update_alcohol(cursor):
    cursor.execute('USE project1_main')
    cursor.execute('SET autocommit = 0')
    cursor.execute('SELECT id, attributes FROM business WHERE id in (SELECT id from FOOD) and attributes LIKE "%Alcohol%"')

    types = dict()
    for row in cursor:
        # create a dictionary of alcohol types with the business ids in an array as the values
        value = json.loads(row[1])['Alcohol'].lower()
        if value[0] == 'u':
            value = value[1:]
        if value == None:
            value = 'none'
        value = re.sub('[\'\"]', '', value)
        types.setdefault(value, []).append(row[0])

    for key in types.keys():
        format_strings = ','.join(['%s'] * len(types[key]))

        # insert the value into the types tuple
        types[key].insert(0, key)
        try:
            # format in another %s after to determine the column value
            cursor.execute((UPDATE_ALCOHOL % format_strings).format('%s'), tuple(types[key]))
        except mysql.connector.errors.IntegrityError as e:
            print(e)


def update_weak(cursor, select_table, insert_table, attribute):
    cursor.execute('USE project1_main')
    cursor.execute('SET autocommit = 0')
    cursor.execute(SELECT_WEAK.format(select_table, attribute))

    insert_rows = []
    for row in cursor:
        # create a dictionary of HairSpecializesIn types with the business ids in an array as the values
        value = json.loads(row[1])[attribute].lower()
        if value == 'none' or value == None:
            continue
        specialties = json.loads(value.replace('\'', '\"'))
        for (key, value) in specialties.items():
            insert_rows.append([row[0], key, value])
    try:
        cursor.executemany(INSERT_WEAK.format(insert_table), insert_rows)
    except mysql.connector.errors.IntegrityError as e:
        print(e)


conn = mysql.connector.connect(host='68.180.87.215',
                                         database='project1_main',
                                         user='jss7268',
                                         password='Iceemrr8')
cursor = conn.cursor()
start = time.time()

try:

    '''for tup in ATTRIBUTES:
        print('starting, attribute={}'.format(tup[2]))
        update_simple(cursor, tup)
        print('ending, attribute={}'.format(tup[2]))
        conn.commit()
    update_alcohol(cursor)
    conn.commit()'''

    for tup in WEAK_ATTRIBUTES:
        print('starting, weak attribute={}'.format(tup[2]))
        update_weak(cursor, *tup)
        print('ending, weak attribute={}'.format(tup[2]))
        conn.commit()


finally:

    end = time.time()
    print('final end: {}'.format(end - start))
    cursor.close()
    conn.close()

