FROM ubuntu:18.04
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install maven -y
EXPOSE 8080
RUN rm -rf ./target/
RUN mvn package
COPY ./target/*.war /var/lib/tomcat9/webapps/
