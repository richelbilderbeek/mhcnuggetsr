test_that("use", {
  if (!is_mhcnuggets_installed()) return()
  filenames <- get_example_filenames()
  expect_true(all(file.exists(filenames)))
})
