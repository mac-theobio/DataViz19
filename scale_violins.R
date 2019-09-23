library(readr)
library(dplyr)
library(ggplot2)
library(cowplot);  theme_set(theme_cowplot())

input_files <- c("hour.csv","bike_weather.csv")
bike_weather <- read_csv(input_files[[2]])

bikes <- (read_csv(input_files[[1]])
	%>% left_join(bike_weather)
	%>% rename(rentals=cnt)
   %>% mutate(weather=reorder(weather,weathersit))
)

g0 <- ggplot(bikes,aes(weather,rentals))
plot_grid(
    g0+geom_violin(fill="gray")+labs(title="scale='area'"),
    g0+geom_violin(fill="gray",scale="count")+labs(title="scale='count'"),
    g0+geom_violin(fill="gray",scale="width")+labs(title="scale='width'"),
    nrow=1)
    
