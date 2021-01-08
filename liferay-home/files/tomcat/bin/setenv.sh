#!/usr/bin/env bash 

#JAVA_HOME=/usr/lib/jvm/java 
#JRE_HOME=/usr/lib/jvm/jre 

CATALINA_OPTS="${CATALINA_OPTS} -Dfile.encoding=UTF8 -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Duser.timezone=UTC -Djava.net.preferIPv4Stack=true -Dnode.name=${HOSTNAME}"

# Reference to instance Liferay portal-ext.properties file 
#CATALINA_OPTS="${CATALINA_OPTS} -Dexternal-properties=/opt/liferay/instance-01/liferay-home/portal-ext.properties"

#General Heap Sizing 
CATALINA_OPTS="${CATALINA_OPTS} -Xms3G -Xmx3G -XX:+DisableExplicitGC" # Enable the G1GC policy 

CATALINA_OPTS="${CATALINA_OPTS} -XX:+UseG1GC -XX:+ParallelRefProcEnabled" # Verbose Garbage Collection Logging 

CATALINA_OPTS="${CATALINA_OPTS} -Xlog:gc*,gc+ref=debug,gc+heap=debug,gc+age=trace,gc+promotion=debug,gc+ergo*=trace:file=${CATALINA_BASE}/logs/gc-%p-%t.log:tags,uptime,time,level:filecount=10,filesize=50m" 

#CATALINA_OPTS="${CATALINA_OPTS} -Xlog:safepoint*:file=${CATALINA_BASE}/logs/safepoints-%p-%t.log:tags,uptime,time,level:filecount=10,filesize=50m" 

# Enable JMX 
#CATALINA_OPTS="${CATALINA_OPTS} -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9000 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

# Otel
CATALINA_OPTS="${CATALINA_OPTS} -Dapplication.name=liferay -Dapplication.home=/opt/liferay/tomcat -Dotel.exporter=jaeger -Dotel.exporter.jaeger.endpoint=172.18.0.2:14250 -Dotel.exporter.jaeger.service.name=liferay-dxp -javaagent:/opt/liferay/tomcat/lib/opentelemetry-javaagent-all.jar"


