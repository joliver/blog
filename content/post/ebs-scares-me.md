+++
type = "post"
date = "2014-06-30"
title = "AWS Elastic Block Storage Scares Me"
description = ""
slug = "ebs-scares-me"
tags = []
+++

Take a look at the last half-dozen or so publicized outages at Amazon. Every single time it was a failure in EBS—including the multi-day EBS outage in April 2011.

I still love AWS. If you have an elastic (scaling) workload, it's awesome. Normally I have a hard time taking a dependency of third-party behavior which facilitates vendor lock-in, but Amazon makes it so incredibly easy because their cloud is vastly more capable when compared to other cloud providers.

The problem is that there's always a man behind the curtain—hardware fails and the [network isn't reliable](http://en.wikipedia.org/wiki/Fallacies_of_Distributed_Computing). AWS has done an amazing job engineering their system and driving out failure scenarios. But there's one system that seems to be so complex that it fails again and again: Elastic Block Storage.

It seems that ever since the introduction of EBS, AWS has been trying to actively promote the use of EBS. For example, RDS and a number of other AWS offering are based upon it. This is a big drawback with the AWS cloud compared to other providers. Other cloud providers have stuck with physical disks (and SANs in some cases) because it's easy and reliable as far as disks are concerned. Yes, physical disks are slightly less capable, but they're better understood and present a known set of failure scenarios when compared to a network-based solution.

On the surface, EBS solves the immediate business problem of durable/stateful storage on instance. This allows an operating system that think it own the underlying hardware to continue to operate on this same principle. But it's a crutch. Now I'm not saying that everyone should give up and just use S3, but I am saying that you may want to consider the storage requirements of your application when deploying and scaling. For example, there's a big difference in the underlying requirements for stateless systems such as web servers, application servers, etc. as compared to databases and message queues. If you drive out those differences in your architecture and infrastructure, it allows you to make trade offs about where and how the various kinds of services will be hosted.

One of the biggest problems I have with EBS is that, for me, it violates the principle of boundaries. Specifically, I like to architect solutions based upon known boundaries—that of a physical disk or a physical machine. By considering local, physical devices rather than unknown, remote logical devices made to look like a single physical device, we constrain the boundaries of failure to a single machine. In traditional RAID storage, the failure modes are well understood and are handled at the hardware level. In EBS, the complexity of the implementation and all of the moving parts and variables allows a lot of room for error such that it's possible to have an outage across the entire AWS region, despite the single availability zone promises made by Amazon to the contrary. Note that EBS only recently started offering an SLA, but what's a few credits to your account in the face of hours or even days of failure?

Fortunately, there are a lot of public AMIs maintained by the OS vendors that use instance-based storage rather than EBS storage. One reason we don't use them is because they're not actively promoted—in fact, they're typically hidden because of the support burden to Amazon resulting from misunderstanding about their durability guarantees—that and they're more difficult to work with, such as snapshotting, and other use cases.

One question people have is whether S3 is just EBS under the hood. The answer to that is no. S3 was the original cloud offering from Amazon from 2004 and operates on the principle of replication. EBS is a relatively new invention (circa late 2009 or so).

If you're the type that likes to get bitten hard by catastrophic failures and massive data loss, then by all means, keep using EBS. It's only a matter of time before an EBS outage strikes again. And please, try to stay out of Virginia (us-east-1), it seems to be the most susceptible to EBS failures.