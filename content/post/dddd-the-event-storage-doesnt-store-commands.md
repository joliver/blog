+++
type = "post"
date = "2009-08-11"
title = "DDDD: The Event Storage Doesn’t Store Commands"
description = ""
slug = "dddd-the-event-storage-doesnt-store-commands"
tags = []
+++

<p>I’ve been involved in a few projects recently that didn’t get into DDD much, so I’ve been out of the loop for a few months.&# 160; As I was getting back into things, I had a question regarding what was stored in the “event store” for a bounded context—events, commands, or both?&# 160; The reason for this is critical, because replaying of events vs. commands has some broad implications related to side effects, recalculation of values, keeping the context of the original operation, etc.</p> <p>The correct answer is that we store the event.&# 160; But the event is not just a state change, it’s much more than that.&# 160; <a href="http://tech.groups.yahoo.com/group/domaindrivendesign/message/14087">It carries the intent of the operation performed</a>.&# 160; I had <a href="http://tech.groups.yahoo.com/group/domaindrivendesign/message/14333">posted my own question</a> regarding this and <a href="http://tech.groups.yahoo.com/group/domaindrivendesign/message/14334">Greg answered it</a>.</p> <p>If you haven’t had the chance, I’d highly recommend reading the <a href="http://tech.groups.yahoo.com/group/domaindrivendesign/message/13645?var=1">mother of long group threads</a> which answers a multitude of questions regarding event sourcing and storage of events.&# 160; There are a few small parts where the thread starts to get off topic, but all in all, there is a very high signal to noise ratio.</p> 