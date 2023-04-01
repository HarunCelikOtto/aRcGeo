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
#' @importFrom reticulate use_python use_condaenv import conda_list
#' @importFrom cli cli_h1 cli_alert cli_alert_success cli_alert_info cli_abort
#' cli_progress_bar cli_progress_update cli_progress_message

init_arcpy <- function(python_env_path = NULL, conda_env = NULL) {
  options(cli.palette = "dichro")
  cli_h1("Initializing Connection")
  cli_alert("Initializing Connection to ArcGIS.")
  # initialize a connection to ArcGIS
  arc.check_product()
  arcpy <- NULL

  # If a python path is given, use python executable for reticulate.
  if (!is.null(python_env_path) && is.null(conda_env)) {
    cli_h1("Checking Python Path")
    if (!is.character(python_env_path)) {
      cli_abort("Python path must be a character.")
      stop()
    }
    # Make sure that the python.exe file specified exists.
    if (!file.exists(python_env_path)) {
      cli_abort("Your path to the python.exe file is incorrect.
              Make sure that the supplied directory is correctly formatted.")
    }

    # Message Updates.
    cli_alert_success(sprintf("Using python path: %s", python_env_path))
    connecting <- function() {
      cli_progress_bar("Connecting to `arcpy`.", total = 100)
      for (i in 1:100) {
        Sys.sleep(3/100)
        cli_progress_update()
      }
    }
    connecting()

    cli_alert("Loading module.")
    # Give reticulate the python.exe path.
    use_python(python_env_path)

    # Import the arcpy module as a global variable.
    arcpy <<- import("arcpy", delay_load = TRUE)
    cli_alert_success("An `arcpy` module successfully imported.")
  }
  #If a conda environment name is given, use conda environment for reticulate.
  else if (!is.null(conda_env) && is.null(python_env_path)) {
    cli_h1("Checking Conda Environment")

    if (!is.character(conda_env)) {
      cli_abort("Conda environment name must be a character")
      stop()
    }

    # Make sure that the conda environment specified exists.
    cli_progress_message("Setting Conda Environments.")
    all_condas <- conda_list()
    cli_alert_info("All Local Conda Environments:")
    print(all_condas$name)

    `%nin%` <- Negate(`%in%`)

    if (conda_env %nin% all_condas$name) {
      cli_abort("The specified conda environment name is not recognized under reticulate::conda_list().")
      stop()
    }

    # Message updates
    cli_alert_success(sprintf("Using conda environment: %s", conda_env))
    connecting <- function() {
      cli_progress_bar("Connecting to `arcpy`.", total = 100)
      for (i in 1:100) {
        Sys.sleep(5/100)
        cli_progress_update()
      }
    }
    connecting()

    # Give reticulate the conda environment.
    use_condaenv(conda_env)

    # Import the arcpy module as a global variable.
    arcpy <<- import("arcpy", delay_load = TRUE)
    cli_alert_success("An `arcpy` module successfully imported.")
  }

  # When both arguments are specified
  else if (!is.null(conda_env) && !is.null(python_env_path)) {
    cli_abort("Specify either python_env_path or conda_env, not both.")
    stop()
  }
  # If no argument is provided, send a warning.
  else {
    cli_abort("No python.exe path or conda environment name has been specified, connection can not be initialized.")
    stop()
  }

  # # Make sure that arcpy is not an empty module (currently useless since errors are already handled by python's ModuleNotFoundError)
  # cli_h1("Checking Arcpy Module")
  # cli_progress_message("Checking that The correct arcpy module is selected.")
  # if (test_that("Check that arcpy is a module", {expect_type(arcpy, type = "environment")}) == TRUE) {
  # } else {
  #   cli_bort("imported arcpy is not recognized as a module")
  #   stop()
  # }

  cli_alert_info("ArcGIS Product Details:")
  return(arc.check_product())
}
