#!/usr/bin/env python
#coding:utf-8
import sys
import MySQLdb
import pymongo
import bson
path='./include'
sys.path.insert(0,path)
import functions as func
import sendmail
import sendsms_fx
import sendsms_api


def analyze_mongodb_currentop(cur_dbmon):
    mail_text = ''
    table_head = '''
<table border="1" width="100%">
<tr><th colspan="11">Mongodb Active Processlist</th></tr>
'''
    table_body = ''
     
    try:
        #sql = "select a.ServerId,b.Host,b.Description,a.CreateTime,count(a.id) cnt from mongodb_current_op a,mongodb_list b  where a.ServerId=b.Id group by a.ServerId,a.CreateTime"
        sql = "select a.host,a.port,a.CreateTime,count(*) cnt,a.uuid from mongodb_current_op a group by a.host,a.port,a.uuid"
        processlist_active_warning=0
        longquery_second=0
        cur_dbmon.execute(sql)
        g_result =cur_dbmon.fetchall()
        
        for g_line in g_result:
            sql = "select a.Op_desc ,a.Secs_running ,a.Op ,a.Ns ,a.Op_query ,a.Op_insert ,a.Client ,a.Msg ,a.Locks ,a.WaitingForLock ,a.LockStats from mongodb_current_op a where a.host = '%s' and a.port='%s'  and a.uuid = '%s'" %(g_line[0],g_line[1],g_line[4])
            cur_dbmon.execute(sql)
            result =cur_dbmon.fetchall()
            
            if int(g_line[3])>=processlist_active_warning:
                table_body +="<tr><td colspan='11'>Server:%s | DB_PORT:%s | ServerTime:%s | Active process number is %d.</td></tr>\n" %tuple(g_line[0:4])
                table_body += "<td>Op_desc</td><td>Secs_running</td><td>Op</td><td>Ns</td><td>Op_query</td><td>Op_insert</td><td>Client</td><td>Msg</td><td>Locks</td><td>WaitingForLock</td><td>LockStats</td></tr>\n"
                for line in result:
                    table_body += "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n" %tuple(line)
            else:
                table_head_tmp = ''
                table_body_tmp = ''
                table_head_tmp += "<tr><td colspan='11'>Server:%s | DB_PORT:%s | ServerTime:%s | Long query</td></tr>\n" %tuple(g_line[0:3])
                table_head_tmp += "<td>Op_desc</td><td>Secs_running</td><td>Op</td><td>Ns</td><td>Op_query</td><td>Op_insert</td><td>Client</td><td>Msg</td><td>Locks</td><td>WaitingForLock</td><td>LockStats</td></tr>\n"
                
                for line in result:
                    
                    if line[1] >longquery_second:
                        table_body_tmp += "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n" %tuple(line)
                
                if table_body_tmp:
                    table_body += table_head_tmp + table_body_tmp       
        
        
        
            sql = "insert into mongodb_current_op_his(host,port,Op_desc ,Secs_running ,Op ,Ns ,Op_query ,Op_insert ,Client ,Msg ,Locks ,WaitingForLock ,LockStats ,CreateTime,uuid) select host,port,Op_desc ,Secs_running ,Op ,Ns ,Op_query ,Op_insert ,Client ,Msg ,Locks ,WaitingForLock ,LockStats ,CreateTime,uuid from mongodb_current_op where host='%s' and port='%s' and uuid='%s'" %(g_line[0],g_line[1],g_line[4]) 
            cur_dbmon.execute(sql)
            
            sql = "delete from mongodb_current_op where host='%s' and port='%s' and uuid='%s'" %(g_line[0],g_line[1],g_line[4])
            cur_dbmon.execute(sql)
        
        if table_body:
            mail_text += table_head + table_body + "</table>"
        result = sendmail.send_mail("changjingxiu@wondersgroup.com","mail_subject",mail_text)
    except Exception,e:
        print "analyze_mongodb_currentop got error:%s" %e

def main():
    host="10.1.70.222"
    username="lepus_user"
    password="lepus_user"
    port="3306"
    conn=MySQLdb.connect(host=host,user=username,passwd=password,port=int(port),connect_timeout=3,charset='utf8')
    conn.select_db('lepus')
    cur=conn.cursor()
    analyze_mongodb_currentop(cur)
    conn.commit()
    cur.close()
    conn.close()
if __name__=='__main__':
    main()
