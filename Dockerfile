FROM ubuntu:18.04
RUN apt update -y
RUN apt install git -y
RUN apt install tomcat9 -y
RUN apt install maven -y
EXPOSE 8080
RUN rm -rf ./target/
RUN mkdir /pilot
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git ./pilot
WORKDIR /pilot
RUN pwd
RUN ls -la /pilot
RUN ls -lda /pilot/
RUN mvn package
RUN ls -la /pilot/target
COPY /pilot/target/hello-1.0.war /var/lib/tomcat9/webapps/
