---
layout: single
permalink: //about/index.html
title: "About"
description: "an about page"
category: [meta, emory]
author_profile: true
---
My name is Emory, but I tell Siri that she can call me *big papa*.


## Brief Bio 

I'm a network security *friengineer* by trade, serial hobbyiest, writer, photographer, practicing min-maxer, and a category-five wisenheimer. 

I am often carrying a camera and have no indoor voice. 

Going way back in time; I was the founder of hellyeah! networks. Most of this once proud society of slackers and hackers has been swallowed by the cloud, but we're still out there kicking it oldschool. [^1]

## Outputs

### Web 

I have a sometimes-used *linkblog*, ([emory.KVET.CH](http://emory.kvet.ch/)) and a photography portfolio, [ephemeral.be](http://ephemeral.be/). I've slowly been moving things I've written or organized to this site in order to keep my best-ofs all in one place rather than scattered between a dozen half-finished projects that end up getting neglected. 

### Podcasting

With the Internet's own [Alan Joyce](http://thisisalan.com/) I sometimes co-host a podcast called <a href="http://show.hellyeah.com/" target="_blank">the hellyeah! show</a>, which is now in its third season. It is best described as two geeks trying to find better ways to do things, and then talk about games. We haven't recorded in a little while but maybe that will change.

## Socialism

I sometimes dabble in <a href="https://plus.google.com/+EmoryL">Google+</a>, occasionally <a href="http://facebook.com/incumbent/">Facebook</a>, very rarely find my way to the [twitter machine](http://twitter.com/incumbent) because it's a head-wound waiting to happen `#headdesk` —  sometimes I'm seen using [ADN](http://app.net/emory/), which has been a very unfortunate exercise in great expectations. I am interested in just about any social or messaging service and try them all at least once. Eventually we'll get something as useful as `finger` and `zephyr` after the billions of dollars in venture capital have failed to deliver us from terminals, right? 

You may also find me on [flickr](http://flickr.com/photos/sempai), but I generally treat it like a high-res [instagram](http://instagram.com/incumbent). Lately I've been keeping an eye on [VSCO Grid](http://ephemory.vsco.co/) and [oggl](http://oggl.me/emory/), too. I even have a page on [ello](http://ello.co/kvetch)!

## Projects I'm Working On

**Creatively** I'm currently working on something about semi-secret societies and new spiritual orders that are changing the course of policy in the United States. It's speculative fiction, which means I'm making shit up, but it sounds plausible.

I'm also working on a few photography projects that I'm likely forever [casting](/casting). One of them is about the workflows of creative people; what they do and how they get it done. Their creative process will never be the same as anyone else, and I'm interested in that sort of thing.

I am also, of course, thinking about writing a script with my wife for a television pilot. It's about us, but maybe a more glamorous us. 

**Professionally** I'm working on multi-factor authentication, device management, and host integrity monitoring. I am also tinkering in the lab with location services, mobile applications, accessible encryption, and personal publishing. I have the dubious distinction of being listed as an inventor on a patent for an authenticated content syndication system that was gently paired with RSS/atom and OpenID. 

I did the technical review for a few O'Reilly books on OS X and smartphones, and wrote half of one myself that was never released but still lives on Amazon's Canadian site for some reason. 

## Work & Availability

My consulting practice, [due\|vigilance](http://duevigilance.com/), is where you can learn more about my consulting services. At the time of this writing, I'm not taking new clients for assessments or long-term engagements. I'm taking a bit of a sabbatical and have been spending time with my kids, catching up on my reading, and working on being a better photographer in order to get away from keyboards now and then. It's the luxury of doing it on the side in that I can be very selective about who I work with after the children are in bed.

**I am, however, very *available* for script review** on creative projects for the web, paper, television and film. If you're working on a project that could benefit from some experise on the *seedy underbelly of the Internet*, please tell me all about it. I would love to give your project some extra authenticity without losing your audience in the process. I can make very complex things approachable by non-nerds, and yet relevant in a way even the most grizzly neckbeard can appreciate.

## Contact

The best ways to contact me are probably:

* send an [email](mailto:emory@hellyeah.com)
* ping me via [iMessage](imessage://emory@hellyeah.com)
* [sms](sms:+16465436679) or [phone](tel:+16465436679) @ +1-646-54-EMORY

These are ranked in order of how disruptive they are, low to high. Sending a raven from King's Landing is no longer available; you know who you are, and thank you so much for ruining it for everybody.

# Encrypted Email

Very well, 007. You're catching me a little off-guard right now because I've been thinking about this quite a bit lately but I'm prepared to accept your message with the following caveats. 

#### OpenPGP, GNUpg, PGP

My public key [<span class="fa fa-lock"></span> 4096/7EEB0403](/files/7EEB0403.asc) is available direct from me, the keyservers you already use, or [Keybase](http://keybase.io/emory). Nothing too weird about this and if you use gnupg already nothing unusual about this at all and go on doing what you do.

*Please note that I don't have a trustworthy way to view gnupg signatures or decrypt gnupg encrypted email when I'm not at my desk.*

#### S/MIME

Since iOS supports S/MIME natively, I prefer dealing with that. 

# How I really feel about the Certificate Authorities

This is the part where I deviate from typical use-cases.
{: .notice}

I don't have a lot of reason to trust that the widely trusted certificate authorities are trustworthy at the level of email certificates. I don't think they do sufficient verification on the identity of people and individuals that request email certificates regardless of charging money for it or not. 

I'm not aware of a certificate authority that even offers email certificates that aren't verified by completely meaningless and trivial  measures (they literally just make sure you have access to an email account long enough to verify receiving an email there which I find a little insulting), and when you get a free email certificate from one of the providers out there like StartCom or Comodo, you're also given a limited certificate with reduced capabilities and purposes **and** it doesn't include anything identifiable in the fields of the certificate because they didn't validate a name only the email address, which means you have to drill into individual certificates to find the one you wanted!

This is the sort of thing that further leads to email encryption being too complicated and too confusing for people. The process sucks, the level of assurance is low, and the authorities are signing agreements with subordinate organizations that are targetted specifically to generate valid recognizable certificates for services they don't run to do malicious things.

So lately I've been thinking that I'll just self-assure S/MIME like I do my gnupg identity. I already had a micro certificate authority anyway because I have an OS X Server host that runs a directory server and generates profiles for the devices I manage, so why not just sign my own certificates? Sure, that means when I email people that don't trust my certificate they see that they don't trust my certificate, but if they want to they can verify it with me, verify directly with me, or we can sign each other's keys and take a peer-to-peer approach to trust, which is probaby closer to how the technology was intended to be used anyway.

That was a little long-winded. So I'll move on the parts you care about:

My public [<span class="fa fa-lock"></span> certificate](https://pki.kvet.ch/ca/certificates/eyrie_Emory.crt) is available for your importing. You may trust it however you see fit. If you want to, you can also import and/or trust [<span class="fa fa-lock"></span> my household's Certificate Authority](https://pki.kvet.ch/ca/certificates/eyrie_Root.crt) by fetching and importing the KVETCH Complaint Department CA certificate. I also have an [Intermediate CA Certificate](https://pki.kvet.ch/ca/certificates/eyrie_Intermediate.crt) for you that will sign device, service, and end-user certificates. Ask me if you want to send me a CSR or otherwise create a more formal crypto relationship. Read more about the [Eyrie CA](https://pki.kvet.ch/) if you're interested in my household PKI.


<img src="/assets/images/comeatmebro.jpg" class="img-rounded">

[^1]:	Just because I'm O.G. doesn't mean that you must feel the need to recognize. 

