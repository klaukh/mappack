
#' Add local tiles to a leaflet map
#'
#' Adds local tiles provided by the \emph{mappack} package to a \code{leaflet} map.
#' '
#' @param map a map widget object created from \code{\link{leaflet}()}
#' '
#' @param layerId the layer id
#' @param group the name of the grou the newly created layers should belong to
#' @param options a list of extra options for tile layers, popups, paths
#'   (circles, rectangles, polygons, ...), or other map elements
#' @return the new \code{map} object
#' @seealso \code{\link{tileOptions}}, \code{\link{WMSTileOptions}},
#'   \code{\link{popupOptions}}, \code{\link{markerOptions}},
#'   \code{\link{pathOptions}}
#' @references The Leaflet API documentation:
#'   \url{http://leafletjs.com/reference.html}
#' @import leaflet shiny
#'
#' @export
addMappackTiles <- function(map, layerId = NULL, group = NULL,
                            options = leaflet::tileOptions()) {
  shiny::addResourcePath('mappack_tiles', system.file('map', package = 'mappack'))

  # test for a leaflet map
  if (is.null(map)) stop("addMappackTiles: no map provided... exiting")

  # directly set tileOptions for the provided tiles
  options$minZoom <- 0
  options$maxZoom <- 8
  options$tms <- TRUE

  map <- leaflet::addTiles(map
    , urlTemplate = "mappack_tiles/{z}/{x}/{y}.png"
    , attribution = "MapPack package, leveraging OpenStreetTiles, Natural Earth, and OpenStreetMap"
    , layerId = layerId
    , group = group
    , options = options)

  return(map)
}


#' Accessors to the tiles
#'
#' Use these objects to access the directories for the tiles
#' in the \code{mappack} package.
#'
#' @name tiles
#' @export
mappackTilesURL <- normalizePath(paste0(system.file("map", package = "mappack"),
                                        "/{z}/{x}/{y}.png"))

#' @rdname tiles
#' @export
mappackTilesDir <- normalizePath(system.file("map", package = "mappack"))

