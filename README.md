# master-cloud-apps-3.2.1-Docker
Dockerize several micro services that work together. Using different technologies such us:
- Docker
- DockerCompose
- JIB
- Buildpacks

## Usage

Run
``` sh

$ docker-compose -f ./docker-compose.yml up

```

It will download all needed images from dockerhub and it will run the application.

Open [localhost on port 3000](http://localhost:3000)

## Publishing images to Docker Hub

Run
``` sh

sh ./buildAndPush.hs
```

It will build a new image of all services involved in this application and it will publish them to Javiergarciagon's docker hub account.