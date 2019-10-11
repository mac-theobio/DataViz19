library(sjPlot)
library(emmeans)
library(effects)
library(ggplot2); theme_set(theme_bw())
library(dplyr)

## Base with some obscure hack ("terms") for centering
base <- ggplot(fake, aes(x, y)) + geom_point(alpha=0.5)
pointPred <- as_data_frame(predict(uni, interval="confidence"))
termPred <- predict(uni, interval="confidence", type="terms")
print(pp <- base
	+ geom_line(aes(y=pointPred$fit))
	+ geom_line(aes(y=pointPred$lwr), lty=2)
	+ geom_line(aes(y=pointPred$upr), lty=2)
	+ geom_line(aes(y=termPred$lwr+mean(y)), lty=2)
	+ geom_line(aes(y=termPred$upr+mean(y)), lty=2)
)

## effects
uniEffects <- allEffects(uni)
plot(uniEffects)
print(uniEffects)

## emmeans
uniMeans <- emmeans(uni, ~x, at=list(x=0:7))
print(uniMeans)

## sjPlot
plot_model(uni, type="pred")
