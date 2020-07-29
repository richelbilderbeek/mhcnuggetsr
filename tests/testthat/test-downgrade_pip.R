test_that("use", {
  if (!is_on_ci()) return()
  if (!is_pip_installed()) return()

  # Only done by humans
  # Assumes at most currect version
  version_before <- get_pip_version()
  downgrade_pip("9.0.1")
  version_after <- get_pip_version()
  upgrade_pip()
  expect_true(version_before != version_after)
})
