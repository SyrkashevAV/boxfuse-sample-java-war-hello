FROM ubuntu:18.04
RUN apt update -y
RUN apt install -y git default-jdk maven wget tar
WORKDIR /boxfuse
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /opt/tomcat
RUN wget http://dlcdn.apache.org/tomcat/tomcat-10/v10.1.18/bin/apache-tomcat-10.1.18.tar.gz
RUN tar zxvf apache-tomcat-*.tar.gz
RUN cp /boxfuse/boxfuse-sample-java-war-hello/target/*.war /opt/tomcat/apache-tomcat-10.1.18/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-10.1.18/bin/catalina.sh", "run"]
