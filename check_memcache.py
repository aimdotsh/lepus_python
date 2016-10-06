#!/usr/bin/env python
#coding:utf-8
import os
import sys
import string
from time import sleep
import datetime
import MySQLdb
import memcache
import logging
import logging.config
logging.config.fileConfig("etc/logger.ini")
logger = logging.getLogger("lepus")
path='./include'
sys.path.insert(0,path)
import functions as func
from multiprocessing import Process;


def check_memcache(host,port,server_id,tags):
    try:
        connect_db=memcache.Client(["%s:%s" % (host,port)])
        serverStatus=connect_db.get_stats()
        sleep(1)
        serverStatus_2=connect_db.get_stats()
	connect=1
        pid=serverStatus[0][1]['pid']
        total_items=serverStatus[0][1]['total_items']
        uptime=serverStatus[0][1]['uptime']
        version=serverStatus[0][1]['version']
        limit_maxbytes=serverStatus[0][1]['limit_maxbytes']
        rusage_user=serverStatus[0][1]['rusage_user']
        bytes_read=serverStatus[0][1]['bytes_read']
        rusage_system=serverStatus[0][1]['rusage_system']
        cmd_get=serverStatus[0][1]['cmd_get']
        curr_connections=serverStatus[0][1]['curr_connections']
        threads=serverStatus[0][1]['threads']
        total_connections=serverStatus[0][1]['total_connections']
        cmd_set=serverStatus[0][1]['cmd_set']
        curr_items=serverStatus[0][1]['curr_items']
        get_misses=serverStatus[0][1]['get_misses']
        evictions=serverStatus[0][1]['evictions']
        bytes=serverStatus[0][1]['bytes']
        connection_structures=serverStatus[0][1]['connection_structures']
        bytes_written=serverStatus[0][1]['bytes_written']
        time=serverStatus[0][1]['time']
        pointer_size=serverStatus[0][1]['pointer_size']
        get_hits=serverStatus[0][1]['get_hits']
        network_bytesIn_persecond = int(serverStatus_2[0][1]['bytes_written']) - int(serverStatus[0][1]['bytes_written'])
        network_bytesOut_persecond =int(serverStatus_2[0][1]['bytes_read']) - int(serverStatus[0][1]['bytes_read'])
        opcounters_get_persecond = int(serverStatus_2[0][1]['cmd_get']) - int(serverStatus[0][1]['cmd_get'])
        opcounters_set_persecond = int(serverStatus_2[0][1]['cmd_set']) - int(serverStatus[0][1]['cmd_set'])
        opcounters_get_rate=(int(serverStatus_2[0][1]['get_hits'])-int(serverStatus[0][1]['get_hits']))*10000 /(int(serverStatus_2[0][1]['cmd_get'])-int(serverStatus[0][1]['cmd_get'])+1)
      ##################### insert data to mysql server#############################
        sql = "replace into memcache_status(server_id,host,port,tags,connect,pid,total_items,uptime,version,limit_maxbytes,rusage_user,bytes_read,rusage_system,cmd_get,curr_connections,threads,total_connections,cmd_set,curr_items,get_misses,evictions,bytes,connection_structures,bytes_written,time,pointer_size,get_hits,network_bytesIn_persecond,network_bytesOut_persecond,opcounters_get_persecond,opcounters_set_persecond,opcounters_get_rate) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"
        param = (server_id,host,port,tags,connect,pid,total_items,uptime,version,limit_maxbytes,rusage_user,bytes_read,rusage_system,cmd_get,curr_connections,threads,total_connections,cmd_set,curr_items,get_misses,evictions,bytes,connection_structures,bytes_written,time,pointer_size,get_hits,network_bytesIn_persecond,network_bytesOut_persecond,opcounters_get_persecond,opcounters_set_persecond,opcounters_get_rate)
	func.mysql_exec(sql,param)
        role='m'
        func.update_db_status_init(role,version,host,port,tags)
    except Exception, e:
        logger_msg="check memcache %s:%s : %s" %(host,port,e)
        logger.warning(logger_msg)
        try:
            curr_connections=0
            sql="replace into memcache_status(server_id,host,port,tags,curr_connections) values(%s,%s,%s,%s,%s)"
            param=(server_id,host,port,tags,curr_connections)
            func.mysql_exec(sql,param)
        except Exception, e:
            logger.error(e)
            sys.exit(1)
        finally:
            sys.exit(1)
    finally:
        func.check_db_status(server_id,host,port,tags,'memcache')   
        sys.exit(1)

def main():
    func.mysql_exec("replace into memcache_status_history  SELECT *,LEFT(REPLACE(REPLACE(REPLACE(create_time,'-',''),' ',''),':',''),12) from memcache_status;",'')
    func.mysql_exec('delete from memcache_status where server_id not in (select id from db_servers_memcache where monitor=1);','')
    #func.mysql_exec('delete from memcache_status;','')
    #get memcache servers list
    servers = func.mysql_query('select id,host,port,tags from db_servers_memcache where is_delete=0 and monitor=1;')
    logger.info("check memcache controller started.")
    if servers:
    	 plist = []
         for row in servers:
             server_id=row[0]
             host=row[1]
             port=row[2]
             tags=row[3]
             p = Process(target = check_memcache, args = (host,port,server_id,tags))
             plist.append(p)
             p.start()

         for p in plist:
             p.join()

    else:
         logger.warning("check memcache: not found any servers")
    logger.info("check memcache controller finished.")


if __name__=='__main__':
    main()

