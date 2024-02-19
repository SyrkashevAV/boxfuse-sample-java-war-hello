FROM ubuntu:18.04
RUN apt update -y
RUN apt install git -y
RUN apt install tomcat9 -y
RUN apt install maven -y
EXPOSE 80
RUN rm -rf ./target/
RUN mkdir /pilot
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git ./pilot
WORKDIR /pilot
RUN mvn package
RUN cp target/*.war /var/lib/tomcat9/webapps/
