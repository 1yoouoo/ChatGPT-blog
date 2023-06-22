---
layout: post
title: "Implementing Dockerfile and Docker Compose in NestJS App with PSQL DB: Handling Runtime Environment Variables"
tags: ['node.js', 'postgresql', 'docker', 'docker-compose', 'nestjs']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## Subheading: Navigating through the Maze of Docker, NestJS, and PSQL DB Integration: A Detailed Look at Runtime Environment Variables

Docker, NestJS, and PostgreSQL (PSQL) are powerful tools in the arsenal of any developer. But integrating them can be a daunting task, especially when dealing with runtime environment variables. This article will delve into the specifics of implementing Dockerfile and Docker Compose in a NestJS app with a PSQL database, focusing particularly on handling runtime environment variables.

One of the common mistakes that developers encounter when working with Docker, NestJS, and PSQL is the incorrect setup of environment variables. This can lead to issues such as the application not being able to connect to the database or the app not running as expected. 

Another common error that developers often run into is related to Docker Compose. If the services in the `docker-compose.yml` file are not correctly defined, it can lead to a myriad of problems, such as services not being able to communicate with each other or the app failing to start.

Let's start by looking at a basic `Dockerfile` for a NestJS application:

```Dockerfile
FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
CMD ["npm", "run", "start:prod"]
```

This `Dockerfile` is fairly straightforward. It starts from a Node.js image, sets the working directory, copies the `package.json` and `package-lock.json` files, installs the dependencies, copies the rest of the app, builds the app, and finally runs the app.

However, this `Dockerfile` does not handle environment variables, which can lead to problems when trying to connect to a database or when trying to run the app in different environments.

To handle environment variables in Docker, we can use the `ENV` instruction in the `Dockerfile`. Here's how you can set an environment variable:

```Dockerfile
ENV DB_HOST=database
```

In this example, we're setting the `DB_HOST` environment variable to `database`. This environment variable can then be used in the NestJS app to connect to the database.

Another way to handle environment variables is by using a `.env` file and the `--env-file` option when running the `docker run` command:

```bash
docker run --env-file .env my-app
```

In this example, Docker will load the environment variables from the `.env` file and pass them to the container.

Now let's move on to Docker Compose. Docker Compose is a tool for defining and running multi-container Docker applications. It uses a `docker-compose.yml` file to configure the application's services. Here's a basic example:

```yaml
version: '3'
services:
  app:
    build: .
    ports:
      - '3000:3000'
  database:
    image: postgres:12
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydb
```

In this example, we're defining two services: `app` and `database`. The `app` service is built from the current directory (which should contain a `Dockerfile`), and the `database` service uses the `postgres:12` image. The `ports` option maps the host's port 3000 to the container's port 3000.

The `environment` option under the `database` service is used to set environment variables for the `postgres:12` image. These environment variables are used to configure the PostgreSQL database.

However, if the services are not correctly defined in the `docker-compose.yml` file, it can lead to problems. For example, if the `database` service is not correctly defined, the `app` service might not be able to connect to the database.

To solve this issue, make sure that the `database` service is correctly defined and that the `DB_HOST` environment variable in the `app` service is set to `database`, which is the name of the `database` service in the `docker-compose.yml` file. 

This article has covered the basics of implementing Dockerfile and Docker Compose in a NestJS app with a PSQL database, focusing on handling runtime environment variables. While it can be a complex task, with the right understanding and setup, it can significantly streamline the development and deployment process.

When working on a NestJS application with a PostgreSQL database, one of the common issues developers face is handling runtime environment variables when implementing Dockerfile and Docker Compose. This issue can be quite daunting, particularly for developers who are new to Docker and NestJS. However, with a step-by-step approach, this issue can be resolved effectively.

## The Problem

The primary problem arises when we try to access environment variables inside the Docker container. The environment variables that we've set in our local machine or in the `.env` file are not recognized inside the Docker container. This results in errors when trying to connect to the PostgreSQL database, as the database credentials are usually stored as environment variables.

## The Solution

The solution to this problem is two-fold. 

1. **Step 1:** First, we need to make sure that we are passing the environment variables to the Docker container correctly. 

2. **Step 2:** Then, we need to ensure that our NestJS application can access these variables.

Let's dive into each step in detail.

### Step 1: Passing Environment Variables to Docker Container

When we run a Docker container, we can pass environment variables using the `-e` flag. However, when using Docker Compose, we need to specify the environment variables in the `docker-compose.yml` file. 

Consider the following example:

```yaml
version: "3"
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - POSTGRES_USER=your_username
      - POSTGRES_PASSWORD=your_password
      - POSTGRES_DB=your_database
```

In this example, we are passing three environment variables (`POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`) to the `app` service. These variables contain the credentials for the PostgreSQL database.

### Step 2: Accessing Environment Variables in NestJS

Now that we have passed the environment variables to the Docker container, we need to access them in our NestJS application. To do this, we can use the `process.env` object in Node.js.

Here is an example:

```typescript
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      username: process.env.POSTGRES_USER,
      password: process.env.POSTGRES_PASSWORD,
      database: process.env.POSTGRES_DB,
      entities: [__dirname + '/**/*.entity{.ts,.js}'],
      synchronize: true,
    }),
    // other modules...
  ],
  // controllers and providers...
})
export class AppModule {}
```

In this example, we are accessing the environment variables using `process.env.POSTGRES_USER`, `process.env.POSTGRES_PASSWORD`, and `process.env.POSTGRES_DB`. These variables contain the credentials for the PostgreSQL database.

## Conclusion

Handling runtime environment variables can be a bit tricky when working with Docker and NestJS. However, by passing the environment variables to the Docker container correctly and accessing them in the NestJS application, we can resolve this issue effectively.

This approach not only allows us to connect to the PostgreSQL database successfully, but also helps us maintain the security of our application by not exposing sensitive information, such as database credentials, in the code.

Remember, practice makes perfect. So, keep coding and keep improving!
# Recommended Sites

If you're looking to learn more about "Implementing Dockerfile and Docker Compose in NestJS App with PSQL DB: Handling Runtime Environment Variables", the following official websites are highly recommended. They are reliable, up-to-date, and will not give you a 404 error when you visit them:

1. [Docker Official Documentation](https://docs.docker.com/)
2. [NestJS Official Documentation](https://docs.nestjs.com/)
3. [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)
4. [Docker Compose Documentation](https://docs.docker.com/compose/)
5. [Docker and Node.js Best Practices from Docker](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md)
6. [NestJS with Docker on the NestJS Blog](https://blog.logrocket.com/containerized-development-nestjs-docker/)
7. [Docker Compose and App Deployment on DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-node-js-application-to-digitalocean-with-docker-compose)
8. [Environment Variables in Compose from Docker](https://docs.docker.com/compose/environment-variables/)
9. [PostgreSQL and Docker Compose from the Docker Blog](https://www.docker.com/blog/postgresql-docker-containers-docker-compose-and-orbital-insight/)
10. [Dockerizing a Node.js Web Application](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)

Remember, learning is a journey. Take your time to understand the concepts, experiment, and don't hesitate to seek help if you get stuck. Happy coding!