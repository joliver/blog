+++
type = "post"
date = "2009-03-30"
title = "Ensure Code File Line Lengths"
description = ""
slug = "ensure-code-file-line-lengths"
tags = []
+++

<p>Wouldn’t it be great to ensure that you had consistent line lengths in your code files in Visual Studio?&# 160; All versions of Visual Studio since 2003 have the ability to have what’s called a “guide line” as shown below:</p> <p><img title="clip_image002" height="202" alt="clip_image002" src="/images/clip_image002_thumb.jpg" width="422" border="0" /></p> <p>You can even have multiple “guide lines”.</p> <p>The following command will add two guidelines, one at column 82 and the other at column 98 (zero-based):</p> <p>REG ADD &quot;HKCUSoftwareMicrosoftVisualStudio9.0Text Editor&quot; /v Guides /d &quot;RGB(128,0,0) 83, 99</p> <p><strong>References</strong></p> <p><a href="http://blogs.msdn.com/robcamer/archive/2009/03/28/how-to-know-when-lines-are-a-certain-length-in-visual-studio.aspx">http://blogs.msdn.com/robcamer/archive/2009/03/28/how-to-know-when-lines-are-a-certain-length-in-visual-studio.aspx</a></p> <p><a href="http://dotnettipoftheday.org/tips/6B29ED91-DE6C-425F-9E28-95EED8153F0C.aspx?discussion=1">http://dotnettipoftheday.org/tips/6B29ED91-DE6C-425F-9E28-95EED8153F0C.aspx?discussion=1</a></p> 