test_that("use", {
  if (!reticulate::py_available()) return()

  expect_silent(is_pip_installed())
})
