# Use official JDK 8 base image
FROM openjdk:8-jdk-alpine

# Set work directory
WORKDIR /app

# Copy the built JAR file into the container
COPY build/libs/hello-world-java-V1.jar app.jar

# Expose port (if your app listens to a specific port)
EXPOSE 8085

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
