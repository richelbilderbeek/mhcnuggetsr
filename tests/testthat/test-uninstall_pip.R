test_that("use", {
  if (!is_on_ci()) return()
  if (!is_pip_installed()) return()

  uninstall_pip()
  expect_false(is_pip_installed())
  install_pip()
  expect_true(is_pip_installed())
})
