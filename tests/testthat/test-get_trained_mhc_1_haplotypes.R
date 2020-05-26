test_that("use", {
  if (!is_mhcnuggets_installed()) return()
  haplotypes <- get_trained_mhc_1_haplotypes()
  expect_true(length(haplotypes) > 1)
})
