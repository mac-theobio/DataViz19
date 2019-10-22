suppressPackageStartupMessages(library(googleVis))
plot(gvisMotionChart(Fruits, "Fruit", "Year", options = list(width = 600, height = 400)))
