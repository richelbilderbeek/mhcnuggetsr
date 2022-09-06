test_that("use", {
  expect_silent(is_mhcnuggets_installed())

  expect_silent(is_mhcnuggets_installed(mhcnuggetsr_folder = tempfile()))
})
