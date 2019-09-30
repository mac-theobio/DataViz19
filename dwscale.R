
library(broom)
library(dotwhisker)

bs <- 18

library(ggplot2)
theme_set(theme_bw(base_size=bs))

seed <- 2147
pts <- 10
xwid <- 10
ywid <- 3

z <- rnorm(pts)
x <- xwid*rnorm(pts)
y <- ywid*rnorm(pts)

xs <- x/sd(x)
ys <- y/sd(y)

xt <- xs/2
yt <- ys/2

## Bad version
print(dwplot(lm(z~x+y),by_2sd=FALSE))

print(dwplot(lm(z~x+y)))

print(dwplot(lm(z~xt+yt),by_2sd=FALSE))

print(dwplot(lm(z~xs+ys),by_2sd=FALSE))
