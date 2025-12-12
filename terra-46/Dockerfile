FROM ubuntu:22.04
LABEL dev="Anil"

# Install necessary packages
RUN apt update -y && \
    apt install -y unzip default-jdk && \
    apt clean && \
   rm -rf /var/lib/apt/lists/*

# Download and extract Tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.zip /opt
RUN unzip /opt/apache-tomcat-9.0.113.zip -d /opt

# Set up Tomcat and deploy the WAR file
WORKDIR /opt/apache-tomcat-9.0.113/
ADD https://docker-buck-000999.s3.us-east-2.amazonaws.com/student.war  /opt/apache-tomcat-9.0.113/webapps/
ADD https://docker-buck-000999.s3.us-east-2.amazonaws.com/mysql-connector.jar  /opt/apache-tomcat-9.0.113/lib/mysql-connector.jar
COPY context.xml /opt/apache-tomcat-9.0.113/conf/context.xml

# Set permissions and run Tomcat
RUN chmod +rwx /opt/apache-tomcat-9.0.113/bin/*.sh

CMD ["/opt/apache-tomcat-9.0.113/bin/catalina.sh", "run"]

EXPOSE 8080