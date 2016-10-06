#!/bin/env python
#-*-coding:utf-8-*-
import os
import sys
import time
import string
import ast
import requests
reload(sys) 
sys.setdefaultencoding('utf8')
import ConfigParser
import MySQLdb
path='./include' 
sys.path.insert(0,path)
import functions as func

sql="select a.server_id,a.connect,a.threads_connected,a.threads_running,a.threads_waits,a.create_time,a.host,a.port,b.alarm_threads_connected,b.alarm_threads_running,alarm_threads_waits,b.threshold_warning_threads_connected,b.threshold_critical_threads_connected,b.threshold_warning_threads_running,b.threshold_critical_threads_running,threshold_warning_threads_waits,threshold_critical_threads_waits,b.send_mail,b.send_mail_to_list,b.send_sms,b.send_sms_to_list,b.tags,'mysql' as db_type from mysql_status a, db_servers_mysql b where a.server_id=b.id and a.server_id=283;"

result=func.mysql_query(sql) 
#for line in result:
#    smsto_list=line[20]



smsto_list="15026610800"

def send_sms(sms_to_list,sms_msg,db_type,application,host,port,level,alarm_item,alarm_value,message):
    '''
    sms_to_list:发给谁
    sms_msg:短信内容
    sms_msg='['+level+'] '+db_type+'-'+tags+'-'+server+' '+message+' Time:'+create_time.strftime('%Y-%m-%d %H:%M:%S')
    sms_to_list_comma:多个短信接收者，用逗号拼接
    sms_to_list_semicolon:多个短信接收者，用分号拼接
    sms_to_list_comma = ",".join(sms_to_list)
    sms_to_list_semicolon = ";".join(sms_to_list)
    payload = {'mobiles':sms_to_list_comma,'content':sms_msg}
    '''
    sms_msg = sms_msg
    arr = sms_to_list.split(',')
    try:
        for i in arr:
            payload = {'mobiles':i,'content':sms_msg}
            try:
                print i
                r = requests.post('http://service-sms.d.pa.com/interface/send/costom.html',data=payload)
                print r.url
            except Exception, e:
                print str(e)
        return True
    except Exception, e:
        print str(e)
        return False

if __name__ == '__main__':   
    #print result     
    if send_sms(smsto_list,"testsend1","split","application","host","port","level","alarm_item","alarm_value","message"):  
        print "发送成功"  
    else:  
        print "发送失败" 
