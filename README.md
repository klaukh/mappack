# mappack
An R package to provide local tiles for leaflet maps

`mappack` provides an example on how to serve local tiles for `leaflet` maps as part of a package. This package will not be provided on CRAN, nor do I believe it would be accepted on CRAN, due to the large number of files contained inside the package itself. 

However, if compiled and served via a local `R` package repository, then the concept provides a powerful way to have a commonly accessible set of local tiles to provide to the local user base.

The tiles themselves are housed in the `inst/` folder, and requires an active `shiny` session to serve them... either through a `shiny` app or gadget (e.g., `mapview` or `mapedit` packages).
