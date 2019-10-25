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
	bash -cl "vmt README.md notes.md makestuff/rmdweb.mk"

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

## pages/intro.lect.html: intro.lect.rmd
## pages/intro.io.html: intro.lect.rmd

## pages/interactive.lect.html: interactive.lect.rmd
## pages/interactive.io.html: interactive.lect.rmd

pages/interactive_braindump.html: interactive_braindump.rmd

crosstalk.Rout: crosstalk.R

Sources += $(wildcard *.bib)
Sources += $(wildcard *.csv)

## Manual dependencies 
index.rwm: sched.csv vis.bib

## Push a page from outside the paradigm
## actually, pagepush might be better for this?

random.html.pagepush:

######################################################################
## Live R stuff

bananas.Rout: bananas.R

healthcare.Rout: healthcare.R
pred.Rout: pred.R

######################################################################

## JD dumb mark-up content
## Should this be deprecated? Moved?

-include makestuff/newtalk.def

## You may want to set a specific directory for images
## ln -s ~/Dropbox/talks images ##

Ignore += images

Sources += $(wildcard *.lect.txt)

## Scales lecture
scales.lect.draft.pdf: scales.lect.txt
scales.lect.handouts.pdf: scales.lect.txt
scales.lect.handouts.pdf.pagepush: scales.lect.txt

## Visualization lecture
explore.lect.draft.pdf: explore.lect.txt
explore.lect.handouts.pdf: explore.lect.txt
explore.lect.final.pdf: explore.lect.txt
explore.lect.handouts.pdf.pagepush: explore.lect.txt
## JD inference

## Inference lecture
Sources += infer.lect.txt
infer.lect.draft.pdf: infer.lect.txt
infer.lect.final.pdf: infer.lect.txt
infer.lect.handouts.pdf: infer.lect.txt

Source += infovis.rmd
infer.lect.handouts.pdf: infovis.rmd

Sources += copy.tex

## Keeping lecture stuff together, because I kind of want to move it out our else really move beyond it
Ignore += local.txt.format
-include makestuff/newtalk.mk
-include makestuff/texdeps.mk
-include makestuff/webpix.mk

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

## Much abused; I keep switching between L1 and L2
orchard.Rout: orchard.R

### explore

## Comment in and out
## %.R: ../17/lectures/%.R; $(copy)
## %.txt: ../17/lectures/%.R; $(copy)

Ignore += bikes.zip
bikes.zip:
	wget -O $@ https://archive.ics.uci.edu/ml/machine-learning-databases/00275/Bike-Sharing-Dataset.zip

Ignore += day.csv hour.csv 
hour.csv: bikes.zip
	unzip $< $@
	touch $@

bikes.Rout: hour.csv bike_weather.csv bikes.R
Sources += bike_weather.csv

bike_plots.Rout: bikes.Rout bike_plots.R

## Smoking data from http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets
## fev is in L/s, apparently
fev.csv: 
	wget -O $@ "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/FEV.csv"

smoke.Rout: fev.csv smoke.R

## Show the confounding
smoke_ques.Rout: smoke.Rout smoke_ques.R

## fev vs. age fits
smoke_plots.Rout: smoke.Rout smoke_plots.R

## Level plots (a mess)
smoke_levels.Rout: smoke.Rout smoke_levels.R

## pages/interactive_smoke.html: interactive_smoke.rmd

Ignore += *.tangle
interactive_smoke.tangle: interactive_smoke.rmd
	$(tangle_r)

## Badly named: smoke+plotly
## interactive.R.html: interactive.R
Ignore += *.R.html
%.R.html: %.Rout ;

tax_hover.Rout: tax_hover.R

googleVis.Rout: googleVis.R

## sunspots (banking)
sunspots.Rout: sunspots.R

## irises (multivariate, ggpairs?)
iris.Rout: iris.R
 
## infer
smoke_inference.Rout: smoke.Rout smoke_inference.R
uni.Rout: smoke.Rout uni.R
fake.Rout: fake.R
fake_plots.Rout: fake.Rout fake_plots.R

fake_multi.Rout: fake.Rout fake_multi.R

## dwplot scaling

dwscale.Rout: dwscale.R

## Violins with variable width
Ignore += violin_scales.pdf
violin_scales.pdf: scale_violins.Rout ;
scale_violins.Rout: scale_violins.R

-include makestuff/wrapR.mk

######################################################################

## Bolker 

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

# pages/principles.io.html: principles.lect.rmd
pages/%.io.html: %.lect.rmd; $(mdio_r)

iohack: principles.lect.rmd
	echo "rmarkdown::render('principles.lect.rmd', output_format='ioslides_presentation')" | R --slave
	mv -f principles.lect.html pages/principles.io2.html

clean:
	rm -f *.toc *.aux *.log *.snm *.out *.wrapR.r *.Rout-*.pdf *.nav *.bak *~ *.blg  .*.RData .*.Rlog *.Rout.pdf 

-include makestuff/rmdweb.mk
-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
