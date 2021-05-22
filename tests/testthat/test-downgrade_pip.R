test_that("deprecation", {
  expect_error(
    downgrade_pip(),
    "deprecated"
  )
})
