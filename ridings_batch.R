library(tidyverse)
library(sf)
library(geogrid)
fn <- "data/ridings_hex2.rds"
ridings <- (read_sf("data/boundaries_2015_shp_en/FED_CA_2_2_ENG.shp")
  %>% st_simplify(dTolerance = 100)
)
ridings_grid <- ridings %>%
    calculate_grid(grid_type = "hexagonal", seed = 1938)
## slow!
ridings_hex <- assign_polygons(ridings, ridings_grid)
write_rds(ridings_hex, fn)
