test_that("deprecation", {
  expect_error(
    uninstall_pip(),
    "deprecated"
  )
})
