library(igraph)
library(ggraph)
theme_set(theme_bw())

base <- ggraph(medialinks, layout="fr")

print(base
	+ geom_edge_link()
	+ ggtitle("Edges only") 
) 

print(base
	+ geom_edge_link()
	+ geom_node_point()
	+ geom_node_text(aes(label=media))
	+ ggtitle("Edges only")  # add title to the plot
) 
