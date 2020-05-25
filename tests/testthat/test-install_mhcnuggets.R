test_that("use", {
  if (!is_on_ci()) return()

  if (!is_mhcnuggets_installed()) {
    install_mhcnuggets()
    expect_true(is_mhcnuggets_installed())
  }
})
