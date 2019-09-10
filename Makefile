## This is public, a screens project directory under DataViz
## makestuff/project.Makefile

## https://mac-theobio.github.io/DataViz
## https://github.com/mac-theobio/DataViz/tree/gh-pages

current: target
-include target.mk

-include makestuff/perl.def

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

## Manual dependencies 
intro.rwm: sched.csv vis.bib sched.rmd

## Push a page from outside the paradigm
## actually, pagepush might be better for this?

random.html.pagepush:

######################################################################

## JD dumb mark-up content
## Should this be deprecated? Moved?

-include makestuff/newtalk.def

Sources += $(wildcard *.lect.txt)

scales.lect.draft.pdf: scales.lect.txt
scales.lect.handouts.pdf: scales.lect.txt
scales.lect.final.pdf: scales.lect.txt
scales.lect.handouts.pdf.pagepush: scales.lect.txt

Sources += copy.tex

Ignore += local.txt.format
-include makestuff/newtalk.mk
-include makestuff/texdeps.mk

######################################################################

## R stuff (see above)

Sources += $(wildcard *.R)

Ignore += temps.csv
temps.csv:
	wget -O $@ https://datahub.io/core/global-temp/r/annual.csv

temps.Rout: temps.csv temps.R
temppix.Rout: temps.Rout temppix.R

Sources += circulation.csv
circulation.Rout: circulation.csv circulation.R

Sources += ClevelandHierarchyR.png steel_production.png


-include makestuff/wrapR.mk


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

clean:
	rm -f *.toc *.aux *.log *.snm *.out *.wrapR.r *.Rout-*.pdf *.nav *.bak *~ *.blg  .*.RData .*.Rlog *.Rout.pdf 

-include makestuff/rmdweb.mk
-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
