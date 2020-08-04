test_that("simple haplotype", {
  haplotype <- "HLA-A*01:01"
  haplotypes <- c(haplotype, haplotype)
  expect_silent(to_mhcnuggets_names(mhcs = haplotype))
  expect_silent(to_mhcnuggets_names(haplotypes))
})

test_that("use", {

  expect_error(
    to_mhcnuggets_names("nonsense"),
    "'to_mhcnuggets_name' did not result in an MHCnuggets name"
  )
  expect_error(to_mhcnuggets_names(NULL), "'mhcs' must have at least one value")
  expect_error(to_mhcnuggets_names(c()), "'mhcs' must have at least one value")
  expect_error(to_mhcnuggets_names(character(0)), "'mhcs' must have at least one value")

  expect_error(to_mhcnuggets_names(NA), "'mhc' must be of type character")
  expect_error(to_mhcnuggets_names(3.14), "'mhc' must be of type character")
  expect_error(to_mhcnuggets_names(Inf), "'mhc' must be of type character")

})
