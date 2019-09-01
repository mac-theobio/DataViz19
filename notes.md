This is for JD and BB to communicate about how this page works and how it should work

# Links

Dumping, will clean later

* https://github.com/mac-theobio/DataViz
* https://bbolker.github.io/stat744/
* https://bbolker.github.io/stat744/outline.html
* https://mac-theobio.github.io/QMEE/index.html

# Appearance

I've spent way too much time on this, for reasons that are psychologically obscure

## css

There are a bunch of css files under styles, and there's a make rule that's meant to control which one is actually pushed to the pages. We can play with it some time (or you can play without me, but I'm no longer allowed to play without you).

## header and footer

These are also files which seem reasonably easy to look at. Right now (Sun aft.) they are still 744 files because I had some lightweight ones.

# Instructions

## Set up

.. #not_tested

## Start working

```make pullall``` #not_tested

# todo: something, $#@!

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
* pages/*.html (automatically when .rmk can be made?)
* pages/*.ioslides.html (when requested and/or marked by Makefile?)
