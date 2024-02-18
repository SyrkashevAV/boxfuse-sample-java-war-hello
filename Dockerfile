FROM ubuntu:18.04
RUN apt update -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN apt install tomcat9 -y
RUN apt install maven -y
EXPOSE 8080
RUN rm -rf ./target/
RUN mkdir /pilot
WORKDIR /pilot/boxfuse-sample-java-war-hello
RUN pwd
RUN mvn package
COPY ./target/*.war /var/lib/tomcat9/webapps/
