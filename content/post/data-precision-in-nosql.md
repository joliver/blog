+++
type = "post"
date = "2011-01-20"
title = "Data Precision in NoSQL"
description = ""
slug = "data-precision-in-nosql"
tags = []
+++

<p align="justify">I’ve got to hand it to the NoSQL teams. In some recent work on my <a href="https://github.com/joliver/EventStore">EventStore</a> project, I have seen how, when you give them a value to story and then query the associated document/row/whatever, the NoSQL solutions hand back the *exact same value* every single time.&# 160; The RDBMS crowd is another story.</p> <p align="justify">MySQL has an <a href="http://bugs.mysql.com/bug.php?id=8523">outstanding bug</a> whereby it truncates any DateTime values and forgets the milliseconds on the value.&# 160; Great.&# 160; Oh, and the bug has been outstanding for *five years*.&# 160; Ouch.</p> <p align="justify">Access has some other, <a href="http://connect.microsoft.com/VisualStudio/feedback/details/94377/oledbparameter-with-dbtype-datetime-throws-data-type-mismatch-in-criteria-expression">similar quirks</a>. I’m not really sure if Access really deserves being mentioned with any other kind of persistence engine.</p> <p align="justify">In contrast, when I give something to a NoSQL store, I can pretty much expect to get the same value back. At the same time, I should point out that in some cases, the default, client-side serialization for various storage engines may affect precision of some values, like dates and times.&# 160; Even so, this is a limitation of the client-side serialization rather than the storage engine itself.</p> 