test_that("use", {
  if (!is_mhcnuggets_installed()) return()
  skip("Install is not yet correct")
  version <- get_mhcnuggets_version()
  expect_equal(1, length(version))
  expect_equal("character", class(version))
  expect_true(nchar(version) > 2)

})
