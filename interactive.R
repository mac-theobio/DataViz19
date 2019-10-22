library(ggplot2); theme_set(theme_bw(base_size=18))
library(plotly)
library(htmlwidgets)
library(readr)
library(dplyr)

smoke <- read_csv("fev.csv") %>% rename(smoking=smoke)
summary(smoke)

af <- (ggplot(smoke, aes(x=age, y=fev))
	+ ylab("Lung capacity")
	+ geom_point() 
)

## id, height, smoking

## Dushoff craziness
htmlname <- paste0(rtargetname, ".html")
saveWidget(as.widget(ggplotly(
	af
)), htmlname)
