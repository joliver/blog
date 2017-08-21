+++
type = "post"
date = "2009-06-23"
title = "Synergy: Cross-Platform Keyboard & Mouse Sharing"
description = ""
slug = "synergy-cross-platform-keyboard-mouse-sharing"
tags = []
+++

<p>I recently setup a dedicated Linux machine next to my Windows machine. Rather than using a KVM switch or two keyboards and two mice, I searched for a solution that would allow me to share the same keyboard, mouse, and clipboard between the two machines.</p> <p>Enter <a href="http://synergy2.sourceforge.net/">Synergy</a>. While it appears that is no longer under active development, it still works great.</p> <p>For my setup, my Windows machine is the host/server—meaning it's the one with the keyboard and mouse physically attached. The Linux machine was the guest/client. I wanted to have everything shared prior to user login on the Linux machine so as to avoid the need for the second keyboard at all.</p> <p>Most of the articles I found online involved adding the “synergyc” process to “Startup Applications”. The only problem with this was that it's post-login for Linux. This was unacceptable.</p> <p>Then I found the solution—put the command in the Gnome Init script. The <a href="http://ubuntuforums.org/showthread.php?t=48196&amp;page=3">tutorials</a> also talked about putting it in the PreSession startup script as well because, as they said, the synergyc process would get killed on login. I'm using Fedora 11 and I didn't find that to be the case.</p> <p>Simply add the following to the /etc/gdm/Init/Default script, just above “sysmodmap=…” line:</p> <blockquote> <p><strong>synergyc IP.Address.Of.Server.HERE</strong></p> </blockquote> <p>The only other thing I had to do, after configuration and starting the process on the Windows host, was open a port on my Windows firewall.</p> 