---
layout: post
title: "Resolving the 'Non-Serializable Value Detected in an Action' Error for a Date in Redux RTK"
tags: ['redux', 'react-redux', 'redux-thunk', 'redux-toolkit']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## Understanding the 'Non-Serializable Value Detected in an Action' Error

The **'Non-Serializable Value Detected in an Action'** error in Redux Toolkit (RTK) typically surfaces when you try to dispatch an action that includes a non-serializable value, such as a Date object. This error is part of RTK's serializability check middleware, which ensures that all actions and state are serializable. 

## Why is Serializability Important?

Serializability is a key aspect of Redux's design. It enables features like time travel debugging, state persistence, and more. Non-serializable values can cause issues with these features, hence Redux RTK enforces this check.

## Common Mistakes Leading to the Error

**Mistake 1:** One common mistake is directly dispatching an action with a Date object. Consider the following code:

```javascript
const action = {
  type: 'ADD_TODO',
  payload: {
    text: 'Buy milk',
    addedAt: new Date(),
  },
};

dispatch(action);
```

In this case, the `addedAt` field is a Date object, which is non-serializable. This would trigger the 'Non-Serializable Value Detected in an Action' error.

**Mistake 2:** Another common mistake is including a Date object in the state. For instance:

```javascript
const initialState = {
  todos: [],
  lastUpdated: new Date(),
};
```

Here, the `lastUpdated` field in the initial state is a Date object, which is non-serializable. This will also trigger the error.

## How to Resolve the Error

To resolve the 'Non-Serializable Value Detected in an Action' error, we need to ensure that all values in actions and state are serializable.

**Solution 1:** For Date objects, we can convert them to a serializable format such as a timestamp or a string. Here's how to modify the earlier examples:

```javascript
const action = {
  type: 'ADD_TODO',
  payload: {
    text: 'Buy milk',
    addedAt: new Date().toISOString(),
  },
};

dispatch(action);
```

In this case, we're using the `toISOString()` method to convert the Date object to a string.

```javascript
const initialState = {
  todos: [],
  lastUpdated: new Date().getTime(),
};
```

Here, we're using the `getTime()` method to convert the Date object to a timestamp.

**Solution 2:** Another approach is to disable the serializability check for certain actions or slices of state. However, this should be used sparingly, as it can lead to issues with Redux features that rely on serializability.

```javascript
const store = configureStore({
  reducer,
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: ['ADD_TODO'],
      },
    }),
});
```

In this example, we're disabling the serializability check for the 'ADD_TODO' action.

## A Word of Caution

While it's possible to disable the serializability check, it's generally better to ensure that your actions and state are serializable. Non-serializable values can lead to subtle bugs and make it harder to debug your Redux store.

Remember, the 'Non-Serializable Value Detected in an Action' error is there to help you build robust Redux applications. Embrace it, understand it, and use it to your advantage.

If you've been working with Redux Toolkit (RTK) and React, chances are you've come across the `'Non-Serializable Value Detected in an Action'` error. This error typically arises when you try to dispatch an action with a non-serializable value, such as a `Date` object. In this blog post, we'll delve into the specifics of this error and provide a step-by-step guide on how to resolve it.

## Understanding the Error

The first step in resolving any error is understanding what it means. In Redux, all state updates must be serializable. This means they must be able to be converted into a format that can be stored and later reconstructed. This is a fundamental principle of Redux, and it's what allows for features like time-travel debugging.

However, JavaScript's `Date` object is not serializable. When you try to dispatch an action with a `Date` object, Redux will throw the `'Non-Serializable Value Detected in an Action'` error.

## Why Does This Matter?

You might be wondering why it matters if a value is serializable or not. After all, JavaScript can handle `Date` objects just fine, right? The issue is not with JavaScript, but with Redux. Redux needs to be able to take a snapshot of your app's state at any point in time. This is what enables powerful features like time-travel debugging and state persistence. If your state contains non-serializable values, Redux can't take these snapshots accurately.

## The Solution

So how do you resolve this error? The solution is to convert your `Date` object into a serializable format before dispatching your action. The most common approach is to convert the `Date` object into a string using the `toISOString()` method.

Here's an example:

```javascript
const action = {
  type: 'UPDATE_DATE',
  payload: new Date().toISOString(),
};
dispatch(action);
```

In this example, `new Date().toISOString()` creates a new `Date` object and immediately converts it into a string. This string is then dispatched as the payload of the `UPDATE_DATE` action.

## A Word of Caution

While this solution works, it's important to remember that the `toISOString()` method converts the `Date` object into a string in the ISO 8601 format (e.g., "2022-03-15T12:34:56.789Z"). This might not be the format you want. If you need the date in a different format, you'll need to use a library like Moment.js or date-fns to format the date string appropriately.

## Dealing with Incoming Dates

The solution above works great for outgoing dates, but what about incoming dates? If your app receives a date from an API, it will likely be in a string format. You'll need to convert this string back into a `Date` object before you can use it.

Here's how you can do this:

```javascript
const action = {
  type: 'SET_DATE',
  payload: new Date(dateString),
};
dispatch(action);
```

In this example, `new Date(dateString)` converts the incoming date string back into a `Date` object. This `Date` object is then dispatched as the payload of the `SET_DATE` action.

## A More Robust Solution

The solutions above work, but they require you to remember to convert your dates every time you dispatch an action. A more robust solution is to use middleware to automatically serialize and deserialize your dates.

Here's an example of how you can do this:

```javascript
const dateMiddleware = store => next => action => {
  const { payload } = action;
  if (payload instanceof Date) {
    action.payload = payload.toISOString();
  } else if (typeof payload === 'string') {
    action.payload = new Date(payload);
  }
  next(action);
};
```

In this example, the `dateMiddleware` function checks if the payload is a `Date` object or a string. If it's a `Date` object, it serializes it into a string. If it's a string, it deserializes it back into a `Date` object. This way, you can dispatch dates without having to worry about serialization.

## Conclusion

The `'Non-Serializable Value Detected in an Action'` error can be a bit confusing at first, but it's easy to resolve once you understand what's going on. By ensuring your dates are always serialized before they're dispatched, you can avoid this error and keep your Redux state clean and debuggable.

Remember, Redux is a powerful tool, but it comes with its own set of rules and principles. Understanding these rules and principles is key to using Redux effectively. The `'Non-Serializable Value Detected in an Action'` error is a good reminder of this.
# Recommended Sites

If you're looking to resolve the 'Non-Serializable Value Detected in an Action' error for a date in Redux RTK, here are some official sites that you can refer to:

1. Redux Toolkit Official Documentation: [https://redux-toolkit.js.org/](https://redux-toolkit.js.org/)
2. Redux Official GitHub Repository: [https://github.com/reduxjs/redux](https://github.com/reduxjs/redux)
3. Stack Overflow Redux Topics: [https://stackoverflow.com/questions/tagged/redux](https://stackoverflow.com/questions/tagged/redux)
4. Mozilla Developer Network (MDN) JavaScript Date Documentation: [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)
5. React-Redux Official Documentation: [https://react-redux.js.org/](https://react-redux.js.org/)

Remember, when working with Redux, it's always best to refer to official documentation and repositories for the most accurate and up-to-date information. Happy coding!