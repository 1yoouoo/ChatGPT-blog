---
layout: post
title: "Resolving the Unsupported Class File Major Version 64 Error in Spring Initializr Project"
tags: ['java', 'spring', 'kotlin', 'gradle', 'spring-initializr']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

If you're a developer working with Spring Initializr Project, you might have encountered the "Unsupported Class File Major Version 64" error. This error can be quite frustrating and confusing, especially if you're not sure why it's happening. This blog post aims to help you understand and resolve this error.

## Understanding the Error

The **"Unsupported Class File Major Version 64"** error typically occurs when you're trying to run a Spring Initializr Project with a Java version that's not compatible with the version used to compile the project. In other words, the Java version in your environment doesn't support the class file major version 64.

There are two common mistakes that can lead to this error:

1. **Using an outdated Java version:** If you're using an older version of Java to run the project, you might encounter this error. The class file major version 64 corresponds to Java 14. So, if you're using a Java version that's older than Java 14, you'll see this error.

2. **Mismatch between the project's Java version and the environment's Java version:** If you've compiled your project with Java 14, but you're running it in an environment with a different Java version, you'll also get this error.

## The Solution

The solution to this error is fairly straightforward. You need to ensure that the Java version in your environment matches the Java version used to compile your project.

Here's a simple way to check your Java version:

```javascript
java -version
```

This command will display the Java version in your environment. If the version is less than 14, you'll need to upgrade it.

To upgrade your Java version, you can use the following command:

```javascript
sudo apt-get install openjdk-14-jdk
```

This command will install OpenJDK 14 in your environment. After running this command, you should be able to run your Spring Initializr Project without encountering the "Unsupported Class File Major Version 64" error.

## Understanding the Code

The `java -version` command is a simple way to check the Java version in your environment. It's a command-line tool that displays the version of the Java runtime environment.

The `sudo apt-get install openjdk-14-jdk` command is used to install OpenJDK 14. `sudo` is a command that allows you to run programs with the security privileges of another user (by default, the superuser). `apt-get` is a package handling utility in Debian-based operating systems. `install` is the command to install a new package, and `openjdk-14-jdk` is the package to be installed.

## Conclusion

The "Unsupported Class File Major Version 64" error in Spring Initializr Project is a common issue that developers face. It's caused by using an incompatible Java version to run the project. By ensuring that your environment's Java version matches the project's Java version, you can easily resolve this error.

Remember to always check your Java version before running a Spring Initializr Project. If you encounter this error, upgrading your Java version should solve the problem. We hope this blog post has been helpful in understanding and resolving the "Unsupported Class File Major Version 64" error. Happy coding!

If you're a developer working with Spring Initializr, you may have encountered the **"Unsupported Class File Major Version 64"** error. This error typically occurs when you're trying to run a project that has been compiled with a higher version of Java than the one you're currently using. In this blog post, we'll delve into the details of this error and provide a step-by-step guide to resolving it.

## Understanding the Error

First, let's understand what this error means. The "Unsupported Class File Major Version 64" error is Java's way of saying that it doesn't recognize the version of the bytecode in the class file. Each version of Java has a corresponding 'major version' number, which is used to identify the version of the bytecode. For instance, Java 8 corresponds to major version 52, Java 11 to 55, and so forth. If you're using a lower version of Java to run a program compiled with a higher version, you'll encounter this error.

## Identifying the Java Version

The first step in resolving this error is identifying the version of Java you're currently using. You can do so by running the following command in your terminal:

```javascript
java -version
```

The output will display the version of Java currently installed on your system. For instance, if you're using Java 8, the output will be something like:

```javascript
java version "1.8.0_231"
Java(TM) SE Runtime Environment (build 1.8.0_231-b11)
Java HotSpot(TM) 64-Bit Server VM (build 25.231-b11, mixed mode)
```

## Checking the Project's Java Version

Next, you need to check the version of Java with which your project has been compiled. If you're using Maven, you can find this information in the `pom.xml` file. Look for the `maven-compiler-plugin` configuration:

```xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>3.8.0</version>
    <configuration>
        <source>11</source>
        <target>11</target>
    </configuration>
</plugin>
```

In this example, the `<source>` and `<target>` tags indicate that the project has been compiled with Java 11.

## Resolving the Error

Now that you know the versions of Java involved, you can resolve the error. If your system's Java version is lower than the project's version, you'll need to update your Java. You can download the required Java Development Kit (JDK) from Oracle's official website.

After installing the new JDK, you need to set it as the default. On Windows, you can do this through the "Environment Variables" section in the System Properties. On Linux or MacOS, you can use the `update-alternatives` command or modify the `~/.bash_profile` file, respectively.

## Verifying the Solution

Once you've updated Java and set the new version as the default, you should verify that the error has been resolved. Run the `java -version` command again to ensure that the correct version is being used. Then, try running your project again. If everything has been done correctly, the "Unsupported Class File Major Version 64" error should no longer appear.

## Conclusion

In conclusion, the "Unsupported Class File Major Version 64" error in a Spring Initializr project arises when the Java version used to run the project is lower than the version used to compile it. By identifying the versions involved and updating your system's Java version if necessary, you can resolve this error. Remember to always check the Java versions when you encounter class file errors, as these are often the root cause of such issues.
# Recommended Sites

If you're dealing with the "Unsupported Class File Major Version 64" Error in Spring Initializr Project, here are some official and reliable sites you can refer to:

1. [Spring Official Site](https://spring.io/)
2. [Spring Initializr GitHub Repository](https://github.com/spring-io/start.spring.io)
3. [StackOverflow](https://stackoverflow.com/)
4. [Baeldung](https://www.baeldung.com/)
5. [Oracle Java Documentation](https://docs.oracle.com/en/java/)
6. [Spring Framework Guru](https://springframework.guru/)
7. [Spring Boot Dev Tools Documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/using-spring-boot.html#using-boot-devtools)

These sites are regularly updated and maintained, ensuring that they remain accessible and free of 404 errors. They offer a wealth of information and resources to help you resolve the error you're encountering.