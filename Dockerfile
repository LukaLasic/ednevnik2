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
COPY --from=build /Users/lukalasic/Downloads/FgrProjekt-main/target/SpringBoot-1.0.jar /Users/lukalasic/Downloads/FgrProjekt-main/target/SpringBoot-1.0.jar.original
EXPOSE 80
ENTRYPOINT ["java","-jar","/Users/lukalasic/Downloads/FgrProjekt-main/target/SpringBoot-1.0.jar"]