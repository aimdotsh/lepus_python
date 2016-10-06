# encoding: utf-8
#!/bin/env python
import MySQLdb
import time
import datetime
try:
     db = MySQLdb.connect(host="localhost",user="root",passwd="agm43gadsg",db="lepus",port=3306)
     cursor = db.cursor()
     print (datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S'))
     cursor.execute("select send_sms_to_list from alarm_history;")
     data2 = cursor.fetchone()
     for line in data2:
          send_sms_to_list = line
     cursor.close()
     if send_sms_to_list:
                sms_to_list=send_sms_to_list.split(';')
     print "list : %s " % sms_to_list 
except MySQLdb.Error,e:
     print 'Mysql Error Msg:' , e

sms_to_list2 = '15026792030,18602108965'
print "string : %s " % sms_to_list2
