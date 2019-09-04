## This is public, a screens project directory under DataViz
## makestuff/project.Makefile

## https://mac-theobio.github.io/DataViz
## https://github.com/mac-theobio/DataViz/tree/gh-pages
## https://github.com/mac-theobio/DataViz/

current: target
-include target.mk

######################################################################

# Overview

## Sources += README.md notes.md
Sources += $(wildcard *.md)

Makefile: makestuff/Makefile pages
pages: makestuff/Makefile

vim_session:
	bash -cl "vm README.md notes.md makestuff/rmdweb.mk"

######################################################################

## Trying to develop a pipeline 2019 Sep 01 (Sun)

## Appearance
Sources += main.header.html main.footer.html $(wildcard styles/*.css)
Ignore += main.css
main.css: styles/pandoc.css Makefile
	$(copy)

## Content

## pages/index.html: index.mkd

Sources += $(wildcard *.bib)
Sources += $(wildcard *.csv)

## sched.rwm: sched.csv vis.bib sched.rmd

## Force-push a random page

## random.html.direct: 
Sources += random.html

######################################################################

### Resources

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
