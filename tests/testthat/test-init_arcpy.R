test_that("arcgisbinding is loaded", {
  loaded_packages <- "arcgisbinding" %in% (.packages(all.available = TRUE))
  expect_equal(loaded_packages, TRUE)
})

test_that("arc.check_product() returns some license", {
  check_product <- arc.check_product()
  expect_identical(class(arc.check_product()), class(check_product))
})

#test_that("An environment path is specified", {})
