---
layout: post
title: "Implementing Dockerfile and Docker Compose in a NestJS App with PSQL DB: Handling Runtime Environment Variables"
tags: ['node.js', 'postgresql', 'docker', 'docker-compose', 'nestjs']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## Subheading: Understanding Dockerfile, Docker Compose, and Runtime Environment Variables in a NestJS App with PSQL DB

In today's world of software development, **containerization** and **microservices** have become the standard. One of the most common tools used for this is Docker, which allows developers to package their applications into containers for easy deployment and scaling. In this article, we will dive deep into implementing Dockerfile and Docker Compose in a NestJS application with a PostgreSQL database, focusing on handling runtime environment variables.

### The Dockerfile and Docker Compose

The **Dockerfile** is a text file that contains all the commands a user could call on the command line to assemble an image. It's often the first part of setting up a Docker environment for your application. 

On the other hand, **Docker Compose** is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services, which allows you to start all the services from your configuration with a single command.

### The Importance of Runtime Environment Variables

**Runtime environment variables** are a crucial aspect of modern application development, especially in a containerized environment. They allow you to configure your application's behavior without changing the code, which is particularly useful when you have different environments for development, testing, and production.

### Common Mistakes and Errors

Now, let's discuss some common mistakes that developers often encounter while implementing Dockerfile and Docker Compose in a NestJS app with a PSQL DB.

1. **Not correctly setting up the Dockerfile:** It's essential to ensure that your Dockerfile is set up correctly, with all the necessary commands to build your application's image. A common mistake is not correctly setting the `WORKDIR`, which can lead to issues when your application tries to access files or directories.

2. **Not handling environment variables correctly:** Another common mistake is not correctly handling runtime environment variables in your Docker Compose file. This can lead to your application not behaving as expected, especially when connecting to your PostgreSQL database.

### Setting Up The Dockerfile

Let's start by setting up the Dockerfile for our NestJS application. Here's a simple example:

```dockerfile
FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "start:prod"]
```

In this Dockerfile, we're starting from a Node.js image, setting our working directory to `/app`, and copying our `package.json` and `package-lock.json` (if it exists) into the image. We then run `npm install` to install our dependencies, copy the rest of our application into the image, and build our application. Finally, we expose port 3000 and set the command to start our application.

### Configuring Docker Compose

Next, let's configure our Docker Compose file. Here's an example:

```yaml
version: '3'
services:
  app:
    build: .
    ports:
      - 3000:3000
    environment:
      - DB_HOST=db
      - DB_PORT=5432
  db:
    image: postgres:13
    environment:
      - POSTGRES_USER=myuser
      - POSTGRES_PASSWORD=mypassword
      - POSTGRES_DB=mydb
```

In this configuration, we have two services: our application (`app`) and our PostgreSQL database (`db`). We're building our application from the current directory, mapping port 3000 from our application to port 3000 on our host machine, and setting our database host and port as environment variables. For our database, we're using a PostgreSQL image and setting the username, password, and database name as environment variables.

### Handling Runtime Environment Variables

Now, let's discuss how to handle runtime environment variables in our NestJS application.

In NestJS, you can use the `ConfigService` to access your environment variables. To use it, you first need to import the `ConfigModule` in your module:

```typescript
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [ConfigModule.forRoot()],
})
export class AppModule {}
```

Then, you can inject the `ConfigService` into your services or controllers and use the `get` method to access your environment variables:

```typescript
import { ConfigService } from '@nestjs/config';

@Injectable()
export class AppService {
  constructor(private configService: ConfigService) {}

  getDbHost(): string {
    return this.configService.get<string>('DB_HOST');
  }
}
```

In this example, we're accessing the `DB_HOST` environment variable, which we set in our Docker Compose file.

Remember, correctly handling runtime environment variables is crucial for your application's behavior, especially when working with Docker and PostgreSQL. Make sure to always double-check your Dockerfile and Docker Compose configurations, and ensure that your environment variables are correctly set and accessed in your NestJS application.

When working with a **NestJS** application, Docker, and a **PostgreSQL** database, you may encounter issues with handling runtime environment variables. This blog post will walk you through a step-by-step guide to solve this problem. 

## Step 1: Understanding the Problem

When you're trying to build and run a Docker container for your NestJS application, you might encounter an error related to environment variables. The error message might look something like this:

```javascript
Error: Environment variable not found: POSTGRES_USER
```

