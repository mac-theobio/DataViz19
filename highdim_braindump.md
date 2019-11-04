# machinery

- packages (installation)
- `tourr`, `clusterfly`, `rggobi`, `RnavGraph` (archived), `Mondrian`, `qtlcharts`, `gWidgets`, `rpanel`, `rcharts`, `Acinonyx`, `gridSVG` `loon`, ... ?
- `loon`, `loon.data`,  `RDRToolbox`
- high-dimensional/simplex stuff: `geozoo`
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("RDRToolbox")
- Mu and Ruoyan/Monica from last year: `hdInstall.html`
    - Java issues
	- `RnavGraph` has a dependency on `graph`
	- X11/XQuartz updates?
	- `rggobi` installation

# ideas

- dimension reduction
    - clustering
	- projection (PCA, NMF, etc.): `gg*` versions? https://github.com/fawda123/ggord, https://github.com/kassambara/factoextra, ... ?
	- `loon` demos?
- projection
- dynamic visualization (tours etc.)
- interactive pairs/scatterplots etc.
    - correlations
	- pairs plots
	- parallel coordinates plots
	- usual strategies (facets + aesthetics + ...)

# challenges

- categorical/compositional data
- many-to-one ("multiple") or many-to-many ("multivariate")?
