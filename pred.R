library(tidyverse)
library(lme4)
library(sjPlot)
library(emmeans)
library(effects)

data(Contraception,package="mlmRev")
Contraception <- Contraception %>%
    mutate(ch=factor(livch != 0, labels = c("N", "Y")))
m3 <- glmer(use ~ age * ch + I(age^2) + urban + (1 | urban:district),
            data=Contraception, family=binomial)

## effects
plot(allEffects(m3),partial.residual=TRUE)
plot(Effect("age",m3),partial.residuals=TRUE)
plot(predictorEffects(m3,partial.residuals=TRUE),
     partial.residuals=list(pch=".",col="black"))
dd <- as.data.frame(allEffects(m3,xlevels=list(age=seq(-10,20,length=51))))
ggplot(dd[["age:ch"]],aes(age,fit))+
    geom_line()+
    facet_wrap(~ch)+
    geom_ribbon(aes(ymin=lower,ymax=upper),colour=NA,alpha=0.2)+
    scale_y_continuous(trans=scales::logit_trans(),
                       breaks=c(0.01,0.05,0.1,0.2,0.4,0.6))+
    labs(x="centred age",y="probability of contraception use")

## sjPlot
pp <- plot_model(m3,type="pred",terms="age[all]")

print(pp)
