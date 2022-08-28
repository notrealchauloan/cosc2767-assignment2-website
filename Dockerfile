<<<<<<< HEAD
FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
=======
FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
>>>>>>> b7cd51b76aa3f2d534d97e604d6b76e8a754f01a
COPY ./*.war /usr/local/tomcat/webapps## Install Docker