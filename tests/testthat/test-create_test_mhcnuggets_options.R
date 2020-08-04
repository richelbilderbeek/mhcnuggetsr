test_that("use", {
  if (!is_mhcnuggets_installed()) return()
  expect_silent(check_mhcnuggets_options(create_test_mhcnuggets_options()))
  expect_silent(
    check_mhcnuggets_options(
      create_test_mhcnuggets_options(
        mhc_class = NA
      )
    )
  )
})
