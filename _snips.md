# quickies

  rake serve:dev      # serve local with drafts
  rake serve:prod     # serve local without drafts, production only
  rake build && rake build:prod,dev,drafts
  rake push && rake push:aws3   # shove _site/ contents to my s3 bucket

# terminal styled code syntax frag

> A fun use case for this is styling code blocks to look like terminal windows. Simply use terminal as the language/lexer like so:

    ```terminal
    
    ```

And then use css to style it up. see https://mademistakes.com/til/styling-language-specific-code-blocks/

## adding javascript stuff

> To modify or add your own scripts include them in [`assets/js/_main.js`](https://github.com/mmistakes/minimal-mistakes/blob/master/assets/js/_main.js) and then rebuild using `npm run build:js`. See below for more details.
> 
> If you add additional scripts to `assets/js/plugins/` and would like them concatenated with the others, be sure to update the `uglify` script in [`package.json`](https://github.com/mmistakes/minimal-mistakes/blob/master/package.json). Same goes for scripts that you remove.

## lychee notes
### from: https://tobrunet.ch/articles/jekyll-meets-lychee-a-liquid-tag-plugin/

> Now you can use the newly available tag on your blog:

{% lychee_album <album_id> %}

Replace <album_id> with the ID of the album to be displayed (Hint: look at the URL when opening an album in Lychee). To see a working example, just have a look at my personal website: Berlin - September 2013

Protip for the So Simple Theme

Place the Liquid Tag between a figure HTML tag:

<figure class="third">
{% lychee_album 1 %}
</figure>
And add the following JavaScript snippet to assets/js/_main.js (don’t forget to run grunt after that)

$(document).ready(function() {
  $('.third').magnificPopup({
    delegate: 'a',
    type: 'image',
    tLoading: 'Loading image #%curr%...',
    mainClass: 'mfp-img-mobile',
    gallery: {
      enabled: true,
      navigateByImgClick: true,
      preload: [0,1] // Will preload 0 - before current, and 1 after the current image
    },
    image: {
      tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
      titleSrc: function(item) {
        return item.el.attr('title') + '<small>by my name here</small>';
      }
    }
  });
});

## include a Table of Contents (TOC)

{% include toc %}

### Notices

/**
 * Default Kramdown usage (no indents!):
 * <div class="notice" markdown="1">
 * #### Headline for the Notice
 * Text for the notice
 * </div>
 */

### Link Collection

Collection is `_linkdump`.

Suggested YAML frontmatter

	2016-07-01-linkdump-$title
	---
	collection: linkdump
	title: $TITLE-of-Item
	category: linkdump
	tags: {link, $tag}
	uri: $URL
	description: $description
	---

%% content and commentary
