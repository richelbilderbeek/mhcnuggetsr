test_that("use", {
  if (is_on_travis()) {
    df <- get_python_package_versions()
    message(df)
    expect_true(tibble::is_tibble(df))
    expect_true("package" %in% names(df))
    expect_true("version" %in% names(df))
    expect_true(nrow(df) > 0)
    expect_true(!is.factor(df$package))
    expect_true(!is.factor(df$version))
  } else if (is_on_appveyor()) {
    # Show package versions
    system2(
      reticulate::py_config()$python,
      args = c("-m", "pip", "freeze"),
      stdout = TRUE
    )
    df <- get_python_package_versions()
    message(df)
    expect_true(tibble::is_tibble(df))
    expect_true("package" %in% names(df))
    # expect_true("version" %in% names(df))
    expect_true(nrow(df) > 0)
    expect_true(!is.factor(df$package))
    expect_true(!is.factor(df$version))
  }
})
