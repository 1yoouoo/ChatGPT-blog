---
layout: post
title: "Resolving the 404 Error on Swagger UI with Spring: A Guide to Springdoc-Openapi Configuration"
tags: ['spring', 'spring-boot', 'swagger-ui', 'openapi', 'springdoc']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## Subheading: Understanding and Rectifying the 404 Error in Swagger UI with Spring

In this blog post, we will delve into the issue of encountering a **404 error** when using Swagger UI with Spring. We will discuss the possible causes of this error and provide a comprehensive guide on how to resolve it through proper Springdoc-Openapi configuration.

### Common Mistakes Leading to the 404 Error

Before we dive into the solutions, let's first understand the common mistakes that can lead to this error. 

1. **Incorrect Swagger Configuration:** The most common mistake is having an incorrect Swagger configuration. This can be due to incorrect base package specification or wrong API info configuration. 

2. **Misconfigured URL Mapping:** Another common mistake is misconfigured URL mapping. If the URL mapping in your Spring Boot application is not correctly configured, Swagger UI might not be able to locate your API documentation, leading to a 404 error.

### The Role of Springdoc-Openapi

To resolve the 404 error, we need to properly configure our Spring application using **Springdoc-Openapi**. Springdoc-Openapi is a library that helps with creating OpenAPI 3.0 documentation for Spring Boot applications. It simplifies the generation of API documentation and also integrates with Swagger UI to provide a user-friendly interface.

### Configuring Swagger with Springdoc-Openapi

Below is a simple example of how to configure Swagger with Springdoc-Openapi.

```java
@Configuration
public class OpenApiConfiguration {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Sample Application API")
                        .version("1.0")
                        .description("This is a sample Spring Boot application"));
    }
}
```

In this code snippet, we define a `@Configuration` class that creates a `customOpenAPI()` bean. This bean sets the title, version, and description of our API documentation.

### Configuring URL Mapping

Next, we need to ensure that our URL mapping is correctly configured. Here's how to do it:

```java
@Configuration
public class SwaggerConfig {

    @Bean
    public Docket apiDocket() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.example"))
                .paths(PathSelectors.any())
                .build();
    }
}
```

In this example, we define a `@Configuration` class that creates an `apiDocket()` bean. This bean selects any API in the base package "com.example" and builds the Swagger documentation for it.

### Testing Swagger Configuration

After configuring Swagger and URL mapping, it's time to test our setup. To access the Swagger UI, navigate to `http://localhost:8080/swagger-ui/` in your web browser (replace `localhost:8080` with your server's address and port if necessary).

### Troubleshooting

If you're still encountering a 404 error, there might be other issues at play. Check your Spring Boot application's logs for any errors or warnings. Also, ensure that your application is correctly packaged and deployed.

### Conclusion

In conclusion, the 404 error in Swagger UI with Spring can be resolved by properly configuring Swagger with Springdoc-Openapi and ensuring correct URL mapping. By understanding these concepts and following the provided steps, you can effectively eliminate the 404 error and make your API documentation accessible via Swagger UI.

Facing a **404 error** on your Swagger UI with Spring and not sure how to resolve it? You've landed at the right place. In this detailed guide, we will walk you through the process of configuring Springdoc-Openapi to tackle this issue effectively. 

## Understanding the 404 Error

Before we delve into the solution, it's crucial to understand what a 404 error signifies. A **'404 Not Found' error** indicates that the server could not find the requested resource. In the context of Swagger UI with Spring, this often occurs when the application is unable to locate the Swagger UI page.

## The Role of Springdoc-Openapi

**Springdoc-Openapi** is a library that simplifies the generation of API documentation for Spring Boot projects. It works seamlessly with Swagger UI, providing a user-friendly interface for API documentation. However, incorrect configuration of Springdoc-Openapi can lead to the dreaded 404 error. 

## Step-by-Step Solution

Let's dive into the step-by-step solution to resolve this error.

### Step 1: Verify the Dependencies

The first step is to verify if you've added the correct **Springdoc-Openapi dependencies** in your `pom.xml` or `build.gradle` file. Here's an example of how to do this in a `pom.xml` file:

```xml
<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-ui</artifactId>
    <version>1.5.2</version>
</dependency>
```

This dependency ensures that the Springdoc-Openapi UI is correctly installed in your project. 

### Step 2: Check the Configuration

Next, check your **Spring Boot configuration**. The application properties or YAML file should contain the correct configuration for Springdoc-Openapi. For instance, the following properties should be set:

```properties
springdoc.swagger-ui.enabled=true
springdoc.swagger-ui.path=/swagger-ui.html
```

These properties enable the Swagger UI and set its path respectively.

### Step 3: Verify the Controller Mapping

Now, verify that your **controller mapping** matches the Swagger UI path. If there's a mismatch, the server will not be able to locate the Swagger UI page, leading to a 404 error. Here's an example of a correct controller mapping in Java:

```java
@RestController
@RequestMapping("/api")
public class MyController {
    // Controller methods
}
```

In this example, the base path for the controller is `/api`, which should match the path set in the Spring Boot configuration.

### Step 4: Check the Security Configuration

If you have a **security configuration** in place, ensure that it's not blocking access to the Swagger UI. You may need to permit all requests to the Swagger UI path. Here's an example of how to do this in Java:

```java
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
            .antMatchers("/swagger-ui.html").permitAll()
            // Other configuration
    }
}
```

In this example, all requests to `/swagger-ui.html` are permitted, ensuring that the Swagger UI is accessible.

### Step 5: Restart the Server

Finally, **restart your server**. If the 404 error was due to a configuration issue, it should now be resolved.

## Conclusion

In this guide, we've walked you through a step-by-step solution to resolve the 404 error on Swagger UI with Spring by configuring Springdoc-Openapi. We hope this guide proves helpful in your development journey. Remember, the key to resolving such errors lies in understanding the problem, verifying your configurations, and ensuring that all paths are correctly mapped. Happy coding!
# Recommended Sites 

If you're facing 404 error issues with Swagger UI and Spring, there are several official websites that can provide you with the guidance you need. Here are some recommended sites for resolving this issue and learning more about Springdoc-Openapi configuration:

1. [Springdoc.org](https://springdoc.org/)
2. [Swagger.io](https://swagger.io/docs/)
3. [Stackoverflow.com](https://stackoverflow.com/questions/tagged/springdoc-openapi)
4. [Baeldung.com](https://www.baeldung.com/spring-rest-openapi-documentation)
5. [Spring.io](https://spring.io/guides)
6. [Dzone.com](https://dzone.com/articles/spring-boot-restful-api-documentation-with-swagger)
7. [Github.com - Springdoc Repository](https://github.com/springdoc/springdoc-openapi)

Please note that the availability and error-free experience on these sites can vary based on various factors. Always ensure you have a stable internet connection before accessing these resources.