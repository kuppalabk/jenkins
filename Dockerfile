FROM tomcat:8.0

ADD ./webapp/target/*.war /usr/local/tomcat/webapp

CMD ['catalina.sh','run']