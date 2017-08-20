+++
type = "post"
date = "2011-06-15"
title = "NServiceBus and Guaranteed Delivery"
description = ""
slug = "nservicebus-and-guaranteed-delivery"
tags = []
+++

<p align="justify">As a committer on NServiceBus, I’m typically running the code from the master branch head in production.&# 160; Crazy, huh?&# 160; I commit made against the master branch not too long ago affected my application code in its ability to properly handle a message.&# 160; But it didn’t cause me any long-term grief.</p>  <p align="justify">Why?</p>  <p align="justify">The answer is simple.&# 160; Guaranteed delivery.&# 160; The messages couldn’t be processed so they were forwarded to an error queue. One in the error queue, we were made aware of the problem and were able to fix it in short order.&# 160; From there, it was a simple matter of moving the messages back to the intended queue for processing and everything picked up where it left off.</p>  <p align="justify">Try that with RPC.</p>