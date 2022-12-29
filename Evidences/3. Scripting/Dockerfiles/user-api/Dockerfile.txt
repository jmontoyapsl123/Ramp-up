FROM openjdk:8
ENV JWT_SECRET=PRFT 
ENV SERVER_PORT=8083
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN ./mvnw clean install
EXPOSE 8083
CMD [ "java", "./target/users-api-0.0.1-SNAPSHOT.jar" ]