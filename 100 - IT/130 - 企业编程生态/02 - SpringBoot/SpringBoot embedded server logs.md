## SpringBoot embedded server logs

> [原文链接](https://howtodoinjava.com/spring-boot2/logging/embedded-server-logging-config/)



### Types of logging for embeded servers

#### 1.  Access logs
> Access logs represent information related to the received request, sent response to the client and important details in between when the request was processed.



#### 2. Internal logs

> Internal logs give logging information internal to how tomcat server is running inside the box. It’s more of internal information and does not provide much help until we are facing some issue with the server itself.





### Access logging in embeded servers

```properties
#tomcat
 
server.tomcat.accesslog.buffered=true # Whether to buffer output such that it is flushed only periodically.
server.tomcat.accesslog.directory=logs # Directory in which log files are created. Can be absolute or relative to the Tomcat base dir.
server.tomcat.accesslog.enabled=false # Enable access log.
server.tomcat.accesslog.file-date-format=.yyyy-MM-dd # Date format to place in the log file name.
server.tomcat.accesslog.pattern=common # Format pattern for access logs.
server.tomcat.accesslog.prefix=access_log # Log file name prefix.
server.tomcat.accesslog.rename-on-rotate=false # Whether to defer inclusion of the date stamp in the file name until rotate time.
server.tomcat.accesslog.request-attributes-enabled=false # Set request attributes for the IP address, Hostname, protocol, and port used for the request.
server.tomcat.accesslog.rotate=true # Whether to enable access log rotation.
server.tomcat.accesslog.suffix=.log # Log file name suffix.
 
#jetty
 
server.jetty.accesslog.append=false # Append to log.
server.jetty.accesslog.date-format=dd/MMM/yyyy:HH:mm:ss Z # Timestamp format of the request log.
server.jetty.accesslog.enabled=false # Enable access log.
server.jetty.accesslog.extended-format=false # Enable extended NCSA format.
server.jetty.accesslog.file-date-format= # Date format to place in log file name.
server.jetty.accesslog.filename= # Log filename. If not specified, logs redirect to "System.err".
server.jetty.accesslog.locale= # Locale of the request log.
server.jetty.accesslog.log-cookies=false # Enable logging of the request cookies.
server.jetty.accesslog.log-latency=false # Enable logging of request processing time.
server.jetty.accesslog.log-server=false # Enable logging of the request hostname.
server.jetty.accesslog.retention-period=31 # Number of days before rotated log files are deleted.
server.jetty.accesslog.time-zone=GMT # Timezone of the request log.
 
#undertow
server.undertow.accesslog.dir= # Undertow access log directory.
server.undertow.accesslog.enabled=false # Whether to enable the access log.
server.undertow.accesslog.pattern=common # Format pattern for access logs.
server.undertow.accesslog.prefix=access_log. # Log file name prefix.
server.undertow.accesslog.rotate=true # Whether to enable access log rotation.
server.undertow.accesslog.suffix=log # Log file name suffix.
```



### Internal logs in embeded servers

> To generate internal logging for embedded server in spring boot, we need ==to **define [logging level](https://howtodoinjava.com/log4j/logging-levels-in-log4j/)** for the server component==.

```properties
#Tomcat
logging.level.org.apache.tomcat=DEBUG
logging.level.org.apache.catalina=DEBUG
 
#Jetty
logging.level.org.eclipse.jetty=INFO
logging.level.org.eclipse.jetty.websocket=DEBUG
 
#Undertow
logging.level.io.undertow.server=DEBUG
logging.level.io.undertow.websockets=DEBUG
```





## 参考

1. [Spring boot embedded server logs](https://howtodoinjava.com/spring-boot2/logging/embedded-server-logging-config/)