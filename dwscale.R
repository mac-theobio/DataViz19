
seed <- 2147
pts <- 10
xwid <- 10
ywid <- 3

z <- rnorm(pts)
x <- xwid*rnorm(pts)
y <- ywid*rnorm(pts)

summary(std)
summary(stdsmoke)

print(dwplot(lm(z~x+y))

print(dwplot(lm(z~x+y,by_2sd=FALSE)))

