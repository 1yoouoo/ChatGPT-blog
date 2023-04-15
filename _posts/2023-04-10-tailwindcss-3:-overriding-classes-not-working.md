---
layout: post
title: "TailwindCSS 3: Overriding Classes Not Working"
tags: ['css', 'reactjs', 'tailwind-css']
---

![Image of a Cat](http://source.unsplash.com/1600x900/?cat)

TailwindCSS is a powerful and popular CSS framework that allows developers to quickly and easily build custom user interfaces. It's used by many companies and developers around the world, but sometimes users run into issues when trying to override certain classes. In this article, we'll discuss some of the common mistakes that can lead to TailwindCSS 3 overriding classes not working, and provide some tips on how to fix them.

## Common Mistakes

The most common mistake when it comes to TailwindCSS 3 overriding classes not working is forgetting to include the `@apply` directive. The `@apply` directive is used to apply a set of utility classes to an element, and must be included in order for TailwindCSS to recognize the classes. For example, if you wanted to apply the `text-xs` class to a `<div>`, you would need to include the following code:

```html
<div class="@apply text-xs">
    This is some text.
</div>
```

Another common mistake when it comes to TailwindCSS 3 overriding classes not working is using the wrong class names. TailwindCSS class names are all prefixed with `tw-`, so if you were trying to apply the `text-xs` class, you would need to use the `tw-text-xs` class instead.

## Overriding Classes

When trying to override TailwindCSS 3 classes, it's important to remember that the order in which classes are applied matters. TailwindCSS will always apply the class that appears last in the list, so if you're trying to override a class, make sure it appears last. For example, if you wanted to apply the `text-xs` class to a `<div>`, but wanted to override the `text-sm` class that was previously applied, you would need to include the following code:

```html
<div class="text-sm tw-text-xs">
    This is some text.
</div>
```

In this example, the `tw-text-xs` class is applied last, so it will override the `text-sm` class.

## Conclusion

Troubleshooting TailwindCSS 3 overriding classes not working can be a tricky process, but with the right knowledge and understanding of TailwindCSS, you can quickly and easily fix any issues you may have. Make sure to always include the `@apply` directive, and remember that the order in which classes are applied matters.

TailwindCSS 3 is a popular utility-first CSS framework that enables developers to quickly build custom user interfaces. It is widely used for designing websites, applications, and other web-based projects. However, one of the common issues that developers face when using TailwindCSS 3 is that overriding classes is not working as expected.

In this blog post, we will discuss what causes this issue, how to debug it, and how to fix it. We will also provide a step-by-step guide and code snippets to make it easier to understand and follow along.

## What Causes This Issue?

When using TailwindCSS 3, it is possible to override the default classes using the `@apply` directive. This directive allows developers to create custom classes that can be used in their projects. However, sometimes the `@apply` directive does not work as expected and the override classes are not applied.

The main reason behind this issue is that TailwindCSS 3 uses a two-step process to apply classes. The first step is to apply the default classes, and the second step is to apply the override classes. If the override classes are not applied correctly, the default classes will be applied instead.

## How to Debug This Issue?

To debug this issue, we need to understand what is happening behind the scenes. To do this, we need to inspect the HTML and CSS code that is generated by TailwindCSS 3.

When inspecting the HTML code, we need to look for the `class` attribute and its value. This will tell us which classes are being applied to the HTML element. If the override classes are not being applied, we need to look for the `@apply` directive in the CSS code.

When inspecting the CSS code, we need to look for the `@apply` directive and its value. This will tell us which classes are being applied to the HTML element. If the override classes are not being applied, we need to look for the `@apply` directive in the HTML code.

## How to Fix This Issue?

To fix this issue, we need to make sure that the `@apply` directive is correctly applied in both the HTML and CSS code. To do this, we need to add the `@apply` directive to the HTML code and make sure that the class name is correctly specified in the CSS code.

In the HTML code, we need to add the `@apply` directive to the `class` attribute of the HTML element. For example, if we want to apply the `text-xl` class to an element, we need to add the following code in the HTML:

```html
<div class="@apply text-xl">...</div>
```

In the CSS code, we need to make sure that the class name is correctly specified. For example, if we want to apply the `text-xl` class to an element, we need to add the following code in the CSS:

```css
.text-xl {
  font-size: 1.5rem;
}
```

Once these changes are made, the override classes should be applied correctly.

## Conclusion

In this blog post, we discussed what causes the issue of overriding classes not working in TailwindCSS 3. We also discussed how to debug and fix this issue. By following the steps outlined above, you should be able to successfully apply the override classes in your projects.
## Recommended sites
- [Tailwind CSS: Overriding Classes Not Working](https://tailwindcss.com/docs/overriding-classes-not-working)
- [Tailwind CSS: Troubleshooting](https://tailwindcss.com/docs/troubleshooting)
- [Tailwind CSS: Utility Classes](https://tailwindcss.com/docs/utility-classes)
- [Tailwind CSS: Customizing Your Build](https://tailwindcss.com/docs/customizing-your-build)
- [CSS Tricks: Overriding Tailwind CSS Classes](https://css-tricks.com/overriding-tailwind-css-classes/)
- [Stack Overflow: Override Tailwind CSS Classes](https://stackoverflow.com/questions/56959282/override-tailwind-css-classes)