test_that("deprecation", {
  expect_error(
    set_pip_version(),
    "deprecated"
  )
})
