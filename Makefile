## This is public, a screens project directory under DataViz
## makestuff/project.Makefile

## https://mac-theobio.github.io/DataViz
## https://github.com/mac-theobio/DataViz/tree/gh-pages

current: target
-include target.mk

######################################################################

# Overview

## Sources += README.md notes.md
Sources += $(wildcard *.md)
Sources += $(wildcard *.rmd)

Makefile: makestuff/Makefile pages

vim_session:
	bash -cl "vm README.md notes.md makestuff/rmdweb.mk"

######################################################################

## Flow targets

# pull_all:
# local_index: for a quick and dirty view
# push_all:

######################################################################

## Trying to develop a pipeline 2019 Sep 01 (Sun)

## Appearance
Sources += main.header.html main.footer.html $(wildcard styles/*.css)
Ignore += main.css
main.css: styles/pandoc.css Makefile
	$(copy)

## Content

## pages/index.html: index.rmd
## pages/intro.lect.html: intro.lect.rmd
## pages/intro.io.html: intro.lect.rmd

Sources += $(wildcard *.bib)
Sources += $(wildcard *.csv)

## sched.rwm: sched.csv vis.bib sched.rmd

## Force-push a random page

## random.html.direct: 
Sources += random.html

######################################################################

## JD dumb mark-up content
## Should this be deprecated? Moved?

Sources += $(wildcard *.lect)

######################################################################

### Resource directories

pardirs += QMEE 744

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
## Makefile: makestuff/Makefile ## a repeat 
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/rmdweb.mk
-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
