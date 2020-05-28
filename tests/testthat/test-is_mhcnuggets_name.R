test_that("use", {
  expect_true(!is_mhcnuggets_name(mhc = "HLA-A*01:01"))
  expect_true(is_mhcnuggets_name(mhc = "HLA-A01:01"))

})
