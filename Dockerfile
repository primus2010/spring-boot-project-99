FROM gradle:jdk21 AS builder
COPY . .
RUN gradle clean
RUN gradle bootJar
RUN ls -la build/libs

FROM openjdk:21-jdk-slim AS runtime
COPY --from=builder /home/gradle/build/libs/app-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]



