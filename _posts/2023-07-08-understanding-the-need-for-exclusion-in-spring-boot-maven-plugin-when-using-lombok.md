---
layout: post
title: "Understanding the Need for Exclusion in Spring-boot-maven-plugin When Using LOMBOK"
tags: ['spring', 'spring-boot', 'intellij-idea', 'lombok', 'intellij-lombok-plugin']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## **Subheading: Navigating the Complexities of Spring-boot-maven-plugin and LOMBOK Integration**

As developers, we often encounter various errors and issues during the integration of different tools and frameworks. One such common issue arises when we try to integrate **LOMBOK** with the `spring-boot-maven-plugin`. This blog post aims to shed light on this intricate problem and guide you through the process of understanding and resolving it.

### **The Common Issue: LOMBOK and Spring-boot-maven-plugin**

To start with, let's understand the problem. When we use **LOMBOK** in a Spring Boot project, we often encounter a `java.lang.ClassNotFoundException` error. This error is usually related to the `spring-boot-maven-plugin`. The plugin is unable to find certain LOMBOK generated classes during the execution phase, causing this error. 

### **Why Does This Error Occur?**

The root cause of this issue lies in the way the `spring-boot-maven-plugin` works. By default, it includes all the classes and resources from the project classpath. However, LOMBOK generates some classes at compile time, which are not included in the project classpath. Hence, when the plugin tries to find these classes, it encounters the `java.lang.ClassNotFoundException` error. 

### **The Need for Exclusion**

To resolve this issue, we need to exclude the LOMBOK related classes from the `spring-boot-maven-plugin`. By doing so, the plugin will not look for these classes during the execution phase, thus preventing the error.

Here is how you can do it in your Maven configuration:

```xml
<build>
  <plugins>
    <plugin>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-maven-plugin</artifactId>
      <configuration>
        <excludes>
          <exclude>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
          </exclude>
        </excludes>
      </configuration>
    </plugin>
  </plugins>
</build>
```
In the above code, we have excluded the LOMBOK related classes from the `spring-boot-maven-plugin` by specifying the group and artifact id of LOMBOK in the `<exclude>` tag.

### **Understanding the Code**

In the `pom.xml` file of your Maven project, you can find the `<build>` tag. Inside this tag, we define the build lifecycle of our project. The `<plugins>` tag inside the `<build>` tag contains the list of plugins that we use in our project.

The `spring-boot-maven-plugin` is one such plugin that we use to create executable JARs. Inside this plugin, we have the `<configuration>` tag where we specify the configuration details for this plugin. The `<excludes>` tag inside the `<configuration>` tag is where we specify the classes or resources that we want to exclude from this plugin.

In our case, we are excluding the LOMBOK related classes by specifying the group id (`org.projectlombok`) and artifact id (`lombok`) of LOMBOK in the `<exclude>` tag. This tells the `spring-boot-maven-plugin` not to look for these classes during the execution phase, thus preventing the `java.lang.ClassNotFoundException` error.

### **Common Mistakes**

1. **Incorrect Group or Artifact ID**: One common mistake developers make is specifying the wrong group or artifact id in the `<exclude>` tag. Make sure to use the correct group id (`org.projectlombok`) and artifact id (`lombok`) of LOMBOK.

2. **Not Updating the Maven Project**: Another common mistake is not updating the Maven project after making changes in the `pom.xml` file. Always remember to update your Maven project (Right-click on project -> Maven -> Update Project) after making any changes in the `pom.xml` file.

By understanding the need for exclusion in the `spring-boot-maven-plugin` when using **LOMBOK** and by avoiding the common mistakes, you can prevent the `java.lang.ClassNotFoundException` error and ensure a smooth integration of LOMBOK in your Spring Boot project.

If you're a developer who uses the combination of **LOMBOK** and **Spring Boot Maven Plugin**, you may have encountered an error that seems inexplicable at first. This error often arises when LOMBOK is not properly excluded in the Spring Boot Maven Plugin. 

