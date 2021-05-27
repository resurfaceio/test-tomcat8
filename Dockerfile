FROM tomcat:8-jdk8
WORKDIR /app
RUN rm -rf /usr/local/tomcat/webapps && mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
RUN wget -O /usr/local/tomcat/lib/resurfaceio-logger.jar https://search.maven.org/remotecontent?filepath=io/resurface/resurfaceio-logger/2.1.1/resurfaceio-logger-2.1.1.jar
RUN sed -i 's|<!-- ==================== Default Session Configuration ================= -->|<filter><filter-name>HttpLoggerForServlets</filter-name><filter-class>io.resurface.HttpLoggerForServlets</filter-class><init-param><param-name>url</param-name><param-value>http://resurface:4001/message</param-value></init-param><init-param><param-name>rules</param-name><param-value>include debug</param-value></init-param></filter><filter-mapping><filter-name>HttpLoggerForServlets</filter-name><url-pattern>/*</url-pattern></filter-mapping>\n\n|' /usr/local/tomcat/conf/web.xml
EXPOSE 8080
CMD catalina.sh run