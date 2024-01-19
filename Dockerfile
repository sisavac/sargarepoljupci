# Container za izgradnju (build) aplikacije
FROM openjdk:17-alpine AS builder

VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]