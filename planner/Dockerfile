## Building planner's dependencies
FROM maven:3-openjdk-11 as builder 

WORKDIR /usr/planner

RUN curl -LJO https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
&& chmod +x /usr/planner/wait-for-it.sh

COPY pom.xml /usr/planner/
RUN mvn clean verify --fail-never

COPY /src /usr/planner/src
RUN mvn package

## Planner's image
FROM openjdk:11-jre-slim

WORKDIR /usr/planner

COPY --from=builder /usr/planner/target/*.jar /usr/planner
COPY --from=builder /usr/planner/wait-for-it.sh /usr/planner

EXPOSE 8080

CMD [ "java", "-jar", "planner-0.0.1-SNAPSHOT.jar" ]