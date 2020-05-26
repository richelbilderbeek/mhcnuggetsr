test_that("use", {
  haplotypes <- get_mhc_2_haplotypes()
  expect_true(length(haplotypes) > 1)
})
