# Etapa 1: Construir con Maven
FROM maven:latest AS build
WORKDIR /app
COPY . /app
RUN mvn clean package

# Etapa 2: Crear el contenedor para despliegue
FROM openjdk:17-ea-oraclelinux8
WORKDIR /app
COPY --from=build /app/target/GPService-0.0.1-SNAPSHOT.jar /app
# Añade el archivo ojdbc8-21.9.0.0.jar desde el repositorio local de Maven
#COPY --from=build /root/.m2/repository/com/oracle/database/jdbc/ojdbc8/21.9.0.0/ojdbc8-21.9.0.0.jar /app/ojdbc8.jar
EXPOSE 8080
#CMD ["java", "-cp", "ojdbc8.jar:GPService-0.0.1-SNAPSHOT.jar", "pe.com.isesystem.gpservice.GpServiceApplication"]
CMD ["java", "-jar", "GPService-0.0.1-SNAPSHOT.jar"]
