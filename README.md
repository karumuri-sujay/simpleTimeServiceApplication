# simpleTimeServiceApplication
Simple Time Service Application with Dockerfile
This is a basic application with Spring and Maven combination to view Timestamp and IP address of the user which is viewed in JSON format.

## Pre-Setup
Make sure you have these plugins installed in your local/remote machine
* Maven
* Java (17)
* Docker
* IDE of your choice (Intellj, VSCode etc)


## How to Use this Project
Clone this repository and run the below command
```
mvn clean install
```

The above command makes sure that the project will load the required plugins mentioned in the pom.xml file.

Once the build is done, you can run your application using the below command
```
mvn clean compile
```

## Access Docker Image from Docker Hub
If you want to directly access the docker image and want to build on top of that, you could use the below command
```
docker pull sujay20092002/simple-time-service-application
```
