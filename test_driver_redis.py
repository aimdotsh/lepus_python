#!/usr/bin/env python
#coding:utf-8
import sys

try:
    import redis
    host="10.1.70.222"
    print "Redis python drivier is ok!"
    r=redis.StrictRedis(host=host,port=7000,db=0,socket_timeout=3,encoding='utf-8')
    info=r.info()
    print  info['redis_version']
    x="50"
    y="600"
    if x>y:
        print x
    else :
        print y
except Exception, e:
    print e
    sys.exit(1)

finally:
    sys.exit(1)



