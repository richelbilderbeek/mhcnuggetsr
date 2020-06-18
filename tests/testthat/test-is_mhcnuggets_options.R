test_that("use", {

  if (!is_mhcnuggets_installed()) return()

  expect_true(is_mhcnuggets_options(create_test_mhcnuggets_options()))
  expect_false(is_mhcnuggets_options("nonsense"))
})
