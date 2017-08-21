+++
type = "post"
date = "2011-03-12"
title = "New NServiceBus Feature: 32-bit (x86) Host Process"
description = ""
slug = "new-nservicebus-feature-32-bit-x86-host-process"
tags = []
+++

<p align="justify">NServiceBus is an "Any CPU" framework. It doesn't have an 32-bit or 64-bit specific code. This makes it very easy to transition between 32-bit and 64-bit operating systems. Unfortunately, not all assemblies are or even can be compiled using the default "Any CPU" architecture. In many, if not most cases, this is related to legacy systems that have 32-bit specific code for platform interop with native C libraries, etc.</p> <p align="justify">If you use the default host--NServiceBus.Host—your application will always load in 64-bit (x64) mode if you're on a 64-bit OS or in 32-bit (x86) mode for a 32-bit OS. Again, this is typically not a problem. But if there are assemblies or other libraries containing 32-bit code that must be invoked and loaded into the process, we've got a problem—a BadImageFormatException problem.</p> <p align="justify">I recently <a href="https://github.com/NServiceBus/NServiceBus/commit/0aa8fdaaf8713765e82004718fc512dcd9d3d578">pushed a commit</a> to the master branch of NServiceBus on <a href="https://github.com/NServiceBus/NServiceBus">GitHub</a> that compiles two specific versions of the NServiceBus Host. It compiles the default "Any CPU" version as usual. But now it also compiles one called NServiceBus.Host32.exe. This will allow users running a 64-bit OS to run a 32-bit NServiceBus process thus allowing the execution of 32-bit binaries/code without having to resort to workarounds such as corflags.exe which instruct the .NET Framework to run in 32-bit mode.</p> 