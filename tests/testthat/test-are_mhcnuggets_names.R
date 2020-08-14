test_that("use", {

  if (!is_mhcnuggets_installed()) return()

  expect_true(all(are_mhcnuggets_names(get_mhc_1_haplotypes()[1:2])))
  expect_true(all(are_mhcnuggets_names(get_mhc_2_haplotypes()[1:2])))
})
