test_that("deprecation", {
  expect_error(
    uninstall_mhcnuggets(),
    "deprecated"
  )
})
