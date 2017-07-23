FROM java:8
From tomcat:8-jre8
# Install maven
RUN apt-get -y update && apt-get install -y maven

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml

# Adding source, compile and package into a fat jar
ADD src /code/src
RUN ["mvn", "package"]
ADD dockerwar.war /usr/local/tomcat/webapps/
