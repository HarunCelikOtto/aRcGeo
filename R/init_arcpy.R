#' Initialize Connection to ArcGIS
#'
#' @export
#' @param python_env_path This is a string to the python executable path in the `arcpy` environment.
#' @param conda_env This is a string of the conda environment name for the `arcpy` environment.
#' @return The path or environment selected for arcpy and a description of your ArcGIS product using arcgisbinding::arc.check_product().
#' @examples
#' \dontrun{
#' init_arcpy(python_env_path = "C:/ESRI/conda/envs/{conda environment name}/python.exe")
#' init_arcpy(conda_env_path = "{conda environment name}")
#' # product: ArcGIS Pro (13.1.0.41833)
#' # license: Advanced
#' # version: 1.0.1.300
#' }
#' @importFrom arcgisbinding arc.check_product
#' @importFrom reticulate use_python
#' @importFrom reticulate use_condaenv
#' @importFrom reticulate import

init_arcpy <- function(python_env_path = NULL, conda_env = NULL) {
  arc.check_product()
  arcpy <- NULL

  if (!is.null(python_env_path)) {
    message(sprintf("Using python path: %s", python_env_path))
    message("Importing `arcpy`...")
    use_python(python_env_path)
    arcpy <<- import("arcpy", delay_load = TRUE)
    message("`arcpy` is imported")
  }
  else if (!is.null(conda_env)) {
    message(sprintf("Using conda environment: %s", conda_env))
    message("Importing `arcpy`...")
    use_condaenv(conda_env)
    arcpy <<- import("arcpy", delay_load = TRUE)
    message("`arcpy` is imported")
  }
  else {
    warning("No path has been specified, connection has not been initialized.")
  }

  return(arc.check_product())
}
