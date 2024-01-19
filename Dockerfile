# Container za izgradnju (build) aplikacije
FROM openjdk:17-alpine AS builder

WORKDIR /app
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]