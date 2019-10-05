library(dotwhisker)

pts <- 23
set.seed(23)

x <- rnorm(pts)
y <- rlnorm(pts)
z <- rlnorm(pts)

m <- lm(z~x+y)

dwplot(m, show_intercept=TRUE, vline=geom_vline(xintercept=0, lty=2))
