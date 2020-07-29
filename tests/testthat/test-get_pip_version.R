test_that("use", {
  if (!is_pip_installed()) return()

  version <- get_pip_version()
  expect_equal(1, length(version))
  expect_equal("character", class(version))

})
