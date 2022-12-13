test_that("use", {
  expect_silent(mhcnuggets_options_to_text(create_test_mhcnuggets_options()))
  expect_error(mhcnuggets_options_to_text("nonsense"))
})
