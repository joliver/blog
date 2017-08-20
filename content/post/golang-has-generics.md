+++
type = "post"
date = "2014-06-30"
title = "Golang Has Generics—Why I Don't Miss Generics Anymore"
description = ""
slug = "golang-has-generics"
tags = []
+++

There's a lot of discussion about generics in Go. In fact, it's one of the most-requested features in the language discussion groups. The language designers aren't against generics, but they have not found or seen a good proposal that allows generics in the language without significantly complicating the language and implementation.

That being said, Go has generics. Think about it. What is the primary use case for generics? Collections—when you've got a set of "objects" (instances of a structure) and you want to operate on that structure regardless of type.

When I lived in .NET v1.0 and v1.1, we didn't have generics. All of our collections were of type `object`. This meant that a dictionary (map in Go) or list (slice in Go) were always of type `object` and always required a cast back to the underlying type when reading off the collection. This muddled the code.

In Go, the primitive collections—array, map, and slice are strongly typed. When I work with these collections, there's no casting necessary. I read and write from the collections as the actual type and the code is beautiful.

Okay, what if I wanted an operation that works with multiple types—perhaps on all numeric types, e.g. `int32`, `int64`, `uint16`, etc. Now we've got a problem. But actually we don't. We just need a few intermediate alias types which implement an interface. Once each alias type for `int32`, `int16`, etc. is created, we can operate on the various underlying types according to our desired behavior.

```
type Integer16 int16
type Integer32 int32
type Calculator interface {
	Calculate()
}

func (i Integer16) Calculate() { /* behavior here */ }
func (i Integer32) Calculate() { /* behavior here */ }

func main() {
	container := []Calculator{Integer16(1),Integer32(2)}
	fmt.Println(container)
}
```

~~(As an aside, I should note that .NET only implemented generic constraints on numeric types as of .NET v4.5.)~~ [EDIT: I never made the leap to v4.5, so other than async/await, I don't have much hands-on experience.]

Now, what we're talking about here is really poor-man's generics. It's not the true Java/.NET generics or C++ templates that we know and love/hate. And for that I'm glad. One significant problem that I had with generics—at least in .NET land—was that it was a never-ending rabbit hole. Concrete generics weren't bad, but interface-based generics were awful. Anyone who has ever created a highly used, third-party library knows what I'm talking about.

In a lot of cases, generics were more trouble than they were worth. In such cases in .NET land, I found that I was often worried about compilation and things like covariant and contravariant relationships to the base type. Then, getting into generics of generics of generics made life really hard, for example: `List<Dictionary<string<IEnumerable<HttpRequest>>>>`. No, I've never actually used that type. In Go, instead of worrying about re-using that same kind of collection, but for something other than `HttpRequest`, I would worry about using it for the problem algorithm at hand. If I needed re-use later, I could implement an interface.

Do I miss generics? Not really. Yes, I've had to adjust my thinking slightly, but that's what happens when you work in a different language. Once I've gotten past a few mental hurdles, there are some really elegant solutions that solve the lack-of-generics problem in Go.