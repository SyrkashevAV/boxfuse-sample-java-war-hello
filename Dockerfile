FROM ubuntu:18.04
RUN apt install default-jdk -y
FROM ubuntu:18.04git
RUN apt install tomcat9 -y
RUN apt install maven -y
EXPOSE 8080
