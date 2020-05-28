test_that("use", {
  expect_true(all(are_mhcnuggets_names(mhcs)))
  expect_true(all(are_mhcnuggets_names(get_mhc_2_haplotypes())))
})
