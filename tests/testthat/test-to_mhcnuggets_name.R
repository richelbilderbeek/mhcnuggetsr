test_that("use", {
  haplotype <- "HLA-A*01:01"
  expect_equal("HLA-A01:01", to_mhcnuggets_name(haplotype))
})
