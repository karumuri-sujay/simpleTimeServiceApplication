FROM maven:3.9.11-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM eclipse-temurin:17-jre-nanoserver
WORKDIR /app
COPY --from=build /app/target/*.jar simpleTimeServiceApplication.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "simpleTimeServiceApplication.jar"]