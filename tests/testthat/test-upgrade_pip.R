test_that("use", {
  if (!is_on_ci()) return()
  if (!is_pip_installed()) return()

  # Does nothing, expect to be at the most current version
  expect_silent(upgrade_pip())

})
