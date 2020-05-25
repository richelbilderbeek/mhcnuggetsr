test_that("use", {
  filenames <- get_example_filenames()
  expect_true(all(file.exists(filenames)))
})
