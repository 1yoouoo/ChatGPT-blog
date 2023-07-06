---
layout: post
title: "Troubleshooting 'Non-Serializable Value Detected in an Action' Error for a Date in Redux RTK"
tags: ['redux', 'react-redux', 'redux-thunk', 'redux-toolkit']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

## Introduction

Redux Toolkit (RTK) is an efficient tool for managing your app's global state. However, sometimes it throws some head-scratching errors. One such error is the `Non-Serializable Value Detected in an Action` error. This error is usually encountered when we try to dispatch an action that contains a non-serializable value such as a JavaScript Date object. 

## Understanding the Error

Before we dive into how to resolve this error, let's first understand why it occurs. Redux enforces the rule that all state and actions must be serializable. This means they can be converted into a string format that can be stored and later reconstructed. This is important because Redux uses serializable states for features like time-travel debugging.

However, JavaScript's Date object is not serializable. Therefore, when we try to dispatch an action that contains a Date object, Redux throws the `Non-Serializable Value Detected in an Action` error.

## Common Mistakes

There are a couple of common mistakes that might lead to this error.

1. **Dispatching a Date object directly in an action**: This is the most common mistake. If you dispatch an action containing a Date object like this:

```javascript
dispatch({ type: 'ADD_DATE', payload: new Date() })
```

Redux will throw the `Non-Serializable Value Detected in an Action` error because the Date object is not serializable.

2. **Storing a Date object in the Redux state**: This is another common mistake. If you try to store a Date object directly in the Redux state like this:

```javascript
const initialState = { date: new Date() }
```

Redux will again throw the `Non-Serializable Value Detected in an Action` error because the Date object in the state is not serializable.

## Converting Date to a Serializable Format

The solution to this error is to convert the Date object into a serializable format before dispatching the action or storing it in the state. The most common way to do this is to convert the Date object into a string using the `toISOString()` method.

Here's how you can do this when dispatching an action:

```javascript
dispatch({ type: 'ADD_DATE', payload: new Date().toISOString() })
```

And here's how you can do it when storing a Date object in the state:

```javascript
const initialState = { date: new Date().toISOString() }
```

Now, Redux will not throw the `Non-Serializable Value Detected in an Action` error because the Date object has been converted into a serializable format.

## Handling Date in Reducers

When you need to use the date in a reducer, you can convert the string back into a Date object using the `new Date()` constructor. Here's an example:

```javascript
function reducer(state = initialState, action) {
  switch (action.type) {
    case 'ADD_DATE':
      return { ...state, date: new Date(action.payload) }
    default:
      return state
  }
}
```

In this reducer, `action.payload` is a string, but we're converting it back into a Date object before storing it in the state. This allows us to work with the Date object in our app while keeping Redux happy by only dispatching and storing serializable values.

## Conclusion

In conclusion, the `Non-Serializable Value Detected in an Action` error in Redux RTK is caused by trying to dispatch an action or store a state that contains a non-serializable value like a Date object. The solution is to convert the Date object into a serializable format like a string before dispatching the action or storing the state. This allows us to work with Date objects in our app while complying with Redux's rule of only dispatching and storing serializable values.

If you're a developer who works with **Redux RTK**, you might have come across an error message that says `'Non-Serializable Value Detected in an Action'`. This error typically occurs when you try to pass a non-serializable value to an action. One common scenario where this error can occur is when you're trying to pass a **Date** object to an action. In this blog post, we'll delve into this error in detail and provide a step-by-step solution to help you resolve this error.

## The Non-Serializable Value Error

Before we delve into the solution, let's first understand what this error means. In Redux, all your state updates need to be described as plain objects: actions. These actions must be serializable. In other words, they should be capable of being converted into a string format using `JSON.stringify()`. When you pass a non-serializable value, such as a **Date** object, to an action, Redux throws the `'Non-Serializable Value Detected in an Action'` error.

```javascript
let action = {
  type: 'UPDATE_DATE',
  payload: new Date()  // This is a non-serializable value
}
```

In the above code example, we're trying to pass a **Date** object to an action. Since a **Date** object is not serializable, Redux throws an error.

## The Solution

To solve this error, you need to convert the non-serializable value to a serializable format before passing it to an action. In the case of a **Date** object, you can convert it to a string format using the `toISOString()` method.

```javascript
let action = {
  type: 'UPDATE_DATE',
  payload: new Date().toISOString()  // This is a serializable value
}
```

In the updated code, instead of directly passing the **Date** object, we're converting it to a string format using the `toISOString()` method. This returns a string in ISO format (YYYY-MM-DDTHH:MM:SS.sssZ), which is a serializable value.

## A Word of Caution

While this solution works, it's important to note that you'll need to convert the string back to a **Date** object whenever you need to use it as a **Date**. This can be done using the `new Date()` constructor.

```javascript
let date = new Date(action.payload);  // Converts the string back to a Date object
```

## A Better Solution

While the above solution works, it's not the most efficient way to handle dates in Redux. A better solution would be to store the date as a Unix timestamp, which is a serializable value.

```javascript
let action = {
  type: 'UPDATE_DATE',
  payload: new Date().getTime()  // This is a serializable value
}
```

In the updated code, we're using the `getTime()` method, which returns the number of milliseconds since the Unix Epoch (January 1, 1970 00:00:00 UTC). This value is serializable and can be easily converted back to a **Date** object.

```javascript
let date = new Date(action.payload);  // Converts the timestamp back to a Date object
```

## Final Thoughts

In Redux, it's important to ensure that all your actions are serializable. This makes it easier to manage your state, debug issues, and implement features like time-travel debugging. While non-serializable values like **Date** objects can be used, they need to be converted to a serializable format before being passed to an action.

In this blog post, we discussed how to resolve the `'Non-Serializable Value Detected in an Action'` error for a **Date** in Redux RTK. We hope this helps you in your development journey. Happy coding!
# Recommended Sites

If you're encountering the "Non-Serializable Value Detected in an Action" error for a date in Redux RTK and need some official resources for troubleshooting, these are the sites you should consider:

- [Redux Toolkit Official Documentation](https://redux-toolkit.js.org/)
- [Redux GitHub Repository](https://github.com/reduxjs/redux)
- [Stack Overflow Redux Toolkit Questions](https://stackoverflow.com/questions/tagged/redux-toolkit)
- [Redux Toolkit on Redux.js.org](https://redux.js.org/tutorials/essentials/part-5-async-logic)
- [Mozilla Developer Network (MDN) JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)

These sites are regularly updated, and you won't encounter a 404 error when visiting them. They provide accurate and comprehensive information about Redux Toolkit, including how to troubleshoot common errors.