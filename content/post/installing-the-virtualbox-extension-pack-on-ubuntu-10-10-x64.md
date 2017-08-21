+++
type = "post"
date = "2011-03-10"
title = "Installing the VirtualBox Extension Pack on Ubuntu 10.10 x64"
description = ""
slug = "installing-the-virtualbox-extension-pack-on-ubuntu-10-10-x64"
tags = []
+++

<a onblur="try {parent.deselectBloggerImageGracefully();} catch(e) {}" href="http://2.bp.blogspot.com/-R7apdEcWNWQ/TXkV8EnSxbI/AAAAAAAAADs/sP80-vqeRco/s1600/error.png"><img style="display:block; margin:0px auto 10px; text-align:center;cursor:pointer; cursor:hand;width: 400px; height: 175px;" src="/images/error.png" border="0" alt="" id="BLOGGER_PHOTO_ID_5582517334877324722" /></a><br /><p><span style="font-family:arial;">There have been quite a few posts related to issues installing the VirtualBox Extension Pack for both Windows and Linux hosts.</span><span style="font-family:arial;"><br /></span></p><ul><li><span style="font-family:arial;">http://forums.virtualbox.org/viewtopic.php?p=11262&sid;=334fb962995ae00d32bb8988192f701c</span></li><li>http://www.virtualbox.org/ticket/7899</li><li>http://www.virtualbox.org/ticket/7972</li><li>http://blogs.oracle.com/wim/2010/12/oracle_vm_virtualbox_40_extens.html</li></ul><p>The error message given is very cryptic: </p><p>"Failed to install the Extension Pack" NS_ERROR_FAILURE (0x80004005)</p><p>Weird.</p><p>In digging through the above posts I found tidbits of the solution that I was able to put together. I'm currently running a Ubuntu 10.10 x64, so here's how I solved the problem and installed the extension pack. Give the VBoxExtPackHelperApp execute permissions and then run the install from the command line.</p><ol><li>sudo chmod 744 /usr/lib/virtualbox/VBoxExtPackHelperApp</li><li>sudo /usr/lib/virtualbox/VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.0.4-70112.vbox-extpack</li></ol>