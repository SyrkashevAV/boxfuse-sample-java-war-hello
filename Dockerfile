FROM ubuntu:18.04
RUN apt update -y
RUN apt install git -y
#RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install wget -y
RUN wget http://dlcdn.apache.org/tomcat/tomcat-10/v10.1.18/bin/apache-tomcat-10.1.18.tar.gz
RUN apt install tar -y
RUN mkdir /opt/tomcat/
RUN tar zxvf apache-tomcat-*.tar.gz -C /opt/tomcat --strip-components 1
EXPOSE 80
RUN rm -rf ./target/
RUN mkdir /pilot
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git ./pilot
WORKDIR /pilot
RUN mvn package
RUN mkdir -p /var/lib/tomcat/webapps/
RUN cp target/*.war /var/lib/tomcat/webapps/
WORKDIR /var/lib/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
