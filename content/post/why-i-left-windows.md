+++
type = "post"
date = "2014-01-29"
title = "Why I Left Windows"
description = ""
slug = "why-i-left-windows"
tags = []
+++

As a development environment and a server environment Windows makes less and less sense. It's not that I don't like Windows. It's actually really good operating system for a lot of people and is getting arguably more secure from attacks. My problem is that it continues to get in my way and limit me in ways that hamper and impede progress.

NOTE: I've been using various operating systems since the early 90s, but I've been using Windows as my primary OS for software development until a year ago when we decided to [change development stacks](/why-i-love-go/).


#### Resources Consumption
First, let's start with an obvious point. It's a resource monster. The thing requires all kinds of RAM and CPU just to keep its head above water. Leaving room for running applications is another matter entirely. Back in the day, I tweaked my system to load Windows 3.1 in under four seconds. From power up, I could get to Windows 3.1 in about 10 seconds. Windows XP/2003 was slow for a bit and then the hardware caught up. Don't get me started Vista. Win7/2008 wasn't too bad, but it's still requires way more than it should. Win8 feels like Vista all over again...except worse.

For a few months I tried running Windows 7 in a VM for containment purposes. The thing performed like a dog despite having really good hardware and plenty of CPU and RAM and an Intel SSD. Granted, that's not really fair to Windows because VM disk IO is terrible. But I should say that running a GUI-based Linux in a VM didn't and still doesn't hurt.

On the server side running in the cloud, when spinning up an EC2 cloud box with Windows, you really can't get away with anything less than 3.75GB of RAM while no less than 7GB is preferred. This increases costs dramatically because I need a bigger box. The same code running on Linux runs comfortably on 1 GB of RAM including the kernel with room to spare.


#### Automation
One of the biggest beefs I have with Windows is automation. You really can't compare Windows batch "scripting" to BASH. There's really no comparison--they're not even in the same stratosphere. Sure, there's PowerShell, but that's really an afterthought. At some point they decided that Windows should have some halfway decent scripting environment so they got out some duct tape and stuck it on.

The \*NIX flavored operating systems all have a shell flavor--typically BASH. The shell is a **first-class citizen** of the OS. The shell can do everything. In Windows, configuring a given application may require interacting with the GUI and clicking your way around. This approach doesn't work to well when trying to automate a server environment. Whereas in \*NIX you get sed, awk, grep, perl, python, etc. by default on virtually all distributions.

The paradigm really comes from the heritage of each OS. \*NIX-based OSes were multi-user and command-line driven from the outset. Windows was a single-user and GUI-based OS from the start. Perhaps this is the reason why Linux is such a great server and a lackluster client. Even to this day, the GUI was never the strong point in Linux. OS X is probably the only good hybrid coming from a UNIX core.


#### Security
Okay, I didn't think I'd talk about security, but it is worth mentioning that an element of **TRUST** has been lost with Windows due to recent revelations about the NSA. How sure are you that there's no NSA backdoor in Windows? The Linux Kernel is open source. Patches are reviewed and scrutinized by a multi-national group of individuals.


#### Package Management
Back in the 90's when I first started using Linux, I didn't consider this a problem, but `apt-get install` and `yum install` really are awesome. Installing applications in Windows by comparison is a chore.

I should mention that compiling the latest version of an application is also a great part of \*NIX-based systems. If a given package in the official repositories is a bit stale, I can always bring down the latest source and compile. If there's a problem with a given application and I don't see anything in the docs, a few minutes of looking at the source will often tell me what I'm doing wrong. In a closed-source Windows world, you're at the mercy of the author and his schedule.


