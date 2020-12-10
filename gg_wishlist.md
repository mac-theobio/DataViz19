

- a `stat` based on binning binary responses to get values and ... 
- a `stat` going from (m,n) pairs (binomial outcomes) to confidence intervals based on score (`prop.test`) or Clopper-Wilson (`binom.test`) outcomes

## `ggmap` -> `leaflet`

- the symbolic or 'grammar of graphics' component of `leaflet` is much more limited than that of `ggmap`: the user can specify aesthetics symbolically (e.g. `color=~var1`, but these are not (AFAICT) *mappings* (scales have to be chosen/constructed manually), and there's no equivalent to the `ggplot` set of transformations (e.g. `stat_density_2d`). We should be able to use `ggplot_build` to extract transformed layers ...
- examples that exist for drawing heatmaps from densities (e.g. Charpentier John-Snow example, Bushby/Jovics crime example) rely on overlapping polygons (with transparency). Should be able to do better with nested polygons?
- there are transformations for going from a distribution of unweighted x, y points to densities or binned values (`stat_binhex`, `stat_bin2d`, `stat_density2d`) but as far as I know there are not good transformations from *weighted* x, y positions to densities or binned values. Interpolation via `akima`, `mgcv::gam`, or via kriging (Gaussian processes?) would be useful

## `ggraph` -> dynamic networks

- is there a way to translate ggraph graphics to dynamic visualizations?
