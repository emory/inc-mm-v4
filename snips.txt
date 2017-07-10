# quickies

  rake serve:dev      # serve local with drafts
  rake serve:prod     # serve local without drafts, production only
  rake build && rake build:prod,dev,drafts
  rake push && rake push:aws3   # shove _site/ contents to my s3 bucket


### include a Table of Contents (TOC)

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
