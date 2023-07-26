FROM maven:latest
COPY . .
RUN mvn clean package -DskipTests


FROM eclipse-temurin
VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
RUN docker run -p 80:80