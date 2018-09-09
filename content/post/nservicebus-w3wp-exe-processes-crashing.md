+++
type = "post"
date = "2010-11-17"
title = "NServiceBus: w3wp.exe Processes Crashing"
description = ""
slug = "nservicebus-w3wp-exe-processes-crashing"
tags = []
+++

<p align="justify">If you are using NServiceBus in a web application and the process named w3wp.exe keeps bombing and exiting shortly after starting, here's what's happening:  <strong>You don't have the appropriate permissions set for your message queues</strong>.</p> <p align="justify">The way NServiceBus is designed, it performs a few small startup tasks when the bus is started during web application initialization. Among these tasks it checks the configured input queue. If, because of a permissions error, it fails to read from the queue, it logs a message using the configured logging, waits 10 seconds, and then exits the process.</p> <p align="justify">The simple fix is to give the web account permissions over the resource. This all goes back to one of my <a href="/nservicebus-aspnet-permissions-for-msmq.html">previous posts</a> on the same subject, but I just wanted to mention that I got bit again because my message queue permissions were a little too tight.</p> 