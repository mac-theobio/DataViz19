library(ggplot2); theme_set(theme_bw(base_size=18))
library(plotly)
library(htmlwidgets)
library(readr)
library(dplyr)

smoke <- read_csv("fev.csv") %>% rename(smoking=smoke)
summary(smoke)

af <- (ggplot(smoke, aes(label1=id, label2=height))
	+ ylab("Lung capacity")
	+ geom_point(aes(x=age, y=fev)) 
)

an <- (ggplot(smoke, aes(label1=id, label2=height, frame=age))
	+ ylab("Lung capacity")
	+ geom_point(aes(x=height, y=fev)) 
)

ggp <- (ggplotly(an, height = 900, width = 900)
	%>% animation_opts(
		## frame = 100
		## , easing = "linear", redraw = FALSE
	)
)

htmlname <- paste0(rtargetname, ".R.html")
saveWidget(as.widget(ggp), htmlname)

quit()

## id, height, smoking

## Dushoff craziness
saveWidget(as.widget(ggplotly(
	af
)), htmlname)
