test_that("use", {
  if (!is_mhcnuggets_installed()) return()

  haplotypes <- get_mhc_1_haplotypes()
  expect_true(all(get_mhc_1_haplotypes() %in% get_trained_mhc_1_haplotypes()))
})
