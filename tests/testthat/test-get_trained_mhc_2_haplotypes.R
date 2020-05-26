test_that("use", {
  haplotypes <- get_trained_mhc_2_haplotypes()
  expect_true(length(haplotypes) > 1)
})
