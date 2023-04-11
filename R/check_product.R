#' Local arcgisbinding::arc.check_product() function.
#'
#' @export
#' @description
#' This is a copy of the arcgisbinding::arc.check_product() function created
#' to avoid errors in R CMD Check's on GitHub. Since arcgisbinding is a windows
#' binary package, the R CMD Check resolver fails in loading the package.
#'
#' @return The output of arcgisbinding::arc.check_product()

check_product <- function() {
  arcgisbinding::arc.check_product()
}

