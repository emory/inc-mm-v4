---
layout: single
title: "Email Practices: 2018"
subtitle: "How I'm directing incoming email, at least lately."
excerpt: "Rarely Inbox Zero."
tags:
 - workflow
 - tips
 - email
 - productivity
category: [articles, essay, resources]
date: 2018-02-24
last_modified_at: 2018-02-24 17:31
header:
  image: /assets/images/2018/blablah.jpg
  teaser: /assets/images/2018/blah-wide-sm.jpg
  caption: "a caption"
featured: true
---

<!-- this was started because of email from kevin -->

OK, Hi! 

Sorry for the delay on this. I think about email and that sort of thing quite a bit and there are many approaches I like and they all seem to have pluses and minuses. As I have been composing this reply I am becoming increasingly more -vvvvvvvv about it, so I'm going to clip out the really detailed parts and probably turn it into a more general audience post for my website. What remains is this:

# Inboxes

Currently, almost all of my incoming email goes to one of three places:

- emory@hellyeah.com » Google Apps/Gsuite (legacy free Apps account for myself + ~12 others)
- emory.lundberg@auth0.com » Google Apps/Gsuite (work identity)

## MUAs

### iOS 

- Mail.app, the only iOS email client that supports S/MIME certs  
- Gmail.app without notifications for quick query my Google accounts
- Occasionally using Canary (it handles gnupg gracefully, but it creates as many problems as it solves)

### macOS 

- MailMate.app is amazing and easily integrates with other software I use, has an incredible search
- Gmail's web interface in a browser 

## Filtering 

- Saved views/searches in MailMate for various things but also a LOT of 
- Filters in Gmail's web interface 

and perhaps unexpectedly:

- Sanebox 

Sanebox is a subscription service that you permit to access your email account, and they analyze the envelopes for your email and it quickly learns what is important and what might not be — I let newsletters and promotional shit all get shoved into a @SaneNews folder, receipts and statements and shipping notifications go into their @SaneBulk folder and things that I don't usually need to see right away generally end up in a @SaneLater folder. 

I say "folder" but because it's Gmail it's more that they're labeled that way and removed from the inbox but stay unread so I still see them as new messages when I go into @SaneLater on my phone or in MailMate, and it's easy to get there in the Gmail UI too. 

I actually like Sanebox a lot because it also has some other conveniences like if I am sick and fucking tired of getting an email from someone (probably a vendor) or just something I don't GAF about I put it into @SaneBlackhole and Sanebox ensures I never see emails from them ever again. I can label a message in the Gmail web UI as @SaneTomorrow and it'll make it go away and put it back in my Inbox tomorrow. That sort of thing.

I don't use SaneBox for Auth0 email so I rely on some filtering and rules to process things like notifications from Github into a notifications/github label, notifications on updates to Jira issues or Confluence pages go into a notifications/jira or confluence label -- I keep the labels visible and handy because I take those sorts of things out of my inbox. I like my inbox to almost entirely contain email from human beings that I actually want to see messages from quickly.

That's def more detail than I intended to drop on you but feel free to ask a question and steer me towards what you're curious about and I'll gladly give you my opinion or experience!



⤷ 
  You are standing in an open field west of a white house, with a boarded front door.
  There is a small mailbox here.

On Thu, Feb 1, 2018 at 11:23 PM, Kevin Strishock <kevin@3io.com> wrote:
Hey man, sell me on whatever voodoo you are using for keeping email under control. I trust your advice in these things :)


I was serious about an open bed available in the Bay Area, would be awesome to see you and catch up...Brooke would love to see ya too.

-Kevin

## Why Gmail:

I've obviously run my own IMAP services before, and I also used Fastmail's service for about three years or so up until a year or so ago. I really love Fastmail's service, and really love using actual honest-to-god IMAP. I was intending to move Liz's email over to Fastmail on a family plan, because she definitely prefers the way traditional IMAP behaves over Gmail's labels method. I do too, but once we were getting ready to start separating and everything it didn't make sense to hold onto Fastmail family subscription and I was like fuck it I'll just let things land at hellyeah! Gmail.

Various other email accounts, forwards, redirects, etc usually end up in emory@hellyeah but there are caveats to this approach, mainly that iOS Mail.app's method of adding a Gmail account means I can't also list my aliases (so emory@incumbent.org can't be used as my sending email address on my phone using Mail.app, nor can I change it to other aliases like emory@duevigilance.com or emory@ephemeral.be or what-have-you).

#### Privacy
##### iOS 
Mail.app on iOS is the only mobile email client that can use S/MIME X.509 certificates for signing and encrypting. For pgp/gnupg I have a sidecar iOS app that can be used as a helper, but I sometimes use an email client called Canary that is pretty interesting, and Canary supports gnupg/pgp keys just fine. 

##### macOS 
MailMate is fluent in both S/MIME and gnupg so that combined with it's absurdly impressive feature set and capabilities it's the only real choice, imo. Only thing I don't like about MailMate is that there is no way to implement a three-pane vertical preview setup like Outlook or that Gmail Labs feature "
(FYI consider my keybase (@emory) public keys as authoritative because I sometimes don't ensure the public keyservers have the right public keys available.)