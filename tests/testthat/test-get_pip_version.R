test_that("use", {
  if (!reticulate::py_available()) return()

  version <- get_pip_version()
  expect_equal(1, length(version))
  expect_equal("character", class(version))

})
