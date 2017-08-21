+++
type = "post"
date = "2009-03-18"
title = "Event Sourcing and Write-Ahead Logging"
description = ""
slug = "event-sourcing-and-write-ahead-logging"
tags = []
+++

<p>In Greg's <a href="http://www.viddler.com/explore/GregYoung/videos/5/">devTeach presentation</a> he brings up the concept of a <a href="http://en.wikipedia.org/wiki/Write_ahead_logging">write-ahead log</a>, which is a powerful, yet simple mechanism for temporary event storage which is also a capability offered by virtually all relational databases.</p> <p>In a database scenario, the concept is simple: whenever a command is performed, it is performed in memory and immediately recorded in the log.  Then, if the database process accidentally restarts/shuts down, etc. it can be brought back to a known state.</p> <p>This is where the comparison ends.  In a database world, uncommitted transactions are added to the log.  In DDDD, only committed events are added to the log as part of the transaction.  This is a very important difference.</p> <p>In DDDD, when the system comes back online after a restart, we want it to be as if none of the uncommitted work ever happened.  Therefore, only committed events are added to the write-ahead log.</p> <p>The reason I'm posting on this is that at about 40:10 in the presentation he makes the statement &quot;this one is actually committed&quot; which makes it appear as though uncommitted events could be added to the write-ahead log.  Earlier in the presentation--at 39:40--he says, &quot;I am taking my transactions <strong>as they're getting committed</strong> and just putting them into this log.&quot;</p> 