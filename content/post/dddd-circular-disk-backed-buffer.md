+++
type = "post"
date = "2009-10-06"
title = "DDDD: Circular Disk-backed Buffer"
description = ""
slug = "dddd-circular-disk-backed-buffer"
tags = []
+++

<p>In a few of Greg's video presentations regarding DDDD, he mentions using a circular, disk-backed buffer.  As far as I can tell, he's using this as a temporary storage mechanism when events are committed.  He then has a single consumer reading the events from this buffer and putting them into the permanent event store.</p> <p>I just read an interesting article by one of the .NET CLR guys about building a <a href="http://www.bluebytesoftware.com/blog/CommentView,guid,3740daff-a459-4298-bc9b-65d3647f5c0d.aspx">thread-safe, producer/consumer buffer</a>.  This buffer could potentially be used as the temporary storage before pushing committed events into permanent storage.</p> 