#### Internet Explorer
There's a saying in web development circles: Develop on a Mac, run on Linux, use Windows to test IE. The saying exists [because it's true](http://www.favbrowser.com/wp-content/uploads/2013/09/browsersfunny.jpg). Unfortunately, far too many mental "CPU" cycles are spent fretting over getting web apps working on IE. If I'm ever at a relatives house for a vist or whatever, the first thing I do is install Chrome. (The next thing I do is install CrashPlan so they don't call me when their hard drive fails and they can't get their data back.)

As an aside, when provisioning a Windows Server, I can actually get away with not running IE and messing with the nasty "Advanced Security" garbage. I just upload ChromeSetup.exe using Remote Desktop and install Chrome.

#### "Except on Windows"
When running on .NET apps, you have a more limited set of choices when it comes to application hosting. Granted, there's Mono, but that's a topic for another post entirely. Essentially, it all comes back to Windows. So that means you've got to find a host that supports running Windows. Yes, there are a lot of hosts out there and yes, a lot of them now support Windows, but it wasn't always that way.

Back in the early 2000's, if you wanted a dedicated server, you had to search far and wide to find a Windows provider. I remember wanting to use a really great host, but each of the top-tier hosts that I found didn't support Windows. It took a while to find a halfway decent Windows host.

Nowadays, it's not that hard to find a host for dedicated Windows boxes. Sure, there's a small monthly licensing fee, but I don't mind paying for something if I'm receiving value from it. But cloud is another story. There are a number of solid cloud providers, yet only a small subset support running Windows. This means that I can't use X provider even if I like what they offer and the capabilities they have. In other words, the current cloud marketplace is a little bit like Windows dedicated hosting from the early 2000's.

To make matters worse, the cloud providers that do offer Windows often have to make trade-offs in order to run Windows. For example, both the Amazon and Rackspace clouds have mountains of documentation. If you've done any amount of reading of those docs, you'll see caveats everywhere that say things like "except on Windows" or "for Windows you must", etc., etc. In many cases, the docs vary so greatly they must provide a completely different set of docs to handle the Windows case--if the Windows case is supported at all.

#### Open Source Projects

One of my core philosophies is choice. I don't like being limited or constrained. I don't mind making a choice and having trade-offs, but I don't like being forced into something without the ability to choose. Windows constrains my ability to choose.

One critical area where we are constrained is when running open source projects. Inevitably with any open source project, Windows is among the last operating systems to be supported, if all. (Solaris and a few other relics of the past are also problematic, but they don't have a large user base.)

I remember when I first started looking at Mongo and CouchDB and a ton of other NoSQL storage engines. I remember thinking, these are awesome!  But I couldn't run them on my primary development workstation. VM solutions like VirtualBox were also in their infancy (and didn't run on Windows) so you needed physical boxes in addition to a development workstation if you were serious about running Couch or Mongo or whatever.

Even today, projects like nginx have caveats that warn users about running the application on Windows in production. Other projects like HAProxy, Varnish, Squid, Cassandra, Riak, and a host of other projects either cannot run on Windows or can run on Windows but with large disclaimers.

Obviously the solution is to run those infrastructure-level and operation-level services outside of Windows. You're absolutely correct about that. But for those that are unfamiliar with running Linux--especially Windows development shops--you've gotta have someone that knows Linux. And if you're planning on running a service in production, you'd better what you're doing when things go wrong, especially at 2:00 AM.

#### Community
The Linux community is filled technical people who have a lot of experience doing things and solving problems, otherwise they wouldn't be using Linux. This is entirely subjective, but the Windows community (in the loosest sense of the word) seems to have a significantly lesser percentage of know-how people. Sure there are smart people in both camps, but I often find the solutions I need more on the Linux side. A few days ago I needed to resave an encrypted PDF as plaintext. On Windows it was all about purchasing an application. On Linux it was `apt-get install [some-pdf-decryption-app]` inside of a VM (to keep my host clean) and the problem was solved.


#### It's Not All Bad
Believe it or not, Windows does actually have a few strong points. For example, IO Completion Ports in Windows is a very strong implementation of asynchronous IO. Yes, it's slightly different than select/epoll/kqueue, but the way it's implemented is very efficient and capable.

Furthermore, Windows has an awesome CPU scheduler, arguably better than the Linux scheduler. In fact, some benchmarks of the LMAX Disruptor run FASTER on Windows than on Linux. Surprise, surprise. In addition, Windows supports pinning a given process to a CPU core which keep application latency very low and keeps the CPU L1-L3 caches warm while avoiding unnecessary (and slow) access to main memory. Linux has this same ability, but for some reason, OS X does not have the ability pin a process to a given set of cores. Fortunately, we don't run OS X on production servers.

#### Conclusion

There's another world waiting for you outside the world of Windows. There's a huge amount of opportunity for growth and development and to really understand how a machine works under the hood. I would encourage anyone to at least attempt to see the possibilities. At the end of the day, if you really want to use Windows on a day-to-day basis, that's fine because you've got a job to do and it's about results and getting things done. But don't use Windows just because it's the default and you've never used anything else.