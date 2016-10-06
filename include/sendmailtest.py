#!/bin/env python
#-*-coding:utf-8-*-

import string
import sys 
reload(sys) 
sys.setdefaultencoding('utf8')
import ConfigParser
import smtplib
from email.mime.text import MIMEText
from email.message import Message
from email.header import Header
#import functions as func


mail_host = "mail.xx.com"
mail_port = "25"
mail_user = "xx"
mail_pass = "xx2009"
mail_send_from = "fullway@xx.com"
mailto="changjingxiu@xx.com"
mailto_list=mailto.split(";")

def send_mail(to_list,sub,content):
    '''
    to_list:发给谁
    sub:主题
    content:内容
    send_mail("aaa@126.com","sub","content")
    '''
    #me=mail_user+"<</span>"+mail_user+"@"+mail_postfix+">"
    me=mail_send_from
    msg = MIMEText(content, _subtype='html', _charset='utf8')
    msg['Subject'] = Header(sub,'utf8')
    msg['From'] = Header(me,'utf8')
    msg['To'] = ";".join(to_list)
    try:
        smtp = smtplib.SMTP()
        smtp.connect(mail_host,mail_port)
        #smtp.login(mail_user,mail_pass)
        smtp.sendmail(me,to_list, msg.as_string())
        smtp.close()
        return True
    except Exception, e:
        print str(e)
        return False

#def main():

if __name__ == '__main__':        
    if send_mail(mailto_list,"test","sddddplit"):  
        print "发送成功"  
    else:  
        print "发送失败"                                                                                                                                                                              
