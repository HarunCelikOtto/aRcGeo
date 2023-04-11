# ------------------------------------------------------------------------------
## Area for function return testing

test_that("Specified conda_env exists", {
  skip_on_ci()
  all_condas <- conda_list()
  all_condas_name <- all_condas$name
  first_conda_env_test <- all_condas_name[1]

  expect_no_error(init_arcpy(conda_env = first_conda_env_test))
})

test_that("Specified python file path exists", {
  skip_on_ci()
  expect_error(init_arcpy(python_env_path = "random\\path\\python.exe"))
})

test_that("Correct python path successfully executes", {
  skip_on_ci()
  all_pythons <- conda_list()
  all_pythons_paths <- all_pythons$python
  first_python_path_test <- all_pythons_paths[1]

  expect_no_error(init_arcpy(python_env_path = first_python_path_test))
})

test_that("Either a python_env_path or conda_env is specified", {
  skip_on_ci()
  expect_error(init_arcpy(conda_env = "hi", python_env_path = "hello there"))
})

test_that("Both conda_env and python_env_path have to be characters", {
  skip_on_ci()
  expect_error(init_arcpy(python_env_path = 2))
  expect_error(init_arcpy(conda_env = 1))
})

test_that("If no argument is provided, an error occurs", {
  skip_on_ci()
  expect_error(init_arcpy())
})

# ------------------------------------------------------------------------------
## Area for cli testing

# That progress bars work.

# That messages, aborts and alerts work.
