test_that("use", {
  df <- get_python_package_versions()
  expect_true(tibble::is_tibble(df))
  expect_true("package" %in% names(df))
  expect_true("version" %in% names(df))
  expect_true(nrow(df) > 0)
  expect_true(!is.factor(df$package))
  expect_true(!is.factor(df$version))
})
