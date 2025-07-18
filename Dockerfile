FROM maven:3.8.5-openjdk-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar springbootfirst.jar
EXPOSE 3001
ENTRYPOINT ["java", "-jar", "springbootfirst.jar"]


