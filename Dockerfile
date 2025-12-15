FROM maven:3.9.11-eclipse-temurin-17 AS build
LABEL maintainer="Sujay Karumuri <sujaykarumuri@gmail.com>"
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar simpletimeserviceapplication.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "simpletimeserviceapplication.jar"]