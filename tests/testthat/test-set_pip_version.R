test_that("use", {
  if (!is_on_ci()) return()
  if (!is_pip_installed()) return()

  # Store the current version
  current_version <- get_pip_version()

  # Pick version
  version <- "9.0.1"
  expect_true(version != current_version)
  set_pip_version(version)
  expect_equal(version, get_pip_version())

  # Restore current version
  upgrade_pip()
  expect_equal(current_version, get_pip_version())

})