## Why does this error occur?

To understand the cause of this error, we first need to comprehend the role of **LOMBOK**. LOMBOK is a java library that plugs into your editor and builds tools, spicing up your java. It can create common methods for you, like `equals()`, `hashCode()`, `toString()`, and even `getters` and `setters` - all with just a few annotations. 

However, when it comes to using LOMBOK with the Spring Boot Maven Plugin, there's a catch. The Spring Boot Maven Plugin repackages your jars to be executable, and during this process, it includes all the necessary dependencies. If LOMBOK is not excluded, it will also be included in this process, leading to the error.

## The Solution

The solution to this error is to **exclude LOMBOK** when the Spring Boot Maven Plugin is repackaging the jars. Here's how you can do it:

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
            <configuration>
                <excludes>
                    <exclude>
                        <groupId>org.projectlombok</groupId>
                        <artifactId>lombok</artifactId>
                    </exclude>
                </excludes>
            </configuration>
        </plugin>
    </plugins>
</build>
```
In the above code, we are telling the Spring Boot Maven Plugin to exclude LOMBOK during the repackaging process. The `<groupId>` and `<artifactId>` specify the LOMBOK dependency that needs to be excluded.

## What does this mean?

Let's break it down:

- `<build>`: This is a build specification in Maven. It contains information about the project source code, like its directory structure.
- `<plugins>`: This is where we specify the plugins that our project uses.
- `<plugin>`: Here, we are specifying the Spring Boot Maven Plugin.
- `<groupId>` and `<artifactId>`: These are the coordinates of the plugin. They uniquely identify the plugin in the repository.
- `<configuration>`: This is where we can specify the configuration for the plugin.
- `<excludes>`: This is where we specify what needs to be excluded during the repackaging process.
- `<exclude>`: Here, we are specifying the LOMBOK dependency that needs to be excluded.

By adding this exclusion in your `pom.xml`, you are telling the Spring Boot Maven Plugin to ignore LOMBOK during the repackaging process, thus preventing the error.

## What's next?

Now that you have excluded LOMBOK in your Spring Boot Maven Plugin, you should be able to build your project without encountering the error. But remember, excluding LOMBOK means that it won't be available at runtime. This is usually not a problem because LOMBOK is a compile-time only library, and it doesn't need to be included in the final packaged application.

## Conclusion

In conclusion, the error you encounter when using LOMBOK with the Spring Boot Maven Plugin is due to LOMBOK being included in the repackaging process. The solution is to exclude LOMBOK in your `pom.xml`, as shown above. This will prevent the error and allow you to build your project successfully.

Remember that LOMBOK is a powerful tool that can make your Java code more concise and readable. However, like all tools, it needs to be used correctly. Always ensure that you understand the implications of adding or excluding dependencies in your build configuration.

I hope this post has helped you understand the need for exclusion in Spring-boot-maven-plugin when using LOMBOK. Happy coding!
# Recommended Sites

If you're interested in understanding the need for exclusion in spring-boot-maven-plugin when using LOMBOK, here are some official sites that you can refer to. These sites are reliable, up-to-date, and you won't encounter any 404 errors when visiting them.

1. [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/current/maven-plugin/reference/html/)

2. [Project Lombok](https://projectlombok.org/features/all)

3. [Maven - Excluding Dependencies](https://maven.apache.org/guides/introduction/introduction-to-optional-and-excludes-dependencies.html)

4. [Spring Boot with Lombok - Part 1](https://www.baeldung.com/spring-boot-lombok)

5. [Spring Boot with Lombok - Part 2](https://www.baeldung.com/lombok-builder-singular)

6. [Spring Boot and Lombok](https://reflectoring.io/spring-boot-lombok/)

7. [Stack Overflow - Lombok and Spring Boot](https://stackoverflow.com/questions/34303585/spring-boot-and-lombok-possible-issues)

Remember to always cross-check information from multiple sources to get a comprehensive understanding of the topic. Happy learning!