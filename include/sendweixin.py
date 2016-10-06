#!/usr/bin/python

# coding: utf-8





import urllib,urllib2

import json

import sys



def gettoken(corpid,corpsecret):

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



def senddata(access_token,user,content):

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

    print str(response)



if __name__ == '__main__':

    user = str(sys.argv[1])

    content = str(sys.argv[2])

    corpid = 'wxcd12c6a577e5bd64'
    corpsecret = 'Utr3-11FYTa80rTW6CTwSS1ysoqLOAlcALzVzJkueefRJNuVke4cKqQuMzTd9bGa'

    accesstoken = gettoken(corpid,corpsecret)
    print "what happen"
    print accesstoken
    senddata(accesstoken,user,content)