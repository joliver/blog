+++
type = "post"
date = "2011-03-14"
title = "IIS 7 500 Errors"
description = ""
slug = "iis-7-500-errors"
tags = []
+++

<a onblur="try {parent.deselectBloggerImageGracefully();} catch(e) {}" href="http://1.bp.blogspot.com/-nvw7fJ-MP7M/TX5L_T_jbYI/AAAAAAAAAD0/yzxZYKsXrsw/s1600/error.jpg"><img style="display:block; margin:0px auto 10px; text-align:center;cursor:pointer; cursor:hand;width: 400px; height: 263px;" src="/images/error.jpg" border="0" alt="" id="BLOGGER_PHOTO_ID_5583984139056672130" /></a><br /><p>I paid my "Windows tithing" recently and did a complete reinstall. Fortunately Windows is now a guest VM inside of a Linux host. A settings change I had made a long time ago but forgot to reapply during my reinstall was for IIS. Whenever I was developing--even locally--I would get "500" errors from IIS which would then display a generic and very unhelpful error page.</p><p>The solution is to go into IIS and disable generic error messages:<br /></p><p>http://mvolo.com/blogs/serverside/archive/2007/07/26/Troubleshoot-IIS7-errors-like-a-pro.aspx</p>