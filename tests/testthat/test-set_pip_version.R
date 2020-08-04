test_that("use", {
  if (!is_on_ci()) return()
  if (!is_pip_installed()) return()

  # Store the current version
  current_version <- get_pip_version()

  # Pick first version
  version <- "19.0"
  set_pip_version(version)
  expect_equal(version, get_pip_version())

  # Pick second version
  version <- "10.0.0"
  set_pip_version(version)
  expect_equal(version, get_pip_version())

  # Restore current version
  set_pip_version(current_version)
  expect_equal(current_version, get_pip_version())

})
