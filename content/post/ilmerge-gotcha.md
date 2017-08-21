+++
type = "post"
date = "2011-04-02"
title = "ILMerge Gotcha"
description = ""
slug = "ilmerge-gotcha"
tags = []
+++

<p align="justify">Just remember that when two assemblies have internalized a reference to another assembly using ILMerge, each gets their own "copy" of static variables. That is to say, that the class MyClass1.SomeStaticInstance is no longer the same between the two assemblies. I was kicking against this one for the better part of an hour. At first I thought it was some quirk with the [ThreadStatic] attribute I was using. It wasn't.</p> 