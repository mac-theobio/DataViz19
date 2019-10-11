library(cowplot)
library(ggplot2); theme_set(theme_cowplot())
library(tidyverse)
library(MASS)

#2006 data, except Turkey, where healthexpenditure is 2005
hea = structure(list(healthexpenditure = c(3167L, 3608L, 3356L, 3696L, 1535L, 3357L, 2709L, 3423L, 3464L, 2547L, 1457L, 3207L, 3001L, 2673L, 2581L, 1491L, 4162L, 777L, 3611L, 2398L, 4507L, 920L, 2150L, 1322L, 2466L, 3124L, 4165L, 618L, 2885L, 6933L), lifeexpectancy= c(81.1, 79.9, 79.5, 80.7, 76.7, 78.4, 79.5, 80.7, 79.8, 79.6, 73.2, 81.2, 79.8, 81.4, 82.4, 79.1, 79.4, 74.8, 79.8, 80.1, 80.5, 75.3, 78.9, 74.3, 81.1, 80.8, 81.7, 73.2, 79.5, 78.1)), .Names = c("healthexpenditure", "lifeexpectancy"), class = "data.frame", row.names = c("Australia", "Austria", "Belgium", "Canada", "Czech Republic", "Denmark", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Japan", "Korea", "Luxembourg", "Mexico", "Netherlands", "New Zealand", "Norway", "Poland", "Portugal", "Slovak Republic", "Spain", "Sweden", "Switzerland", "Turkey", "United Kingdom", "United States"))


hea2 <- (hea
    %>% rownames_to_column("country")
)
print(ggplot(hea2, aes(healthexpenditure,lifeexpectancy,label=country))
    + geom_text()
    + geom_smooth(method="rlm")
    + geom_smooth(method="lm",lty=2,colour="red")
)
