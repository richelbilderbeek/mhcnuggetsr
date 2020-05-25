test_that("use", {
  if (is_mhcnuggets_installed()) {
    expect_silent(check_mhcnuggets_installed())
  } else {
    expect_error(check_mhcnuggets_installed())
  }
})
