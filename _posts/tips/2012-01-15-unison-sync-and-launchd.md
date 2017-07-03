---
layout: single
date: 2012-01-15
modified: 2016-02-15
name: Unison sync and launchd(8)
title: Unison sync and launchd(8) 
excerpt: "I have multiple computers that I want to have a common Documents folder.  How to keep track of all my folders, files, code trees, notes, and even DEVONthink Pro databases without resorting to Dropbox?"
category: 
 - tips
 - work
 - post
tags: 
 - osx
 - post
---

This is written for someone already familiar with basic scripting, using ssh, and concepts like port forwarding and filesystems.  I also assume that the reader will be able to read referenced documentation and isn't adverse to helping themselves.  

<div class="notice--warning" markdown="1">
#### Deprecated
I don't use Unison anymore, and prefer using [BitTorrent Sync](https://getsync.com/) for my folder sync needs. This article won't get a lot of attention and may no longer be useful. --emory
</div>

# Unison

[Unison](http://www.cis.upenn.edu/~bcpierce/unison/) is a file sync solution that runs on Windows, Mac OS X, and any (other) UNIX-like system.  It isn't a one-way shove-and-update like rsync, it's a way to actually sync bi-directional changes in a directory or file, and allows you to gracefully resolve conflicts.

There are a lot of sync packages and applications that don't work very well or get in your way with weird UI conventions and language.  Unison provides a GUI and a command-line interface, and the GUI is geared towards handling the essentials without clutter.

Benjamin C. Pierce and the Unison team have really done something great with this software.  

I don't want to have this document be a complete tutorial on using Unison, so you'll want to read the documentation on the [Unison](http://www.cis.upenn.edu/~bcpierce/unison/) homepage if you want to familiarize yourself with terminology and conventions, I'll be moving pretty fast by the time we get to the launchd jobs, profiles, and scripts.

# My problem

I have some network-attached storage, a couple of virtual machines, a desktop workstation at home, a desktop workstation at the office, and a MacBook Air.  Some of my virtual machines mount home directories from my NAS, but my workstations and MacBook do not.

There was a time where I wanted to keep everything on the NAS, but there have been some performance issues with large amounts of data and at the time slower wireless options, and I haven't revisited since 802.11n came into prevalence.  One of the virtual machines is an OS X Lion Server that ends up being where my sync operations happen, but I have also done it directly on the NAS, though I found this too expensive in CPU for that device (it's a SPARC, OK?) and it slowed things down.

# How to install Unison

There are many ways to have Unison installed, how you get there is your business.  You don't need the GUI for anything I'm doing in this document, but it doesn't hurt.  

If you use [homebrew](http://mxcl.github.com/homebrew/) or [MacPorts](http://www.macports.org/) it's really simple.

{% highlight shell %}
	brew install Unison
{% endhighlight %}

or:

{% highlight shell %}
	port install unison
{% endhighlight %}

Those will build you the CLI version and maybe a GUI.  You can also just install the Unison.app release which includes, and will offer to install, a CLI tool (`unison`) that you can use for your scripting and automation.  You can download it from the [Unison download page](http://www.cis.upenn.edu/~bcpierce/unison/download.html) and pick whatever version you want (but make sure it's consistent with the other systems you're syncing with).

If you use the Unison.app release on a Mac OS X system I recommend doing this:

{% highlight shell %}
	ln -s ~/Library/Application\ Support/Unison ~/.unison 
{% endhighlight %}	
	
This is more important if you have UNIX-like systems in the mix but it's also just a nicer shortcut when you're adjusting profiles than digging through your Library.  If you don't want to do it, YMMV, etc.  Unison on Unix expects it in `~/.unison` and the Mac OS X .app expects it in `~/Library/Application\ Support/Unison` so if you don't want to do it my way, remember that.

## Configuring Unison Profiles

One key point to remember is that it is always faster to have Unison on both systems when you're doing a multi-device sync.  You may be tempted to just mount the filesystem over the network and do the sync operation that way.  You can!  But Unison will do it faster on the remote end, even if you have a slow shitty processor like a SPARC.  Local filesystem access is key for performance in Unison.

Install Unison on every system you want to be syncing.  

# Your Sync Strategy

I like to find a host that will be the point where other systems will sync against.  It should be available over the Internet (via port forwarding, back-to-my-mac, or a VPN) and on my local network, and have trustworthy storage while being reliable.  You may even want to deploy this on a remote system or virtual system in Amazon EC2 if you wanted to.  In my case, it's an OS X Server instance at home, which is accessible via the Internet and BTTM.  

I'll call that system `syncserver` in my examples.  I use ssh as the vehicle to get me from A to B (and I think you should too) and rely on port forwarding to get into the sync server remotely.  You can specify ports like you'd expect (`syncserver:10000`) in your profile.

I also use ssh authentication keys and ssh-agent which is a big assumption on my part but you can learn all about that elsewhere.  It will let you safely do unattended syncs without having to type in passwords to remote systems.  You want to do it, and if you have access to your home network via ssh already you probably already have this going. 

## Profiles & Includes 

I have a few different sync profiles but the common and shared options (things I want to always get, things to ignore, options to Unison I want to have respected by default) go into an include.

My included file is called `common` and contains this:

{% highlight shell %}
     # common vars
     #
     
     fastcheck = true
     sortnewfirst = true
     confirmbigdeletes = true
     rsrc = true
     
     ignore = Path .*
     ignore = Path Omnifocus\ Backups
     ignore = Name .AppleDouble
     ignore = Name .FBCIndex
	 ignore = Name .FBCLockFolder
{% endhighlight %}	 

Pretty interesting to note that Unison profiles don't need escaped spaces.  You can have a directory in your path named `The Folder` without having to call it `The\ Folder` (and in fact it probably will fail if you do that).


# Profile Samples and Examples

## Sample: dotfiles

I have a directory called .dotfiles in my home directory.  It's where I store my zshrc, ssh keys, gnupg keys, muttrc and my tmux configuration file among other things.  This is great to keep some of my favorite things in-sync with each other no matter what system I'm using, I just symlink them (`ln -s ~/.dotfiles/zshrc ~/.zshrc`) and let Unison push them around.

My `dotfiles.prf` in `~/.unison` contains:

{% highlight shell %}
     root = /Users/emory/.dotfiles
     root = ssh://emory@syncserver//Users/emory/.dotfiles
     include common
     
     ignore = Name {S.gpg-agent}
{% endhighlight %}	 


## Sample: Documents 

You probably know what this is.  

I have a `Documents.prf` profile:

{% highlight sh %}
     root = /Users/emory/Documents
     root = ssh://emory@syncserver///Users/emory/Documents
     include common
{% endhighlight %}

## Sample: Research Database 

I have a system that only syncs one thing: a DEVONthink Pro database.  I don't want my personal documents making it over to my office workstation because it isn't mine, but I do want my research data to be available and in-sync.  I made a separate profile for that database because it's essentially a directory.  I don't care about permissions on the contents in there.

I call it `Research.prf`.
{% highlight sh %}
     root = /Users/emory/Documents/Research.dtBase2 
     root = ssh://emory@syncserver//Users/emory/Documents/Research.dtBase2
     
     rsrc = true
     perms = 0
{% endhighlight %}

# Automation

You can do manual sync operations now just by using the GUI or the CLI.  

{% highlight shell %}
	unison -ui text Documents 
	unison -ui text dotfiles
	unison -ui text Research
{% endhighlight %}	 

	
If you don't specify the text UI, it will pop up the GUI for you, for my scripts we want to have the text output.

## launchd 

I'm bad at `launchd`, so you'll be able to improve these, but it's what I've got.

I create a file called `org.incumbent.Unisons.plist` in `~/Library/LaunchAgents`.  I do a couple of things with this that you may find interesting.  I have launchd use `WatchPaths` to monitor for changes, but `WatchPaths` can't detect changes to subdirectories.

Most of the time the changes in a DEVONthink database will touch the document itself so it should get picked up.  But I also have a time interval of 1200 seconds listed so it will automatically sync every 20 minutes and also when it sees something change in Documents or my DEVONthink Research database.

In those 1200 seconds or when it sees a change, it will kick off a sync by executing a shell script I have in `~/bin/` called `unisons.sh`.  You can break this out into multiple scripts or something if you want or get fancy in launchd.  I wouldn't mind hearing from you if you improve these launchd jobs or scripts.  I'd like to do them better but not badly enough to do it myself.

{% highlight xml %}
     <?xml version="1.0" encoding="UTF-8"?>
     <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
     <plist version="1.0">
     
     <dict>
     	<key>Label</key>
     	<string>org.incumbent.Unisons</string>
     
     	<key>Program</key>
     	<string>/Users/emory/bin/unisons.sh</string>
     
     	<key>LowPriorityIO</key>
     	<true/>
     
     	<key>RunAtLoad</key>
     	<true/>
     
     	<key>WatchPaths</key>
     	<array>
     		<string>/Users/emory/Documents/</string>
     		<string>/Users/emory/.dotfiles</string>
     		<string>/Users/emory/Documents/Research.dtbase2</string>
     	</array>
     
     	<key>StartInterval</key>
     	<integer>1200</integer>
       
     </dict>
     </plist>
{% endhighlight %}

## unisons.sh

The launch agent will kick off a script, and here is what mine looks like.

{% highlight sh %}
     #!/bin/zsh
     
     sleep 30
     
     # For each profile I want run, do a run of unison with the name of my profile(s)
     # My unison binary is installed by HomeBrew and put in /usr/local/bin, ymmv. 
     # (psst -- the GUI puts its optional CLI binary in /usr/bin)
     
     # this one is my Documents folder profile
     #
     
     /usr/local/bin/unison -auto -batch Documents -ui text
     
     # this one is my dotfiles folder profile
     #
     
     /usr/local/bin/unison -auto -batch dotfiles -ui text
     
     # sample of Research database
     # to sync the DEVONthink database using the Research profile
     
     /usr/local/bin/unison -auto -batch Research -ui text
     
     # Want a growl notice?
     #
     #/usr/local/bin/growlnotify -m "Documents and dotfiles are synced."
     
     # put a message in syslog
     #
     echo "Light is green, trap is clean.  -- unisons.sh"
{% endhighlight %}

I don't do any error checks or anything yet.  Maybe someday.  I probably would want a Growl notice with any errors from the unison.log.

## load the launchd job

You've got that launchd plist but you need to load it before it will be running.  

``launchctl load ~/Library/LaunchAgents/org.incumbent.Unisons.plist``

You'll have a file called ~/unison.log by default that will start showing you some information and details.  You can also run unisons.sh manually to see any issues that require your intervention, or open Unison.app and run the profiles in question to see any conflicts and do side-by-side comparisons.  

# Extended attributes (xattr) and metadata

I'm having some inconsistant results with this, Unison supports resource forks but that isn't the same thing, and my test case involves ZFS filesystems and some other nonsense that is immaterial to this.  If you want something that absolutely handles extended attributes (I haven't made up my mind yet) I have had consistant 100% success with [ChronoSync](http://econtechnologies.com/pages/cs/chrono_overview.html), which I think has an overly obtuse user interface and slower sync operations but absolutely supports xattr metadata.

# Resources 

## links

* [Unison](http://www.cis.upenn.edu/~bcpierce/unison/)
* [Markus @dlite.de](http://logbook.dlite.de/secure-synchronization-with-os-x-launchd-and-unison/)'s post about Unison and launchd to sync a Things.app folder.

## bonus material

If I was going to buy a NAS today it would probably be a Synology, which can also run Unison directly on that with more CPU and memory, so it would probably perform very well for this task.  If you've built yourself a NAS appliance using FreeNAS, the newer version doesn't have Unison included but the previous releases do.  I don't know what their roadmap will be for support of Unison in the future.
