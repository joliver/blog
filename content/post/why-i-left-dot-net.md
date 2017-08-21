+++
type = "post"
date = "2014-01-30"
title = "Why I Left the .NET Framework"
description = ""
slug = "why-i-left-dot-net"
tags = []
+++

The .NET Framework was good. Really good. Until it wasn't. Why did I leave .NET? In short, it constrained our ability to choose (which is a huge deal for me) and turned our focus inward toward the perceived safety of the nest instead of the helping us experience all of the possibilities out there in the big, wide world.

[Buckle up: this is post has pratically become a book in length...]

### The Good
First let me start of by saying there's a whole lot of things that .NET did right, albeit most of these things were not from .NET itself, but came about because of the .NET community.

#### C-Sharp
C# is awesome. I think it's a spectacular language. Coming from a strong C background, I thoroughly enjoy the syntax, the flow, and the feel of the language. Yes there are things I would change, but in general it's a solid language. And with such a [hefty percentage of developers using the language](http://www.tiobe.com/index.php/content/paperinfo/tpci/C_.html) and the preeminence of Windows as an operating system, it's a great language to know.

#### ReSharper
I also love [ReSharper](http://www.jetbrains.com/resharper/). The guys at JetBrains are miracle workers. Without ReSharper and a few related tools, I might not have enjoyed C# as much.


#### BDD and MSpec
I also really enjoyed the BDD-style framework called Machine.Specifications (MSpec) for short. It's a spectacular testing framework that really encourages correct language in the tests themselves. Before MSpec my tests were a mess and really got in my way.

Additionally, Mspec was a huge inspiration and incentive for my organization when we created [GoConvey](http://smartystreets.github.io/goconvey/)--a Golang-based BDD testing framework.


#### A Multi-language Runtime
I think the concept of the multi-language CLR really got the JVM world thinking. I'm not aware of any non-Java JVM languages prior to the CLR, but with the advent of a "common language runtime", my understanding is this got people on the JVM moving and ultimately creating great JVM languages such as Scala and Clojure. Please correct me if I'm wrong. Further, the CLR made the Sun guys sit up and take notice because Java was a bit stale and is only now catching up in many ways with the advent of Java 8. Competition is a very good thing.

#### NuGet
Another obvious one is NuGet. The package management story in Windows as a whole and specifically within Windows development was terrible. NuGet solves a lot of problems and they do a lot of things right by borrowing heavily from Python and Ruby. Is there room for improvement? Sure. But I haven't felt a lot of pain with NuGet other than a few, select package upgrades here and there.

#### Mono
I can't speak highly enough of the Mono guys. What they created was nothing short of amazing. Without any official support and despite potential legal issues hanging over their heads, they pushed forward and created an incredibly capable alternative to the official runtime implementation. I've had several applications running in production for almost a year on Mono without any issues. Is it production ready? That may depend on your application (see "Mono" below)


#### CQRS and Event Sourcing
Arguably one of the best things about .NET was that it was the birthplace of CQRS and the correlated technique: event sourcing. Granted, CQRS+ES in and of itself is nothing terribly new. As Greg Young will tell you, this is a bunch of 40-year-old stuff repackaged and rebranded for us. I was having some pretty serious problems with a large codebase and CQRS+ES quite literally unshackled my domain when I came across it about five years ago. CQRS+ES is a named pattern now and the growth has been phenomenal. It is perhaps the one thing that .NET has been able to share with other development communities. Aside from this, most all of the innovation is coming from the outside in.


### The Bad

With the good stuff out of the way, let's look at what's wrong and why I left the .NET Framework. The thing that excites me the most about [my recent development platform migration](http://blog.jonathanoliver.com/why-i-love-go/) is that I can take a lot of the best parts with me while leaving the bad stuff (as found below) behind.

#### Windows
[As covered previously](http://blog.jonathanoliver.com/why-i-left-windows/), Windows is not a good player when it comes to network-based server software. One other really big problem I see with Windows is that traditional Windows devs are typically only good at Windows and get lost very quickly outside of their comfort zones, which is not true for Linux devs. Computing is **SO** much bigger than just Windows. One problem of devs only being capable on a single OS is that it inevitably leads to the proliferation of Windows. In other words, Windows begets Windows. There's no way to break the cycle.

\*NIX guys on the other hand are typically familiar with multiple operating systems (Linux, Unix, OSX, Windows, etc.), the inner workings of an OS, various distributions (Debian- and Fedora-based), window managers (lowercase "w"), desktop managers, file systems, package management, compiling, recompiling, repackaging, command line "fu", and the list goes on and on.

One pet peeve of mine is file systems. NTFS is not the only file system out there, and it hardly the best for any given task. ZFS, BTRFS, ReiserFS, ext\*, etc. have some really cool properties. I also love being able to create loopback devices from BASH or creating RAM drives for various high-speed/transient disk operations. This doesn't happen in Windows--not without third-party software.

In the AWS cloud, firing up a Windows box takes a good 10+ minutes. I can fire up a simple Linux box in about 15-20 seconds. When it comes to cloud scaling, it's really important to be able to scale **quickly** because 10-15 minutes is an eternity when scaling is important.

#### Visual Studio
Another thorn in my side is Visual Studio. The fact that I need a big, honkin' IDE to do any real development bothers me. It's just as big a resource hog as Windows. I had a Core i7 3770K 3.5GHZ desktop I built with 16 GB of RAM and a Vertex 4 512 GB SSD. It literally maxed out the Windows Experience Index and Windows + VS was still slow. (Yes ReSharper makes it slower, but ReSharper was worth it.)

Now I dev on a MacBook Pro which has less CPU horsepower than my beefy desktop and things are noticebly faster and the UX is infinitely better after a small learning curve. In fact, I don't even use a mouse anymore--my hands are always on the keyboard or trackpad and I can gesture to my computer and actually have it respond--unlike Windows.

One cool thing about VS was the debugger. It was incredibly handy see and use. Every so often it would report the wrong values in the watch window which caused more hours of debugging. At the same time, this is also big negative because the default, multi-threaded world of the CLR caused me to need a debugger in the first place. Not having a debugger is actually a liberating experience because it forces you to code in a different way.

VS also has this really nasty habit of creating "csproj" and "sln" files. I hate those things. Sure, C# has to know what to build and when. I get that. In Golang, the references are in the code using import statements. If it weren't for the project files in .NET land, I could have probably coded C# using a simple text editor and been more fluent in the language. These files also had the really nasty habit of creating wonderful merge conflicts during `git rebase` operations.

Don't get me started about line break differences. I can't believe we're still dealing with this kind of thing today. If the VS solution file had Linux line endings it wouldn't load the solution by double clicking on it because the VS solution file parser couldn't read it.

#### Source Control

Fortunately, I jumped out of the Microsoft Camp for source control early (Visual Source Safe). I was using Subversion in the early 2000's after VSS lost my commits for the umpteenth time. Then git came around and I was fascinated by it. Unfortunately, there was no Windows port--a typical occurrence for me. Finally someone created a port and I was there and I haven't looked back. Git is a very sharp knife but when you wield it properly, it's a powerful and effective tool. Once I used TFS on a small job and it was a monster--just like everything else from Redmond. It infected my project files and contaminated my source directories. Yuck. No thank you. Give me command line git any day...or perhaps [SourceTree](http://www.sourcetreeapp.com/) if you need a little love from a GUI.

#### Mono
Yes, this is the second entry for Mono. As amazing as Mono is, it's still a second-class citizen in the .NET world. Whenever I try to get anything serious to run on Mono, I'm typically fighting through bugs in the implementation. Fortunately, I'm not uncomfortable downloading the source, finding the problem, issuing a pull request, and then recompiling on Linux. But I've done this exact thing more times than I care to remember.

Of course the CLR is a massive beast and getting identical behavior on a different OS from an unofficial implementation is nothing short of a miracle akin to parting the Red Sea...but the fact that I have to spend so much time hunting standard library bugs to get my code to behave correctly is very difficult to justify.

Certain areas of Mono are also slow. Perhaps it's not slow in every capacity, but for me the web server is one critical piece. And it's dog slow as in, [dead last, bottom of the pack slow](http://www.techempower.com/benchmarks/# section=data-r8&hw=i7&test=plaintext)--even for trivial stuff. I suppose the good news is that it can only get better from here. I should also mention that the Mono guys have forgotten more about Linux than I'll probably ever know, so I can't be too critical.

#### IIS
Perhaps IIS is trying to be too many things for too many applications. It's gone from being a web server to being an application host similar to a J2EE application container. It's also on the [slow side](http://www.techempower.com/benchmarks/# section=data-r8&hw=i7&test=plaintext). I guess if I needed higher performance, I should code my own web server, but I'd really like to focus on my application code instead. It would be nice to utilize an evented web server on Windows but nginx and other servers just don't like Windows in production.

The various JVM-based implementations, such as Netty, easily do 650K+/requests per second. IIS chokes out at about 50K/requests per second running a simple CLR "Hello, World!" application. (As a funny aside, the guys in the referenced benchmark created a simple C# web server from TCP sockets and it did about 120K requests per second.)

#### Close-mindedness

There was a movement a few years back called ALT.NET. The movement was all about looking outside of ourselves at the broader development community as a whole and bringing together different parts. Interestingly enough, that's where the inspiration for StructureMap, Autofac, NuGet, ASP.NET MVC, and many other tools came from. The movement was viewed with a lot of disdain and contempt from within traditional .NET circles. I see that as a huge evidence of inertia and general close-mindedness of the community as a whole. (Granted, some of this may be dissipating as different technologies emerge including Redis, MongoDB, among others.)

There are so many great solutions out there. To assume that Microsoft has ordained The One True Way is absurd. If that was the case, we'd all still be using visual designers in Visual Studio to drag and drop button and link elements onto a WebForm surface and we'd wire up the button and rely on ASP.NET ViewState to help insulate us from the "horrors" of scary HTTP. The day I got rid of the last WebForm from one of my deployed code bases was a day of glorious celebration. Literally.

(And who ever thought "web controls" was a good idea?  Apparently I did because I drank the Kool-Aid and embraced it to the fullest. It bit me hard. Ever seen a 2MB+ ViewState?)

[NOTE: When I was composing this post, it was originally titled, "Why I Left .NET", meaning the entire .NET ecosystem. The title felt a little short I updated it to be "Why I Left the .NET Framework". I consider .NET to be an ecosystem including all tools, projects, platforms, organizations, and groups of developers. This is why some elements of the wider .NET community come under fire in my post.]


#### Performance Killers
The typical, multi-threaded paradigms in C, Java, and C# strongly encourages the use of locks and mutexes. There's a hidden cost to locks: they're painfully slow. Using the Disruptor (a lock-free ring buffer on the JVM), you can easily process 20M+ events per second. On .NET using ordained "best practices" anything more than a dozen transactions per second is considered decent-to-good performance and at that point, you just need bigger/better/more hardware. In fact, I've seen third-party client libraries (Rabbit, Couch, Mongo, etc.) with lock statements all over the code. Even if I don't have any concurrency in my code, the default and preferred method is using locks.

The lock-free, event-driven approach allows you to reduce hardware and capital outlay by a massive degree. Most applications could easily run on two machines with the second being necessary only for redundancy and failover in case the first machine became unavailable due to hardware-related issues.

Another aspect of this is the traditional way of calling network and disk subsystems: synchronous, blocking code. If you want multiple, concurrent HTTP requests, you need more threads. What most developers have never bothered to understand is the 1-2MB overhead needed to maintain the thread AND the requirement to context switch the thread which can cause the CPU cores to spend all their time thrashing doing context switches instead of doing real work. So now we've got hundreds or thousands of threads in an application tying up RAM and causing the CPU to spin its wheels. There's a better way.

Netty/NIO (JVM), Erlang, Node, Gevent (Python), and Go all encourage the use of event-based subsystem operations (select/epoll/kqueue). This means that the CPU is free to do actual work while waiting for packets to be tx/rx across network. Netty is arguably the fastest at this task because of the maturity of the JVM, but I love the way Go handles this with Goroutines--it's simple, elegant, and easy to reason about without callback spaghetti.

#### SQL Server
As a .NET developer, when you start a new project there are a few things you'll typically do (by hand, of course):

* Create a new solution
* Add it to Team Foundation Server
* Create a corresponding website entry in IIS
* Create a new SQL Server database
* Associate the Entity Framework with the solution (typically for projects created after 2010)
* Start designing your database and your ActiveRecord entities.

This isn't the right way to code in most cases. Sure it may work in some scenarios, but as a "default architecture" it's not where you want to be. Why have we made any technology choices before we even understand the problem domain?  This literally puts the cart before the horse.

The Microsoft ecosystem encourages everyone to utilize SQL Server. It's so incredibly easy to interact with SQL Server from within Visual Studio or using SQL Management Studio (and its predecessor, SQL Query Analyzer). This database-centric focus is part of the ordained and One True Way. It gets you hooked on Microsoft even more. Vendor lock-in is always good for the vendor.

Why do we develop this way?  Why aren't we considering the **behavior** of the application more than how it's stored?  All of my projects now utilize a JSON-based key/value store. With this capability, I can choose any storage engine I want including SQL Server, Oracle, PostgreSQL, MySQL, Cassandra, CouchDB, CouchBase, Dynamo, SimpleDB, S3, Riak, BerkeleyDB, Firebird, Hypertable, RavenDB, Redis, Tokyo Cabinet/Tyrant, Azure Blobs, plaintext JSON files on the file system, etc., etc., etc. All of a sudden, we can start choosing a storage engine based upon its merits rather than just familiarity.

Aside: Ever run SQL Server in the cloud on AWS RDS?  Don't. Sure it'll work, but some of the simplest of things like replication don't exist. The docs are littered with references to capabilities of SQL Server that don't work within AWS RDS.

### Conclusion

Perhaps the two most important lessons I have learned in software development are:

* The importance of boundaries and encapsulation (in various forms)
* Paying the price to get the model and abstractions right

Years ago I hated the word "model". Everyone would throw it around and it was such an overloaded term it was hard to understand what it meant and why it was important. At this point I will only say that a model is a narrow representation of the reality you are trying to encapsulate. Perhaps the simplest example is the Mercator Projection of the globe. It's good at exactly one thing: navigation. If you use it for anything else, it's less than worthless. If you're not focused on paying the price to get the model right and to encapsulate the business realities, no amount of technology can save you.

The biggest beef I have with .NET is that the One True Way leads you away from the ideal model and pushes you more toward focusing on the implementation details and technology defaults. This kind of focus results in the technical implementation bleeding through and infecting the model which ultimately cause it to decay and deteriorate as it can't adapt to ever-changing business requirements. As this happens, developers struggle and kick as they move from one new technology to another like drug addicts hoping that the next big thing will cure their ailments.

Technology itself isn't a panacea, instead, it's about tradeoffs and choices. Only a correct understanding of the business behaviors and encapsulation of the same into well-formed, well-understood model help keep a technology stack where it belongs--as an implementation detail.

And that's why I left the .NET Framework because it kept reasserting itself and wanting to be more than it was: an implementation detail.
