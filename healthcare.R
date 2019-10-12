library(cowplot)
library(ggplot2); theme_set(theme_cowplot())
library(tidyverse)
library(MASS)
library(countrycode)
library(ggrepel)
## remotes::install_github("rensa/ggflags") ## circles
## remotes::install_github("ellisp/ggflags") ## rectangles
have_flags <- require(ggflags)


hea2 <- (read_csv("data/healthcare.csv",comment="#")
    %>% mutate(cc=tolower(countrycode(country,"country.name","iso2c")))
)

print(gg1 <- ggplot(hea2, aes(healthexpenditure,lifeexpectancy,
                       label=country))
    + geom_point()
    + geom_text_repel(size=3,vjust=-1.5)
    + scale_x_continuous(limits=c(0,NA))  ## anchor at zero
    + labs(y="life expectancy (years)",
           x="health expenditure (PPP$)")
    ## + geom_smooth(span=1) ## loess with larger span (less wiggly)
    + geom_smooth(method="rlm",
                  formula=y~poly(x,2)  ## make it quadratic
                  )
    ## linear model
    ## + geom_smooth(method="lm",lty=2,colour="red")
)

log_model <- lm(log10(lifeexpectancy)~log10(healthexpenditure),
                data=hea2)
log_pred <- (broom::augment(log_model,
             newdata=data.frame(healthexpenditure=seq(min(hea2$healthexpenditure),6500,length=51)))
    %>% mutate(lwr=.fitted-2*.se.fit,upr=.fitted+2*.se.fit)
    %>% mutate_at(c(".fitted","lwr","upr"),~10^.)
    %>% rename(lifeexpectancy=".fitted")
)
if (have_flags) {
    print(gg2 <- ggplot(hea2,aes(healthexpenditure,lifeexpectancy))
        + theme(plot.background=element_rect(fill="ivory1"))
        + geom_line(data=log_pred,colour="lightblue",size=2)
        + geom_ribbon(data=log_pred,
                      aes(ymin=lwr,ymax=upr),fill="lightblue",
                      colour=NA,
                      alpha=0.3)
        + geom_text_repel(size=3,vjust=-1,segment.colour="gray",
                          aes(label=country))
        + geom_flag(aes(country=cc))
        + scale_x_continuous(limits=c(0,NA))  ## anchor at zero
        + labs(y="life expectancy (years)",
               x="health expenditure (PPP$)")
        + scale_y_continuous(breaks=c(74,76,78,80,82))
        )
    ggsave(gg2,file="health_flags.pdf")
}
