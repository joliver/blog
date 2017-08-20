+++
type = "post"
date = "2012-01-06"
title = "Crime Scene Event Sourcing"
description = ""
slug = "crime-scene-event-sourcing"
tags = []
+++

To use event sourcing or not is an interesting question and one that should not be taken lightly. The two main camps in the debate contend on several key points among which include business necessity, architectural gold plating, educational overhead, and tool support. For a moment, let's consider the argument to use or not use event sourcing in a different light.

Let's take a "real-world" example and see how the presence of event sourcing could fundamentally change the investigation of a crime scene. Western cultures have a fascination with CSI-like mysteries and courtroom dramas. How many books, movies, and television shows are dedicated to the "whodunit" murder mystery? Sherlock Holmes is probably the original crime scene investigator while his modern-day counterpart, <a href="http://en.wikipedia.org/wiki/Shawn_Spencer">Shawn Spencer</a> from <em><a href="http://en.wikipedia.org/wiki/Psych">Psych</a></em>, is one of the most recent. This entire genre has one thing in common: all provide a final state and the protagonist has to re-create the series of events and motive that ultimately lead to the arrest of the perpetrator.   <img class="aligncenter size-medium wp-image-1173" title="psych" src="/content/images/psych-300x225.jpg" alt="" width="300" height="225" />

Let's suppose for a moment that in reality we could somehow overlay a stream of events into a crime scene.  How simple would it be for anyone, including a domain expert, to read through the stream of events to "see" exactly what happened?  (This is often referred to the "reveal" in whodunit-style murder mysteries where the audience is finally shown exactly what happened, how, and why.)  If anyone could read this stream of events it would be a trivial matter to understand why and how a given crime scene ended up the way it did and why a certain window was smashed or there were scratches on the wall, etc. Not only that, it would be easy to see when certain things occurred so that the "time of death" could be definitively established instead of a best-guess by the coroner.  Finally, because all of the motive is captured in the events, we could see into the perpetrator's behavior as he was causing the events around him. All of these factors would ultimately be the "smoking gun" that points directly to the perpetrator each and every time.

The argument might be, "well that takes all the fun out of guessing what happened and figuring out whodunit." Exactly. Guesswork can be dangerous and is, at best, guesswork. Granted, if we had event sourcing in a murder-mystery, that would sort of the defeat the point and would put poor old Scooby-Doo out of work.

As software developers, we have an amazing opportunity to capture all of the intention in our domains as a stream of events. This stream of events has amazing power to give insights into reasons why and how something changed. To me, this doesn't sound like architectural gold plating, in fact, I would argue that it's just the opposite--and this doesn't even include all of the additional technical and business benefits derived from event sourcing such as true persistence ignorance, simplified backup strategies, multi-master deployments, independently scaled read models, etc. I will also be the first to say that you don't need event sourcing everywhere.

I will also say that you shouldn't dismiss the business and technical benefit that can be derived through its use with the simple wave of the hand merely because there's some overhead to understanding the pattern.