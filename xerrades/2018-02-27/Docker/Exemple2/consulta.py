#!/usr/bin/env python2
import pymysql
import pymysql.cursors

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='ies2010',
                             db='colors',
                             charset='utf8mb4',
                             )
try:
    with connection.cursor() as cursor:
        sql = "SELECT `id`, `nom` FROM `color` WHERE `nom` LIKE %s"
        cursor.execute(sql, ('B%'),)
        results = cursor.fetchall()
        for result in results:
            print result[0], " ", result[1]
finally:
    connection.close()
