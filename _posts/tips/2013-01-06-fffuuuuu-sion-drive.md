---
layout: single
title: "FFFUUUUUsion Drive"
category: [tips, tech]
excerpt: "In which I get mad because Fusion Drive works so well."
tags: [macos, tips, storage, post]
date: 2013-01-06
modified: 2013-01-16
---

I recently re-arranged some of my househould storage which put me in a somewhat unique situation where I could observe some general behavior and performance of mixed filesystems and services in my household.  I have been using [ZEVO] for ZFS on Mac OS X, in addition to various other implementations of ZFS on SmartOS, Solaris, and FreeBSD in the case of [FreeNAS][].  I had wanted to retire my old ReadyNas NV+ due to being nearly at capacity and having some other performance issues that have been somewhat limiting.

So in the course of shuffling disks and re-purposing hardware, I also went ahead and built a DIY Fusion Drive to see how Apple's new tiered storage system works.  tl;dr: it's pretty great for what it is.  If there was a clear way to make it redundant or fault-tolerant in some way I'd probably be really motivated to make more use of it, but for now as my workstation's Users filesystem, it's perfect for home directories that have a lot of cache files and indexes and then a bunch of other stuff that doesn't get used very often being shuffled onto platters.

I've built a little table to record some of the time trials writing two files to various media on this workstation or on the network. The 120GB SSD is 3Gbps only and the 240GB SSD is 6Gbps, so I realize this isn't a great test suite but the numbers were interesting regardless.

### Test system

The test case is a quad-core i7 2600k running Mac OS X 10.8.2 with two SATA controllers.  The 3Gbps controller is the intel SATA controller on-board a `ga-z68x-ud3h-b3` motherboard, and the 6Gbps controller is a Marvell SATA controller also on-board.  No hardware RAID is used, because it's stupid.

This system is my desktop workstation used by me and it continued to be used by me during the test, which was scripted and used `mkfile` and the built in `time` function of my shell (zsh).

In typical use includes VMware Fusion running 1 or 2 VMs with 4-8GB of allocated memory and 2-4 allocated cores, Apple Aperture, iTerm 2, web browsers, DEVONthink, Evernote, Handbrake (video encoding software), iMovie, OmniFocus, iA Writer and other assorted utilities, menu bar dodads and Plex Media Server, which is often transcoding video from a NAS to an AppleTV on WiFi.

### Caveats

I didn't intend for this to be a comprehensive test, I just wanted to see what the *write speed* was to the media available to me internally and on my network.  YMMV.  This data is anecdotal and should be treated as such.  I am not interested in doing a comprehensive battery of tests, **I just wanted to see how well a DIY fusion drive faired against other options available to me in my typical usage scenario.**

||| ***what was tested*** |||||| ***results*** |
| size	|| filesystem || hardware | rotational speed | link | secs | > | Mbps | 
| 200M	|| zfs || [ZEVO][] Mirror 2x1GB | 7200 RPM | 3Gbps | 6.685 || 240 Mbps | 
| 1024M || zfs || [ZEVO][] Mirror 2x1GB | 7200 RPM | 3Gbps | 35.428 || 232 Mbps | 
| 200M	|| zfs || [FreeNAS][] (x64) raidz1 3x3GB | 7200 RPM | 1Gbps | 3.972 || 400 Mbps |
| 1024M || zfs || [FreeNAS][] (x64) raidz1 3x3GB | 7200 RPM | 1Gbps | 20.779 || 392 Mbps | 
| 200M	|| jhfs+|| usb3 | 5400 RPM | 50Gbps | 3.834 || 416 Mbps | 
| 1024M || jhfs+ || usb3 | 5400 RPM | 50Gbps | 20.876 || 392 Mbps | 
| 200M	|| ext3  || raid 4x1GB ReadyNAS nv+ (sparc) | 7200 RPM | 1Gbps | 8.674 || 184 Mbps | 
| 1024M || ext3  || raid 4x1GB ReadyNAS nv+ (sparc) | 7200 RPM | 1Gbps | 57.408 || 144 Mbps | 
| 200M	|| jhfs+ || Fusion Drive intel 120+1GB seagate | 7200 RPM+Flash | 3Gbps | 1.667 || 960 Mbps | 
| 1024M || jhfs+ || Fusion Drive intel 120+1GB seagate | 7200 RPM+Flash | 3Gbps | 11.099 || 736 Mbps | 
| 200M	|| jhfs+ || intel 240 sandforce | Flash | 6Gbps | 0.796 || 2008 Mbps |
| 1024M || jhfs+ || intel 240 sandforce | Flash | 6Gbps | 3.939 || 2080 Mbps |

## Interpretations 

I'm a little surprised that my local zpool is performing worse than the one across the network.  I suspect there are a lot of ways that [ZEVO][]'s performance could be improved significantly. The performance of it isn't a hinderance to me and my workload[^1] and I'd rather have reliable data than fast data, which brings me to my next point.  Fusion Drive is pretty damned good.  It's better than using a USB3 drive, it's better than local [ZEVO][] and it's better than the network fileservers as well.  The only time it isn't the fastest is when it's up against a bare SSD, and I'm thinking that part of that is related to the SSD I used for my Fusion Drive being an older device to begin with.

Even without things like my iTunes libraries and Photos, my home directory easily swells to large sizes that exceed the price of an SSD I can afford without coming up with some convoluted logic that makes me need it.  My Library folder is 80GB, you do the math.

Fusion Drive gives me a great way to flex my storage to give me benefits of solid-state flash with capacity of magnetic platters. The only problems I have with it are that I don't trust HFS+ enough to not break my data and never tell me about it because it doesn't know it's been broken, but in OS X there are other considerations to be made for data and metadata about that data. My local zpool is for things I actually care about like Documents and Photo libraries that I'm actively working on.  My RAW photo images are archived to that space in addition to the working files for my Aperture libraries, which are regularly snapshotted so I can effectively roll back through any changes or mishaps that happen within Aperture and restore to other points in time more gracefully than I could with Time Machine, which I also use to do a local backup of my workstation and almost all of the data stored local to this system via an older FW800 external Seagate drive.

I don't know what I'll do long term with this Fusion Drive.  It's a great experiment and I like the results it gives, I have contemplated going the route of making it a zpool on top of the corestorage Fusion logical volume, but I'm certain that some of the behavior of zfs would be too much of a monkeywrench to throw into the mix.  Maybe I should convert the 120GB drive into a cache or ZIL for my local pool and add the 1TB disk to my mirror making it a three-way[^2] mirror where I'm not sweating the fact that my boot volume AND my home directories are on non-redundant storage that cannot break without resulting in downtime!

Last edits @20130116 to reflect Mbps on the transfers for easy reading.

[^1]: mainly writing, music, research (vmware and Xcode) and photography with frivolious pursuits like Diablo III, KOTOR, and World of Warcraft now and then
[^2]: hot
[ZEVO]: http://zevo.getgreenbytes.com/
[FreeNAS]: http://www.freenas.com/
