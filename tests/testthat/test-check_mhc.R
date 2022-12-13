test_that("use", {
  # MHCnuggets uses names without the asterisk
  expect_silent(check_mhc("HLA-A01:01"))

  # The official name is not the name format used by MHCnuggets
  expect_error(
    check_mhc("HLA-A*01:01"),
    "'mhc' must be one valid MHC haplotype name"
  )

  expect_error(check_mhc(TRUE))
  expect_error(check_mhc(NA))
  expect_error(check_mhc(NULL))
  expect_error(check_mhc(c()))
  expect_error(check_mhc(c("HLA-A01:01", "HLA-A01:01")))
  expect_error(check_mhc(42))
})
