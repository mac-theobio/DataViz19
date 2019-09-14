bananas <- read.csv("data/FAOSTAT_data_1-7-2018.csv")
library(cowplot)
library(ggplot2)
library(dplyr)
library(colorspace)
library(directlabels)
theme_set(theme_cowplot())

bananas2 <- (bananas
    %>% mutate(tval=Value/1000,
               ## reorder country levels by first value, in reverse order
               Country=reorder(Country,Value,FUN=function(x) -x[1]))
)

## a reasonable start
(g1 <- ggplot(bananas2,aes(Year,tval,colour=Country))
    + geom_line()
    + scale_colour_discrete_qualitative() ## better colours
    + scale_x_continuous(breaks=seq(1995,2005,by=2))
    + labs(y="Bananas (thousands of tonnes)")
)

## try log-scaling (too strong?)
g1 + scale_y_log10()

## nicely spaced, but what does it mean?
g1 + scale_y_sqrt()

## "magic" function - remove legend, pick an appropriate labeling method,
## guess the labeling variable
direct.label(g1)

(g1
    + geom_dl(method="last.bumpup",
              aes(label=Country))
    + theme(legend.position="none")
    + scale_x_continuous(lim=c(1995,2008),
                         breaks=seq(1995,2005,by=2))
    ## also see ?expand_limits
)

## with faceting
(g1
    + scale_x_continuous(breaks=c(1995,2000,2005))
    + facet_wrap(~Country)
    + theme(legend.position="none")
)

## various attempts to make the bad plot ...

library(rayshader)

(g2 <- ggplot(bananas2,aes(Year,Country,colour=tval))
    + geom_point()
)
plot_gg(g2)
library(plot3D)
with(bananas2,hist3D(unique(Year),as.numeric(unique(Country)),
                            matrix(tval,nrow=12)))

ghash <- "01c25068df145aa0b97f"
devtools::source_gist(ghash, filename = "barplot3d.R")
with(bananas2,
     barplot3d(matrix(tval,nrow=12)))
