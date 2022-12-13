test_that("use", {
  if (!is_mhcnuggets_installed()) return()

  expect_silent(mhcnuggets_options_to_text(create_test_mhcnuggets_options(mhcnuggetsr_folder = "irrel")))
  expect_error(mhcnuggets_options_to_text("nonsense"))
})
