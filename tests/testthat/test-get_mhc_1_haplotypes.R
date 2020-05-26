test_that("use", {
  haplotypes <- get_mhc_1_haplotypes()
  expect_true(length(haplotypes) > 1)
})