This error occurs when the application tries to access an environment variable that hasn't been defined in the Docker environment.

## Step 2: Defining Environment Variables in Dockerfile

To solve this problem, you need to define your environment variables in your `Dockerfile`. This can be done using the `ENV` instruction. Here's an example:

```Dockerfile
ENV POSTGRES_USER your_db_user
ENV POSTGRES_PASSWORD your_db_password
```

In this example, `POSTGRES_USER` and `POSTGRES_PASSWORD` are the environment variables, and `your_db_user` and `your_db_password` are the values you want to assign to these variables.

## Step 3: Using Docker Compose 

However, hardcoding values into your `Dockerfile` isn't a good practice. A better approach is to use **Docker Compose**. It allows you to define and run multi-container Docker applications, and it's excellent for managing your environment variables. 

You can define your environment variables in a `docker-compose.yml` file like this:

```yaml
version: '3'
services:
  db:
    image: postgres
    environment:
      POSTGRES_USER: your_db_user
      POSTGRES_PASSWORD: your_db_password
```

In this example, the `environment` key is used to set environment variables. 

## Step 4: Using .env File 

For an even better approach, you can use a `.env` file to store your environment variables. This file should be located in the root directory of your project. Here's an example of what it might look like:

```env
POSTGRES_USER=your_db_user
POSTGRES_PASSWORD=your_db_password
```

## Step 5: Referencing .env File in Docker Compose 

Next, you can reference your `.env` file in your `docker-compose.yml` file. Docker Compose automatically looks for a file named `.env` in the directory it is run. Here's how you can do it:

```yaml
version: '3'
services:
  db:
    image: postgres
    env_file:
      - .env
```

In this example, the `env_file` key is used to specify the location of the `.env` file.

## Step 6: Accessing Environment Variables in NestJS 

Now, you need to access these environment variables in your NestJS application. You can do this using the `process.env` object in Node.js. Here's an example:

```typescript
const user = process.env.POSTGRES_USER;
const password = process.env.POSTGRES_PASSWORD;
```

## Step 7: Using ConfigModule in NestJS 

However, a better practice in NestJS is to use the `ConfigModule` from `@nestjs/config`. It provides a way to organize configuration settings in a modular and efficient way. Here's an example of how you can use it:

```typescript
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    ConfigModule.forRoot(),
  ],
})
export class AppModule {}
```

And then you can access your environment variables like this:

```typescript
import { ConfigService } from '@nestjs/config';

constructor(private configService: ConfigService) {}

someMethod() {
  const user = this.configService.get<string>('POSTGRES_USER');
  const password = this.configService.get<string>('POSTGRES_PASSWORD');
}
```

## Step 8: Testing Your Solution 

Finally, you should test your solution to make sure everything is working correctly. You can do this by running your Docker container and checking if your NestJS application can connect to your PostgreSQL database using the environment variables.

If everything is set up correctly, your application should be able to access the environment variables, and the error should be resolved.

## Conclusion 

In this blog post, we've walked through a step-by-step guide to solve a common error related to handling runtime environment variables in a NestJS application with Docker and PostgreSQL. We've seen how to define environment variables in a Dockerfile, how to use Docker Compose and a `.env` file, and how to access these variables in a NestJS application.

Remember, handling environment variables correctly is crucial for the security and scalability of your application. Always make sure to keep them secure and never hardcode sensitive data directly into your code or Dockerfile.
# Recommended Sites

If you're looking to learn more about "Implementing Dockerfile and Docker Compose in a NestJS App with PSQL DB: Handling Runtime Environment Variables", the following resources are highly recommended. These are official, reliable, and user-friendly sites that provide detailed information on this topic.

1. Docker Documentation: [https://docs.docker.com/](https://docs.docker.com/)
2. Docker Compose Documentation: [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
3. NestJS Documentation: [https://docs.nestjs.com/](https://docs.nestjs.com/)
4. PostgreSQL Documentation: [https://www.postgresql.org/docs/](https://www.postgresql.org/docs/)
5. Docker Hub Official Images for PostgreSQL: [https://hub.docker.com/_/postgres](https://hub.docker.com/_/postgres)
6. Dockerfile Reference: [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)
7. Docker Compose and Environment Variables: [https://docs.docker.com/compose/environment-variables/](https://docs.docker.com/compose/environment-variables/)

Remember, these are official resources, so they are regularly updated and maintained to ensure the information is accurate and up-to-date. Happy learning!