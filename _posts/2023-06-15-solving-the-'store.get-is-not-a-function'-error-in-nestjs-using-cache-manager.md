---
layout: post
title: "Solving the 'store.get is not a function' Error in NestJs using cache-manager"
tags: ['nestjs']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## Understanding the 'store.get is not a function' Error

In the world of NestJs, a common error that developers often encounter is the `store.get is not a function` error. This error typically occurs when you're trying to use the `cache-manager` package in your application.

**Why does this error occur?** 

The primary reason this error occurs is due to a **misconfiguration** or **improper usage** of the `store` in the `cache-manager` package.

### Common Mistake 1: Misconfiguration of Store 

The `store` in `cache-manager` is a crucial element that determines the storage medium for your cache. It could be a memory store, a Redis store, or any custom store. If this `store` is not correctly configured, it can lead to the `store.get is not a function` error.

Consider the following example:

```typescript
import * as cacheManager from 'cache-manager';

const cache = cacheManager.caching({
  store: 'memoryStore'
});
```

In the above code, we're trying to configure the `store` as `memoryStore`. But, the correct store name is `memory`, not `memoryStore`. Therefore, this misconfiguration will lead to the `store.get is not a function` error.

### Common Mistake 2: Improper Usage of Store

Another common mistake is the improper usage of the `store` in your application. This typically happens when you're trying to use the `get` function on the `store` before it's properly initialized.

Here's an example:

```typescript
import * as cacheManager from 'cache-manager';

const cache = cacheManager.caching({
  store: 'memory'
});

cache.store.get('key', (err, result) => {
  console.log(result);
});
```

In this code, we are trying to use the `get` function directly on the `store`. However, the `store` in `cache-manager` does not expose a `get` function directly. Instead, the `get` function should be used on the `cache` object, like so:

```typescript
cache.get('key', (err, result) => {
  console.log(result);
});
```

## Solving the Error

Now that we've identified the common mistakes that lead to this error, let's discuss how to solve it.

### Solution 1: Correct Configuration of Store

First and foremost, ensure that your `store` is correctly configured. The store name should match one of the stores provided by `cache-manager` or a custom store that you have defined.

Here's how you can correctly configure a memory store:

```typescript
import * as cacheManager from 'cache-manager';

const cache = cacheManager.caching({
  store: 'memory'
});
```

In this code, we've correctly configured the `store` as `memory`. This will ensure that our cache uses the memory store provided by `cache-manager`.

### Solution 2: Proper Usage of Store

Secondly, always ensure that you're using the `get` function properly. The `get` function should be used on the `cache` object, not directly on the `store`.

Here's an example:

```typescript
import * as cacheManager from 'cache-manager';

const cache = cacheManager.caching({
  store: 'memory'
});

cache.get('key', (err, result) => {
  console.log(result);
});
```

In this code, we're correctly using the `get` function on the `cache` object. This will retrieve the value associated with the 'key' from our memory store.

### Final Thoughts

Remember, the `store.get is not a function` error in NestJs using `cache-manager` is primarily due to a misconfiguration or improper usage of the `store`. By ensuring that your `store` is correctly configured and used, you can easily avoid this error.

Understanding these nuances in the `cache-manager` package will not only help you solve this error but also make you a better developer. So, keep coding and keep exploring!
title: Solving the 'store.get is not a function' Error in NestJs using cache-manager
date: 2022-04-20
tags: ["NestJs", "Error Handling", "cache-manager"]
---

Hello developers! Today we're going to tackle a common error that many of us encounter when using **NestJs** with **cache-manager**. The error message is `'store.get is not a function'`. If you've seen this error message before, you know how frustrating it can be. But don't worry! In this post, we'll walk through a step-by-step solution to this problem.

First, let's understand what this error message means. When you see `'store.get is not a function'`, it's because the cache store you're trying to use doesn't have a `get` method. This is a common issue when the cache store isn't properly configured.

```javascript
import * as cacheManager from 'cache-manager';

@Injectable()
export class AppService {
  cache: any;

  constructor() {
    this.cache = cacheManager.caching({store: 'memory'});
  }

  async get(key: string) {
    return this.cache.get(key);
  }
}
```

In the above example, we're trying to use the `memory` store, but if it's not properly configured, you'll get the `'store.get is not a function'` error.

The first step to solving this problem is to ensure that the cache store is correctly set up. In the case of the `memory` store, you can do this by installing the `cache-manager-memory-store` package.

```bash
npm install --save cache-manager-memory-store
```

Next, you need to import the `memoryStore` from the `cache-manager-memory-store` package and use it when configuring the cache manager.

```javascript
import * as cacheManager from 'cache-manager';
import memoryStore from 'cache-manager-memory-store';

@Injectable()
export class AppService {
  cache: any;

  constructor() {
    this.cache = cacheManager.caching({store: memoryStore});
  }

  async get(key: string) {
    return this.cache.get(key);
  }
}
```

In the updated code snippet above, we're now using the `memoryStore` from the `cache-manager-memory-store` package. This should resolve the `'store.get is not a function'` error.

But what if you're not using the `memory` store? What if you're using a different cache store like `redis` or `mongo`? The solution is similar. You need to ensure that you're using the correct package for your cache store and that it's properly configured.

For example, if you're using `redis` as your cache store, you would need to install the `cache-manager-ioredis` package and use it when configuring the cache manager.

```bash
npm install --save cache-manager-ioredis
```

```javascript
import * as cacheManager from 'cache-manager';
import redisStore from 'cache-manager-ioredis';

@Injectable()
export class AppService {
  cache: any;

  constructor() {
    this.cache = cacheManager.caching({store: redisStore, ...});
  }

  async get(key: string) {
    return this.cache.get(key);
  }
}
```

In the updated code snippet above, we're now using the `redisStore` from the `cache-manager-ioredis` package. Again, this should resolve the `'store.get is not a function'` error.

Remember, the key to solving this error is to ensure that the cache store is correctly set up. This means using the correct package for your cache store and correctly configuring it.

I hope this post has helped you understand and resolve the `'store.get is not a function'` error in NestJs using cache-manager. Remember, error messages are just clues to help you find the solution. Happy coding!
# Recommended Sites

If you're struggling with the 'store.get is not a function' error in NestJs using cache-manager, here are some official and reliable sites that can help you understand and resolve the issue. These sites are highly recommended because they are currently active, and you won't encounter any 404 errors when visiting them.

1. **NestJs Official Documentation** - The official NestJs documentation is a great place to start. It provides a comprehensive guide about the framework, including how to work with cache-manager. 
   
   [https://docs.nestjs.com/techniques/caching](https://docs.nestjs.com/techniques/caching)

2. **GitHub - NestJs/cache** - This is the official GitHub repository for NestJs cache. You can find a lot of useful information about cache-manager here and also ask questions or report issues if necessary.
   
   [https://github.com/nestjs/cache](https://github.com/nestjs/cache)

3. **Stack Overflow - NestJs Questions** - Stack Overflow is a very active community where you can find a lot of questions and answers about NestJs and cache-manager. It's very likely that someone has already encountered and solved the same problem.

   [https://stackoverflow.com/questions/tagged/nestjs](https://stackoverflow.com/questions/tagged/nestjs)

4. **NestJs Community Discord Server** - This is the official Discord server of the NestJs community. It's a great place to ask questions and get help from other NestJs developers.

   [https://discord.com/invite/nestjs](https://discord.com/invite/nestjs)

Remember, debugging is a part of the development process. Don't be discouraged if you run into problems. Use these resources to learn and grow as a developer. Happy coding!