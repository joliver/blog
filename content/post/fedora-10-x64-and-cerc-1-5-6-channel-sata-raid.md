+++
type = "post"
date = "2009-01-03"
title = "Fedora 10 x64 and CERC 1.5 6-Channel SATA RAID"
description = ""
slug = "fedora-10-x64-and-cerc-1-5-6-channel-sata-raid"
tags = []
+++

<p>Fedora doesn't play nice with this RAID card.&# 160; After installation it wouldn't recognize the hardware device.&# 160; It would just say:</p> <blockquote> <p>Volume group &quot;VolGroup00&quot; not found</p> </blockquote> <p>After a bit of Googling, I came upon <a href="http://forums.fedoraforum.org/showthread.php?t=205115&amp;page=3">this post</a>.&# 160; The problem occurs because Fedora is loading too quickly and not giving sufficient time for the RAID card to be recognized.&# 160; The solution is to boot into recovery mode using the Fedora installation disk.</p> <p>Once at the command prompt in recovery mode you'll want to change the mounted root: chroot /mnt/sysroot</p> <p>Then run:</p> <blockquote> <p>mkinitrd -f --with=scsi_wait_scan /boot/initrd-2.6.27.5-117.fc10.x86_64.img 2.6.27.5-117.fc10.x86_64</p> </blockquote> <p><font color="# 666666">You'll need to determine which version of Fedora you're using and change the numbers in the command accordingly.&# 160; On a freshly installed FC10 using the original installation media (x64), the above command should work.</font></p> 