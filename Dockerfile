# Container za izgradnju (build) aplikacije
#FROM openjdk:17-alpine AS builder
#
#WORKDIR /app
#
## Copy the JAR file
#COPY target/*.jar app.jar
#
#ENTRYPOINT ["java","-jar","/app.jar"]

# Container za izgradnju (build) aplikacije
#FROM openjdk:17-alpine AS builder

#VOLUME /tmp
#ARG JAR_FILE
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/sargarepoljupci-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java","-jar","demo.jar"]