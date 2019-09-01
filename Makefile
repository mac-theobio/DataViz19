## This is XXX, a screens project directory
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

## Flow

## Use `make pull` to pull from both branches

pullup pull: pull_pages
pull_pages:
	cd pages && make pull

######################################################################

# Content

## Sources += README.md notes.md
Sources += $(wildcard *.md)

Makefile: pages

vim_session:
	bash -cl "vm README.md notes.md"

######################################################################

## Trying to develop a pipeline 2019 Sep 01 (Sun)

webSources += $(wildcard *.mkd *.rmd *.Rmd)

######################################################################

Sources += $(webSources)

######################################################################

### Resources

pardirs += QMEE qpages

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
