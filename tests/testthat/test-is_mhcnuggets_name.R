test_that("use", {
  if (!is_mhcnuggets_installed()) return()
  expect_true(!is_mhcnuggets_name(mhc = "HLA-A*01:01"))
  expect_true(is_mhcnuggets_name(mhc = "HLA-A01:01"))
})
