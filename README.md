## mappack
An R package to provide local tiles for leaflet maps

`mappack` provides an example on how to serve local tiles for `leaflet` maps as part of a package. Most likely this package will not be provided on CRAN, nor do I believe it would be accepted on CRAN, due to the large number of files contained inside the package itself (although I've reduced the number of tiles in the example that might allow it to pass muster with CRAN... maybe more to come.)

Regardless, if compiled and served via a local `R` package repository, then the concept provides a powerful way to have a commonly accessible set of local tiles to provide to the local user base.

The tiles themselves are housed in the `inst/` folder when uncompiled, and requires an active `shiny` session to serve them... either through a `shiny` app or gadget (e.g., `mapview` or `mapedit` packages). The tiles folder is added to the Shiny app / gadget through `addResourcePath("map", system.file("map", package = "mappack"))` and then the `urlTemplate` argument in `leaflet::addTiles()` becomes `map/{z}/{y}/{z}.png`. `mappack` combines these into the `addMappackTiles()` function.

```r
library(leaflet)
library(mappack)

# run only in a Shiny app or gadget
leaflet() %>%
  addMappackTiles(layerId = "mappack", group = "mygroup")

```

