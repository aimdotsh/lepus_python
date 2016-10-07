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
import urllib,urllib2

import json

import sys



def gettoken():
    corpid = 'xx'
    corpsecret = 'xx-xx'
    gettoken_url = 'https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=' + corpid + '&corpsecret=' + corpsecret

    try:

        token_file = urllib2.urlopen(gettoken_url)

    except urllib2.HTTPError as e:

        print e.code

        print e.read().decode("utf8")

        sys.exit()

    token_data = token_file.read().decode('utf-8')

    token_json = json.loads(token_data)

    token_json.keys()

    token = token_json['access_token']

    return token



def senddata(user,content):
    access_token = gettoken()
    send_url = 'https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=' + access_token
    send_values = {
        #"touser":"@all",
        "touser":user,
        "toparty":"2",
        "msgtype":"text",
        "agentid":"1",
        "text":{
            "content":content
           },
        "safe":"0"
        }
    send_data = json.dumps(send_values, ensure_ascii=False)
    print send_data
    send_request = urllib2.Request(send_url, send_data)
    print send_request
    response = json.loads(urllib2.urlopen(send_request).read())
    print response

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
    sms_msg = sms_msg+'[Lepus]'
    arr = sms_to_list.split(';')
    try:
        for i in arr:
            try:
                senddata(i,sms_msg)
            except Exception, e:
                print str(e)
        return True
    except Exception, e:
        print str(e)
        return False

# def send_sms(sms_to_list,sms_msg,db_type,application,host,port,level,alarm_item,alarm_value,message):
#     '''
#     sms_to_list:发给谁
#     sms_msg:短信内容
#     sms_msg='['+level+'] '+db_type+'-'+tags+'-'+server+' '+message+' Time:'+create_time.strftime('%Y-%m-%d %H:%M:%S')
#     sms_to_list_comma:多个短信接收者，用逗号拼接
#     sms_to_list_semicolon:多个短信接收者，用分号拼接
#     sms_to_list_comma = ",".join(sms_to_list)
#     sms_to_list_semicolon = ";".join(sms_to_list)
#     payload = {'mobiles':sms_to_list_comma,'content':sms_msg}
#     '''
#     sms_msg = sms_msg+'[Lepus]'
#     arr = sms_to_list.split(',')
#     try:
#         for i in arr:
#             payload = {'mobiles':i,'content':sms_msg}
#             try:
#                 r = requests.post('http://XX-XXX.com/XX/XX/XX.html',data=payload)
#             except Exception, e:
#                 print str(e)
#         return True
#     except Exception, e:
#         print str(e)
#         return False


if __name__ == '__main__':
    #user = str(sys.argv[1])
    #content = str(sys.argv[2])
    user = "changjingxiu"
    content = "test"
    print "test"
    senddata(user,content)