#!/usr/bin/env python
#!/usr/bin/env python
from pymongo import Connection
import time,datetime
import os,sys
connection = Connection('10.1.70.220', 27019)
db = connection['changtest']
def func_time(func):
    def _wrapper(*args,**kwargs):
        start = time.time()
        func(*args,**kwargs)
        print func.__name__,'run:',time.time()-start
    return _wrapper
@func_time
def ainsert(num):
    posts = db.userinfo
    for x in range(num):
        post = {"_id" : str(x),
        "author": str(x)+"Mike",
        "text": "My first blog post!",
        "tags": ["xiaorui", "xiaorui.cc", "rfyiamcool.51cto"],
        "date": datetime.datetime.utcnow()}
        posts.insert(post)
if __name__ == "__main__":
    num = sys.argv[1]
    ainsert(int(num))



'''
from pymongo import MongoClient
from pymongo import DESCENDING
import time

if __name__ == "__main__":
    print "now"
    db = MongoClient("10.1.70.220",27019)
    #db.admin.authenticate(config.monitor_user,config.monitor_passwd)
    curr_ops = db.admin.current_op()["inprog"]
    ops = []
    for curr_op in curr_ops:
        #if curr_op.get("ns") !="local.oplog.rs" and curr_op.get("desc") != 'rsSync' and 'repl' not in curr_op.get("desc") and curr_op.get("secs_running") > 0:
        if curr_op.get("ns") !="local.oplog.rs" and curr_op.get("desc") != 'rsSync' and 'repl' not in curr_op.get("desc") :
            print curr_op.get("client") '''
