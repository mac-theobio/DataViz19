

## types of spatial data

* features: points, polygons, lines (and collections thereof); rasters
* continuous or categorical values *associated* with features

## transformations/summarization

e.g. 

* points to density fields (2D kernel density estimation)
* points to polygon values (square or hex binning)
* fields to polygons (contouring)
* point values to fields (interpolation; `akima`, ?)

## typical plots

* points on maps
* contour plots on maps
* **choropleth** maps (filled polygons)

## spatial data challenges

* projections (*datums*) (see Bivand et al) [xkcd maps]()
* shapefile formats
* geocoding

## spatial plotting challenges

* x,y coordinates used up
* linking?
* insets
* map decoration
* representing uncertainties: @correll_value-suppressing_2018, @maceachren_visualizing_2005, @koo_geovisualizing_2018
* not misrepresenting areas (e.g. cartograms: @perrier_topogram_2019, @hohle_cartograms_2016)

## primary packages

* `maps` (base-R maps, some basic spatial data sets)
* `ggmap` (maps in ggplot, including downloading data from google maps etc.)
* `leaflet` (map widget)


## to do

- update Bushby/Jovic examples
- link to https://r-spatial.github.io/sf/
- [Canada ridings animation](https://fishandwhistle.net/post/2019/canada-ridings-hex/); data etc. [here](https://github.com/paleolimbot/blogdown-site/tree/master/content/post/2019-10-21-ridings)
- `mapcan` package?
