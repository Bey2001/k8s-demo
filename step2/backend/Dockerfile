# Pull the base image
___ openjdk:10-jre-slim

# Change the working directory within the container
___ /opt/to-do-app/

# Import the JAR file into the container
___ ./target/to-do-listEntity-app-0.0.1-SNAPSHOT.jar .

# Launch the JAR file upon startup of this container
___ ["java", "-jar", "to-do-listEntity-app-0.0.0-SNAPSHOT.jar"]