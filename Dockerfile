FROM openjdk:17-jdk-slim
COPY build/libs/hello-world-java-V1.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
