---
layout: post
title: "Resolving 404 Error on Swagger UI with Spring: A Guide to Springdoc-Openapi Configuration"
tags: ['spring', 'spring-boot', 'swagger-ui', 'openapi', 'springdoc']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

In the world of application development, encountering errors is a part of the process. One such error that developers often come across while using Swagger UI with Spring is the 404 error. This error typically pops up when the requested resource is not found on the server. In this post, we'll delve into the specifics of this error and discuss how to resolve it through proper Springdoc-Openapi configuration.

## Understanding the 404 Error

Before we dive into the resolution, it's important to understand what the **404 error** signifies. In HTTP protocol, status code 404 means 'Not Found'. Essentially, the server is unable to find the requested resource. In the context of Swagger UI and Spring, this error often occurs when the application cannot locate the Swagger UI page.

## Common Mistakes Leading to 404 Error

There are a couple of common mistakes that often lead to the 404 error. 

1. **Incorrect Swagger Configuration:** The most common cause is incorrect Swagger configuration in the Spring application. If the Swagger UI path is not correctly configured, the application will not be able to serve the Swagger UI page, resulting in a 404 error.

2. **Missing Dependencies:** Another common mistake is missing or incorrect Swagger dependencies in the project. If the necessary dependencies are not correctly added to the project, the application will not be able to serve the Swagger UI page.

## Configuring Springdoc-Openapi

To resolve the 404 error, we need to correctly configure Springdoc-Openapi in our Spring application. Here is an example of how to do it in a Spring Boot application.

```java
@Configuration
public class OpenApiConfiguration {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                .title("Sample Application API")
                .version("1.0")
                .description("Sample Application API"));
    }
}
```

In the above code, we are creating a new `OpenAPI` bean, which is used by Springdoc to generate the OpenAPI documentation. The `title`, `version`, and `description` methods are used to provide information about the API.

## Adding Swagger Dependencies

The next step is to add the necessary Swagger dependencies to your project. In a Maven-based project, you can add the following dependencies to your `pom.xml` file.

```xml
<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-ui</artifactId>
    <version>1.5.2</version>
</dependency>
```

This dependency includes the Springdoc OpenAPI UI library, which serves the Swagger UI page.

## Setting the Swagger UI Path

By default, the Swagger UI page is served at the path `/swagger-ui.html`. If you want to serve the Swagger UI page at a different path, you can set the `springdoc.swagger-ui.path` property in your application properties file.

```properties
springdoc.swagger-ui.path=/api-docs
```

With the above configuration, the Swagger UI page will be served at the path `/api-docs`.

## Verifying the Configuration

After configuring Springdoc-Openapi and adding the necessary dependencies, you can start your application and navigate to the Swagger UI path (either `/swagger-ui.html` or the custom path you set) in your web browser. If everything is configured correctly, you should see the Swagger UI page without any 404 error.

## Troubleshooting

If you're still encountering the 404 error, there are a few things you can check.

- **Check the console logs:** The console logs can provide valuable information about any errors or exceptions in your application.

- **Check the Springdoc configuration:** Make sure the Springdoc configuration in your application is correct. If there are any mistakes in the configuration, it can lead to a 404 error.

- **Check the dependencies:** Make sure all the necessary dependencies are correctly added to your project. If any dependencies are missing or incorrect, it can lead to a 404 error.

In the world of software development, errors are inevitable. But with a proper understanding of the issue and the right approach, you can resolve them effectively. The 404 error in Swagger UI with Spring is no exception. By correctly configuring Springdoc-Openapi and ensuring all the necessary dependencies are in place, you can resolve this error and make your Swagger UI page accessible.

When working with **Swagger UI** and **Spring**, one of the most common issues faced by developers is the `404 error`. This error typically occurs when the Swagger UI is unable to find the API documentation it's supposed to display. This blog post aims to provide a comprehensive, step-by-step guide to resolving this error by configuring Springdoc-Openapi.

## Step 1: Confirm the Error

The first step in resolving any error is to **confirm its existence**. In this case, you need to confirm that the Swagger UI is indeed returning a 404 error. This can be done by navigating to the Swagger UI URL. If you see a `404 error page`, then you can be sure that the error exists.

## Step 2: Check the Configuration

The next step is to **check the configuration** of your Springdoc-Openapi. The most common cause of the 404 error is a misconfiguration in the application's `application.properties` or `application.yml` file. 

Here is an example of how this configuration might look in a typical Spring Boot application:

```javascript
springdoc.swagger-ui.enabled=true
springdoc.swagger-ui.path=/swagger-ui.html
```

In the above code, `springdoc.swagger-ui.enabled=true` enables the Swagger UI, while `springdoc.swagger-ui.path=/swagger-ui.html` sets the path to the Swagger UI. If either of these configurations is incorrect, the Swagger UI might return a `404 error`.

## Step 3: Check the Springdoc Version

Another possible cause of the 404 error is using an **outdated version** of Springdoc. Ensure that you're using the latest version of Springdoc-Openapi. You can check the current version in your `pom.xml` or `build.gradle` file.

```javascript
<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-ui</artifactId>
    <version>1.5.2</version>
</dependency>
```

In the above code snippet, the version of Springdoc-Openapi is `1.5.2`. If you're using an older version, consider updating it.

## Step 4: Check the Controller Annotations

The Swagger UI uses the `@RestController` and `@RequestMapping` annotations to generate API documentation. If these annotations are missing or incorrectly placed, the Swagger UI might not be able to find the API documentation, resulting in a `404 error`.

Here's an example of how these annotations should be used:

```javascript
@RestController
@RequestMapping("/api")
public class MyController {
    // Controller methods
}
```

In the above code, the `@RestController` annotation tells Spring that this class is a controller, while the `@RequestMapping("/api")` annotation sets the base path for the API.

## Step 5: Check the API Documentation

Finally, check the **API documentation** generated by Springdoc-Openapi. This documentation is typically located at `/v3/api-docs` or `/v3/api-docs.yaml`. If you can access this documentation without encountering a 404 error, then the issue might be with the Swagger UI, not the API documentation.

By following these steps, you should be able to resolve the 404 error on Swagger UI with Spring. Remember, the key to resolving any error is to understand its cause. Once you understand why the error is occurring, you can take the necessary steps to fix it.
# Recommended Sites

If you're trying to resolve a 404 Error on Swagger UI with Spring, it can be a complex task. However, these official sites provide comprehensive guides to Springdoc-Openapi Configuration. They are reliable, updated regularly, and most importantly, you won't encounter any 404 errors when visiting them.

1. [Springdoc Official Site](https://springdoc.org/)
2. [Spring Framework Official Documentation](https://docs.spring.io/spring-framework/docs/current/reference/html/)
3. [Swagger UI Official Github Repository](https://github.com/swagger-api/swagger-ui)
4. [Stackoverflow - Spring Section](https://stackoverflow.com/questions/tagged/spring)
5. [Baeldung - Guides on Spring](https://www.baeldung.com/section/spring)
6. [Spring Boot Official Documentation](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)

These sites offer a wealth of information on not just resolving 404 errors with Swagger UI and Spring, but also a broad range of topics related to Springdoc-Openapi Configuration. Make sure to bookmark them for future reference.