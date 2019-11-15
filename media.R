library(igraph)

## Put Data directory from http://www.kateto.net/wordpress/wp-content/uploads/2019/06/sunbelt2019.zip here as sunbelt
ntmp <- read.csv("sunbelt/Dataset1-Media-Example-NODES.csv", header=TRUE, as.is=TRUE)
ltmp <- read.csv("sunbelt/Dataset1-Media-Example-EDGES.csv", header=TRUE, as.is=TRUE)

medialinks <- graph_from_data_frame(d=ltmp, vertices=ntmp, directed=TRUE) 

## rdsave(medialinks)
