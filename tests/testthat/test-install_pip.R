test_that("use", {
  if (!is_on_ci()) return()
  if (is_pip_installed()) return()

  install_pip()
  expect_true(is_pip_installed())
  uninstall_pip()
  expect_true(!is_pip_installed())
})
