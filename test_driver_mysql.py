#!/usr/bin/env python
#coding:utf-8
import sys
import MySQLdb
path='./include'
sys.path.insert(0,path)
import functions as func
import sendmail
import sendsms_fx
import sendsms_api


def analyze_mysql_processlist(cur_dbmon):
    mail_text =''
    table_head = '''
<table border="1" width="100%">
<tr><th colspan="8">Mysql Active Processlist</th></tr>
'''
    table_body = ''
    processlist_active_warning=0
    longquery_second=0

    try:
        sql = "select host,port,create_time,count(*) cnt from mysql_processlist group by host,port,create_time"
        cur_dbmon.execute(sql)
        g_result = cur_dbmon.fetchall()
        
        for g_line in g_result:
            sql = "select tags,p_user,p_host,p_db,command,time,status,info from mysql_processlist a where a.host='%s' and a.port='%s' and a.create_time='%s' " %(g_line[0],g_line[1],g_line[2]) 
            cur_dbmon.execute(sql)
            result = cur_dbmon.fetchall()
                    
            if int(g_line[3])>=processlist_active_warning:
                table_body +="<tr><td colspan='8'>DBInstanceId:%s | DBPORT:%s | CreateTime:%s | Active process number is %d.</td></tr>\n" %tuple(g_line)
                table_body += "<tr><td>TAGS</td><td>USER</td><td>CLIENT</td><td>DB</td><td>COMMAND</td><td>TIME</td><td>STATE</td><td>INFO</td></tr>\n"
                for line in result:
                    table_body += "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n" %tuple(line)
            else:
                table_head_tmp = ''
                table_body_tmp = ''
                table_head_tmp += "<tr><td colspan='8'>DBInstanceId:%s | DBPORT:%s | CreateTime:%s | Long query</td></tr>\n" %tuple(g_line[0:3])
                table_head_tmp += "<tr><td>TAGS</td><td>USER</td><td>CLIENT</td><td>DB</td><td>COMMAND</td><td>TIME</td><td>STATE</td><td>INFO</td></tr>\n"
                
                for line in result:
                    
                    if line[6] >longquery_second:
                        table_body_tmp += "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n" %tuple(line)
            
                if table_body_tmp:
                    table_body += table_head_tmp + table_body_tmp
                    
            sql = "insert into mysql_processlist_history (server_id,host,port,tags,pid,p_user,p_host,p_db,command,time,status,info,create_time) select server_id,host,port,tags,pid,p_user,p_host,p_db,command,time,status,info,create_time from mysql_processlist where host='%s' and port='%s' and create_time='%s'" %(g_line[0],g_line[1],g_line[2])
            cur_dbmon.execute(sql)
                
            sql = "delete from mysql_processlist where host='%s' and port='%s' and create_time='%s'" %(g_line[0],g_line[1],g_line[2])
            cur_dbmon.execute(sql)
            
        if table_body:
            mail_text += table_head + table_body + "</table>"
        #print mail_text
        result = sendmail.send_mail("xx@xx.xx","mail_subject",mail_text)
    except Exception,e:
        print e
        print "analyze mysql processlist got error"
    
def main():
    host="10.1.70.222"
    username="lepus_user"
    password="lepus_user"
    port="3306"
    conn=MySQLdb.connect(host=host,user=username,passwd=password,port=int(port),connect_timeout=3,charset='utf8')
    conn.select_db('lepus')
    cur=conn.cursor()
    analyze_mysql_processlist(cur)
    conn.commit()
    cur.close()
    conn.close()
if __name__=='__main__':
    main()
