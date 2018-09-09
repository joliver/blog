+++
type = "post"
date = "2010-05-21"
title = "Somewhere Werner is Crying"
description = ""
slug = "somewhere-werner-is-crying"
tags = []
+++

<p>My <a href="/cassandrariakdynamo-optimistic">last blog post</a> generated a fair amount of activity in the <a href="http://twitter.com/dizzyco/status/13549789765">twittersphere</a>. In many ways I was expecting that because it's fairly controversial. To think that someone would take a nice scalable storage solution and put it back under the thumb of an RDBMS is nuts. But that's exactly what my previous post talks about.</p> <p>If it's so crazy, why blog about it? I agree, it's pretty crazy to want to put a Dynamo instance under the thumb of an RDBMS. Yet, in a narrow set of circumstances there are advantages to doing so. When we require full consistency for a particular element or set of elements and we happen to be using Dynamo we need a way to prevent multiple instances from stepping on each others toes and performing conflicting operations creating irreconcilable differences.</p> <p>On example that comes to mind is that of a true, DDD aggregate root. Aggregate roots by definition are boundaries of consistency. If we had two instances of the aggregate root loaded simultaneously and they were both allowed to perform conflicting operations concurrently, it would create a lot of headaches to solve that problem.</p> <p>In the end, the techniques outlined in the aforementioned post are to be considered a small tool in the toolbox rather than a silver bullet to be applied wholesale to an application persistence strategy.</p> 