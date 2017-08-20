+++
type = "post"
date = "2012-03-23"
title = "NuGet File Locks"
description = ""
slug = "nuget-file-locks"
tags = []
+++

Since leveraging some of the capabilities of NuGet v1.6, such as "package restore", our build server has been giving us random fits about various file locks.  Sometimes it was just a matter of re-executing the build and sometimes we had to clear the temporary build workspace and then re-execute.  In any case, it was very annoying.

The error message that we'd get during our build was something like this:

<strong>The process cannot access the file 'XYZ' because it is being used by another process.</strong>

After digging into the problem for a few minutes I found the conflict.  Our builds currently use the "<strong>maxcpucount</strong>" switch which enables multi-processor builds such that projects can be built simultaneously provided they have separate project dependencies.  In essence, it's a way to build "large" (10+ project) solutions more quickly.

The problem is that NuGet doesn't work well with the maxcpucount switch when using package restore.  The reason for this is that msbuild will execute a build for each non-related project.  However, some of those projects may contain 3rd-party NuGet dependencies.  This causes NuGet to go out and start downloading each dependency from the NuGet server.  Following that, it will unzip the NuGet package in the $(SolutionDir)\packages\&lt;package-version&gt;\ directory.  If multiple projects reference the same NuGet package, e.g. Log4Net or something else similar, then multiple simultaneous builds may collide while attempting to download the nupkg file and/or when attempting to extract the contents of the NuGet package.

The current workaround for v1.6 is to not perform builds with the maxcpucount switch.