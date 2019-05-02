# issues with s3_website on 2019-05-01

per https://github.com/laurilehmijoki/s3_website/issues/323


---
As a workaround, if I manually invoke the JAR file, it works:

	bundle exec s3_website install
	java -cp $(bundle show s3_website)/*.jar s3.website.Push

If I pass the same RUBYLIB environment variable that bundle uses internally, it fails: (T
his seems to support my theory that s3_website's JRuby is having problems because it's inheriting Ruby 2.5 or 2.6 settings from Bundler.)

	RUBYLIB=/usr/local/lib/ruby/2.5.0 java -cp $(bundle show s3_website)/*.jar s3.website.Push

--- 
