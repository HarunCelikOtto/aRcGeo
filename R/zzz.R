.onAttach <- function(libname, pkgname) {
  packageStartupMessage("The functions in this library require the user to have `arcgisbinding` loaded.
                      Please load `library(arcgisbinding)` before running any aRcGeo functions.")
}

