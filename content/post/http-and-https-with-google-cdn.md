+++
type = "post"
date = "2010-09-15"
title = "HTTP and HTTPS with Google CDN"
description = ""
slug = "http-and-https-with-google-cdn"
tags = []
+++

<p align="justify">One little trick that I learned not too long ago was the ability to load a file from Google’s CDN (or any CDN for that matter) <strong>relative to the protocol of the page</strong>, e.g. if the page is HTTPS, the CDN content would load HTTPS, and vice versa.</p>
<p align="justify">In virtually all CDN examples you’ll see something like this:</p>
<p align="justify"><strong>http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js</strong></p>
<p align="justify"><script type="text/javascript">// <![CDATA[
<a title="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js" href="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"><strong>http:</strong>//ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js</a>”>
// ]]></script>

<p align="justify">But what if my page is HTTPS?  Do I somehow have to go through and either by hand, or with Javascript, update all src values to be HTTPS?</p>
<p align="justify">Nope.  There’s a much shorter way that’s part of the official URL spec that’s compatible with really old browsers, such as IE 3 and Netscape 3.</p>
<p align="justify"><strong>//ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js</strong></p>
<p align="justify"><script type="text/javascript">// <![CDATA[
<a title="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js" href="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js">//ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js</a>”>
// ]]></script>

<p align="justify">Did you see that it was missing “HTTP:” at the beginning?  It may look weird, but it’s a perfectly valid src attribute.  All the browser does is infer the protocol from the current location.</p>
<p align="justify"><strong>UPDATE</strong>: The primary reason for this is so that all elements on an HTTP page remain HTTP thus avoiding the overhead of HTTPS calls.  Similarly, we want all elements on an HTTPS page to be secure in order to avoid that nasty security dialog that could pop up to inform people that the page is only “somewhat” secure.</p>