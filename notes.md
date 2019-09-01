This is for JD and BB to communicate about how this page works and how it should work

# Links

Dumping, will clean later

* https://github.com/mac-theobio/DataViz
* https://bbolker.github.io/stat744/
* https://bbolker.github.io/stat744/outline.html
* https://mac-theobio.github.io/QMEE/index.html

# Instructions

## Start working

```make pullall``` #not_implemented

## Add a page

## Change a page

## Finish working

# Architecture notes

.md should _never_ be involved in the web pathway, that's for pages like this one

I'm thinking:

* .rmd and .Rmd are synonyms with the obvious meaning
* .mkd for simple markdown (e.g., index.mkd)
* .rwm for "raw" markdown (converted by rstudio (??)) that we don't like yet (the yaml problem that I always talk about but never document); these are intermediate files that we should try to ignore
* .rmk for patched, converted markdown; this then becomes a synonym for .mkd

