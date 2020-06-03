test_that("use", {
  options <- create_test_mhcnuggets_options()
  expect_true("mhc_class" %in% names(options))
  expect_true("mhc" %in% names(options))
  expect_true("ba_models" %in% names(options))
  expect_true("verbose" %in% names(options))
  expect_true("folder_name" %in% names(options))
  expect_true("mhcnuggets_url" %in% names(options))
})

