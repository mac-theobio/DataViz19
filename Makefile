## This is public, a screens project directory under DataViz
## makestuff/project.Makefile

## https://mac-theobio.github.io/DataViz
## https://github.com/mac-theobio/DataViz/tree/gh-pages
## https://github.com/mac-theobio/DataViz/

current: target
-include target.mk
-include makestuff/rmdweb.def

######################################################################

## Flow

## Use `make pull` to pull from both branches

pullup pull: pull_pages
pull_pages:
	-cd pages && git commit -am "pullsync"
	-cd pages && git pull

######################################################################

# Overview

## Sources += README.md notes.md
Sources += $(wildcard *.md)

Makefile: pages

vim_session:
	bash -cl "vm README.md notes.md makestuff/rmdweb.mk"

######################################################################

## Trying to develop a pipeline 2019 Sep 01 (Sun)

## Appearance
Sources += main.header.html main.footer.html $(wildcard styles/*.css)
Ignore += main.css
main.css: styles/experiment.css Makefile
	$(copy)

## Content

## pages/index.html: index.mkd

Sources += $(wildcard *.bib)
Sources += $(wildcard *.csv)

## sched.rwm: sched.csv vis.bib sched.rmd

######################################################################

### Resources

pardirs += QMEE 744

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/rmdweb.mk
-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
