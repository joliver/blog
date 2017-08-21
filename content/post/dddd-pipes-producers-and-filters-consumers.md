+++
type = "post"
date = "2009-03-31"
title = "DDDD: Pipes (Producers) and Filters (Consumers)"
description = ""
slug = "dddd-pipes-producers-and-filters-consumers"
tags = []
+++

<p>[UPDATE: This article may be better titled as <em>Pipes (<strong>Publishers</strong>) and Filters (Consumers)</em> because as of a <a href="http://tech.groups.yahoo.com/group/domaindrivendesign/message/11302">recent message group thread</a>, the concept of “Produce” has been renamed to “Publish”.]</p> <p>As I really started looking at the interface for IConsume and IPublish (sorry, I can't shake putting “I” on interfaces), I was slightly perplexed. In essence, it appears that these two methods could do the same thing: Consume(Message) and Publish(Message) because the method signature is identical except the name. If they have the same signature, why have a different name or even a separate interface? It must be something related to the <strong>intent</strong> of each interface.</p> <p>So, why do we need both? Pipes and filters. They both work with some kind of stream like <em>grep</em> does. So which is which? Well, the aggregate root of a domain implements IConsume, which means it's a filter, because it takes a message and processes it, transforms it, etc.</p> <p>This means that IPublish is the pipe portion—it takes the message and routes it in a certain direction—perhaps across process or network boundaries (serialization) or perhaps thread boundaries, or whatever. It may not necessarily interpret the message data itself (which is what a filter does), it just sends the message where it's supposed to go.</p> 