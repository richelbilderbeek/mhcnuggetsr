test_that("use", {
  if (!is_pip_installed()) return()

  df <- get_python_package_versions()
  message(df)
  expect_true(tibble::is_tibble(df))
  expect_true("package" %in% names(df))
  expect_true(nrow(df) > 0)

  if (rappdirs::app_dir()$os == "win") return()

  expect_true("version" %in% names(df))
  expect_true(!is.factor(df$package))
  expect_true(!is.factor(df$version))
})
