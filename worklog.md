# 2019-05-01 issues with s3_website 

per https://github.com/laurilehmijoki/s3_website/issues/323

---
As a workaround, if I manually invoke the JAR file, it works:

	bundle exec s3_website install
	java -cp $(bundle show s3_website)/*.jar s3.website.Push

If I pass the same RUBYLIB environment variable that bundle uses internally, it fails: (T
his seems to support my theory that s3_website's JRuby is having problems because it's inheriting Ruby 2.5 or 2.6 settings from Bundler.)

	RUBYLIB=/usr/local/lib/ruby/2.5.0 java -cp $(bundle show s3_website)/*.jar s3.website.Push
--- 

_*Oh my god, I already looked into fixing this in March 2018! I'm such an idiot. Serves me right for not using `worklog.md` like I usually do.*_

Here's what I figured out back then:

# 2018-03-02 10:49:08 java issues and s3_website

## using `jenv`:

- brew install jenv
- mkdir -p ~/.jenv/versions

install jdk 8u162-macosx-x64.dmg

add that jdk to jenv:

`jenv add /Library/Java/JavaVirtualMachines/jdk1.8.0_162.jdk/Contents/Home`

## view all versions

`jenv versions`

> probably will list as oracle64-1.8.whatever

use global:

`jenv global oracle64-1.8.0.162`

- uninstall jdk9 via homebrew et al?

then `java -version` reports the right one, and `s3_website push` will work
