library(tidyverse)
library(ggalt)
dd <- (read_csv("data/data-fHPJK.csv")
    %>% mutate(category=rep(c("overall","sex","age","ethnicity"),
                            times=c(1,2,3,6)),
               category=factor(category,levels=unique(category)))
    %>% rename(pct="Percent of adults with AMI")
    %>% group_by(category)
    %>% arrange(category,desc(pct))
    %>% ungroup()
    %>% mutate(Group=factor(Group,levels=rev(Group)))
)
library(ggplot2); theme_set(theme_classic())
ggplot(dd,aes(colour=category,x=Group,y=pct))+
    scale_x_discrete(breaks=rev(levels(dd$Group))) +
    geom_lollipop(size=5) + coord_flip() +
    theme(legend.position="none") +
    labs(x="",y="Percent of adults with AMI")+
    scale_colour_brewer(palette="Dark2")
