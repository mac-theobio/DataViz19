## "you can make almost any plot in R": https://simplystatistics.org/2019/08/28/you-can-replicate-almost-any-plot-with-ggplot2/
## remotes::install_github("rensa/ggflags")
## see also: ellisp/ggflags [rectangles instead of circles??]
library(ggflags)
library(countrycode)
library(emojifont)
## remotes::install_github("hrbrmstr/waffle")
library(waffle)
data.frame(
       parts = factor(rep(month.abb[1:3], 3), levels=month.abb[1:3]),
       vals = c(10, 20, 30, 6, 14, 40, 30, 20, 10),
       fct = c(rep("Thing 1", 3), rep("Thing 2", 3), rep("Thing 3", 3))
     ) -> xdf
     
     ggplot(xdf, aes(fill = parts, values = vals)) +
       geom_waffle() +
       facet_wrap(~fct)


## symbol-bars: replace tiles in a waffle plot with symbols?
##  re-use code from plotrix::symbolbox ?

library(plotrix)
## product plots

