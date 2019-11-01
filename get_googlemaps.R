## can't use R CMD BATCH --vanilla, it ignores .Renviron
library(ggmap)
register_google(key=Sys.getenv("GOOGLEMAPS_KEY"))
hamilton_map <- get_googlemap(center=c(lon=-79.91, lat=43.26),
                       zoom=13, size=c(640,640),
                       scale=2,maptype='terrain')
mcmaster_map <- get_googlemap(center=c(lon=-79.9192, lat=43.2609),
                             zoom=15, maptype = 'satellite')
fireball_map <- get_googlemap(center=c(lon=-79.92, lat=43.2609), zoom=19, maptype = 'satellite')
london_map <- get_googlemap("london england", zoom = 12)
nyny_map <- get_googlemap("newyork newyork", zoom = 12)
to1_map <- get_googlemap('toronto canada', zoom=12,maptype='satellite')
## certain zooms work: zoom=12 does, 13 doesn't, 14 doesn't, 15 does
to2_map <- get_googlemap('toronto canada', zoom=15, maptype='hybrid')
houston_map <- get_googlemap('houston texas', zoom=15, maptype='roadmap')
save(list=ls(pattern="_map"),file="data/googlemaps.rda")
