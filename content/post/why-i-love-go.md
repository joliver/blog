+++
type = "post"
date = "2014-01-28"
title = "Why I Love Go"
description = ""
slug = "why-i-love-go"
tags = []
+++

I have been in the process of migrating off of Windows and the .NET Framework for a little while now. The process is still underway, but is going very smoothly. To understand the need for a platform migration, there are two things to understand:

* First, why change the development environments and application platform at all?
* And second, what platform/language should we choose? 
 
The first point is beyond the scope of this post and will be covered in more detail at a later date.

#### The Playing Field

First and foremost, there are a TON of great languages out there. When I started out as a programmer 20+ years ago, I never really understood why people talked about "the right language for the job". Excluding things like gaming and other graphics-intense applications, couldn't you do anything with any language?  Why did the "right language" matter?  Well, it does matter. And it matters a great deal.

This post is not about why X language is *better* than Y language because that's a naive statement. It is about how Go works for us and how many of the language capabilities enable us to be highly productive. So if you're a big fan of [insert language here], this is not an attack. Instead, this about the right tool for the job. (Could you imagine woodworkers getting into heated arguments about whether a screwdriver or hammer was better?)

After deciding that Windows-based .NET was no longer a viable option for my organization, we started to formalize our requirements into a document. Our high-level list of features and capabilities we wanted in our new language and its underlying runtime included such things as:

* Enable our style of development and workflows, e.g. event-driven/reactive
* Enable concurrent or multi-threaded programming
* Enable non-blocking communication to various subsystems (network/disk) without callback spaghetti (select/epoll/kqueue)
* Cross platform
* Open source
* Under active development / not stale
* Thriving, growing community
* Lots of good documentation
* Library support for various third-party services (MySQL, memcached, etc.)
* Good tooling to enable rapid development
* Doesn't require a monstrous IDE to be productive--a simple text editor would be great
* Language doesn't get in the way
* Compilation times (if any) don't get in the way or affect the workflow
* Easy to test/assert application code

There are a number of good and realistic language choices including a few CLR- and JVM-based languages (D, Rust, F# , Scala, Clojure, Groovy, Java, Kotlin, JRuby, etc.). We also looked closely at Erlang, Python (Stackless), Lua, and Node. As we narrowed the field to Scala, Erlang, and Python (Stackless), I remembered hearing about a language that Google had cooked up called Go. We took a closer look and we were very pleased with what we found.

In Go, we found that it met all of our critical and important requirements along with virtually all of our nice-to-have items. Here's a quick overview of some of the language capabilities:

* Concurrency baked right into the language with channels and goroutines
* Open source, but with corporate backing (not going away anytime soon)
* Cross platform AND cross processor
* Native compiles with no runtime installation required (a huge win)
* Ultra-fast compilation speeds--even faster than JIT-based languages
* Speed of a compiled language, but feel of an interpreted language
* A built-in package management system
* C-based syntax (pros/cons here for different people)
* Strong typing and duck typing at the same time
* *Synchronous*, yet non-blocking IO using goroutines

#### The Way To Go

In Go, we found everything we wanted. In fact, since adopting the language, any initial concerns we held vaporized. We've found the community to be vibrant, active, and growing quickly. The number of libraries available to perform various tasks continues to grow at a rapid pace. Sure, it's nowhere near the size of otherm more mature languages, but it's not a minefield of abandonware either.

Probably the single most important capability we found in the language is the concurrency via channels and goroutines. Our applications need to be fast and millisecond latency matters to us a great deal. Channels are great because we can quickly and easily share state between "threads" by communicating--rather than using a big, fat, overused performance killer: a lock--a capability I really liked from Erlang.

In addition to channels, there are lightweight "threads" known as goroutines. Goroutines are scheduled within a given CPU process. When a certain goroutine is "blocked" because of a subsystem call, the Go scheduler will switch to another goroutine until the subsystem call is complete. This prevents blocking additional work like other single-threaded languages (PHP, Ruby, etc.), but also enables the code from a given goroutine to be synchronous instead of callback spaghetti (JavaScript)

One other advantage of goroutines is the ability to spin off work in an asynchronous fashion. In essence, we could write a piece of code and then call `go MyMethod` to invoke `MyMethod` asynchronously. The .NET CLR has only just started to see a few of these features as of v4.5 using keywords like `await`. With Go, these capabilities were baked in from the start.

#### Workflow

It's hard to overstate the simplicity and groove of a pure, text-based workflow. For starters, without a massive, heavyweight IDE to guide you, it forces you to learn the language and the libraries more and this improves the speed of development--like a bike without training wheels. I also don't need an IDE to manage any "project" files which contain a list of which files to include during compilation, etc. because there aren't any. Thus, there aren't any conflicts during `git rebase` on these non-existent project files.

The compile times are incredible. Even coming from a JIT-based language where compile times were "fast", they can't compare to Golang. The trouble with JIT is that you have a two-phase compile--once at build and once at startup. This two-phase process is really disruptive for things like continuous testing because you have to sit on your hands waiting for your monstrous solution to compile twice before it can run your test suite. With Go, I've never experienced any compiles longer than a few hundred milliseconds.

This kind of fluency and speed dramatically changes how you work. It enables a highly rapid feedback cycle. It also keeps your hands on the keyboard and your thoughts focused on the code--right where they should be. There simply isn't time for your mind to wander while you wait for the build and startup JIT to occur because there isn't any.

#### Trade-Offs

Do we miss a few things?  Sure. Generics for one. The language designers have also chosen to be concise in their naming conventions which causes some "double takes" and would probably drive [Uncle Bob Martin](https://twitter.com/unclebobmartin) crazy. But at the end of the day, it's not a huge loss. At the outset of my journey in Go I missed a few other things, but they escape me now because I don't feel any discomfort from the workflow and I feel like I'm able to do more despite being a relative "noob" to the language as compared to my 15 years in .NET.

#### Conclusion

The more I use Go, the more I like it. It's been a great language. I've used a bunch of the aforementioned languages and I'm really glad we chose Go for our network-based systems. It's been a pure joy to work with and I'm sure it will only continue to improve and grow as a language, runtime, and community.