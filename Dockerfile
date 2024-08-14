# Use an official OpenJDK image as the base image
FROM openjdk:11-jdk-slim

# Install dependencies (e.g., curl)
RUN apt-get update && apt-get install -y curl unzip

# Set Gradle version
ENV GRADLE_VERSION=7.1.1

# Download and install Gradle
RUN curl -sL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip \
    && unzip gradle.zip -d /opt/gradle \
    && rm gradle.zip

# Set environment variables for Gradle
ENV GRADLE_HOME=/opt/gradle/gradle-${GRADLE_VERSION}
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# Verify Gradle installation
RUN gradle --version

# Set the working directory
WORKDIR /app

# Copy the project files to the Docker container
COPY . /app

# Default command
CMD ["gradle", "build"]

