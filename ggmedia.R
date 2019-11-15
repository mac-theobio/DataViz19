library(igraph)
library(ggraph)
theme_set(theme_bw())

layout <- ggraph(medialinks, layout="fr")

print(layout
	+ geom_edge_link()
	+ geom_node_point()
	+ geom_node_text(aes(label=media))
) 

## from,to,type,weight
## id,media,media.type,type.label,audience.size
