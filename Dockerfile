#
# Pakiranje aplikacije
#
FROM maven:3.8.7-openjdk-18 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package -DskipTests

#
# Pokretanje aplikacije
#
FROM openjdk:18-jdk-slim
COPY --from=build /home/app/target/ednevnik.jar /usr/local/lib/ednevnik.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/ednevnik.jar"]