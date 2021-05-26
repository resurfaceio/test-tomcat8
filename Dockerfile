FROM tomcat:8-jdk8
WORKDIR /app
RUN rm -rf /usr/local/tomcat/webapps && mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
EXPOSE 8080
CMD catalina.sh run