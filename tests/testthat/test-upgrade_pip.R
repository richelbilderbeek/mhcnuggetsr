test_that("deprecation", {
  expect_error(
    upgrade_pip(),
    "deprecated"
  )
})
