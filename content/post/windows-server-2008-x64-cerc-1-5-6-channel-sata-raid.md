+++
type = "post"
date = "2008-12-31"
title = "Windows Server 2008 x64 & CERC 1.5 6-Channel SATA RAID"
description = ""
slug = "windows-server-2008-x64-cerc-1-5-6-channel-sata-raid"
tags = []
+++

<p>Just so you know, for some reason when you do a clean install of Windows Server 2008 x64 on a machine with Adaptec's CERC 1.5 6-Channel SATA RAID card, Windows doesn't have drivers built in.</p> <p>Easy enough, you can go get the drivers from the manufacturer website--in my case Dell. Obviously you want to use the x64 drivers because it's an x64 operating system. When you attempt to use the x64 drivers via the &quot;Load Driver&quot; option, because it can't detect the disks otherwise, it gives you the following <em>helpful</em> message:</p> <blockquote> <p>&quot;To continue installation, use the Load Driver option to install 32-bit and signed 64-bit drivers.&quot;</p> </blockquote> <p>There's a little bit more to the &quot;error&quot; message, but ultimately what it is saying is that it doesn't like your drivers. I Googled around for a bit and found other related posts that had a slightly different problem--the infinite BSOD/reboot loop.</p> <p>In my particular case I actually tried the x86 drivers out and it solved it for me. Once I get the system up all the way I'll just replace them with the x64 drivers.</p> 