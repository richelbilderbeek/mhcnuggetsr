test_that("deprecation", {
  expect_error(
    install_mhcnuggets(),
    "deprecated"
  )
})
