test_that("use", {
  if (is_mhcnuggets_installed()) {
    expect_silent(mhcnuggetsr_self_test())
  } else {
    expect_error(mhcnuggetsr_self_test())
  }
})
