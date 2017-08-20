+++
type = "post"
date = "2011-05-06"
title = "ASP.NET MVC and IIS7 404 Pages"
description = ""
slug = "asp-net-mvc-and-iis7-404-pages"
tags = []
+++

Note to self (and to anyone else who cares): If IIS7 is giving back 404 pages and it's pointing to the proper directory and configured with Integrated Mode, and the MVC routes appear to be correct, it might be that there are no controllers registered with the container.

This one bit me a little bit today--I kept getting 404 pages from IIS and everything appeared to be configured correctly.  Finally, when I registered the controller with the container the 404's went away and I was able to continue.

Hand on forehead moment.