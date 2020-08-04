test_that("simple haplotype", {
  haplotype <- "HLA-A*01:01"
  expect_equal("HLA-A01:01", to_mhcnuggets_name(haplotype))
})

test_that("complex haplotype", {
  if (!is_mhcnuggets_installed()) return()

  # Official notation
  haplotype_name <- "HLA-DQA1*0501/DQB1*0201"

  # Find similar one
  mhcnuggetsr::get_mhc_2_haplotypes()[
    stringr::str_detect(
      mhcnuggetsr::get_mhc_2_haplotypes(),
      "HLA.?DQA1.?05.?01.?DQB1.?02.?01"
    )
  ]

  expected_name  <- "HLA-DQA105:01-DQB102:01"
  expect_true(expected_name %in% mhcnuggetsr::get_mhc_2_haplotypes())
  mhcnuggets_name <- to_mhcnuggets_name(haplotype_name)
  expect_equal(expected_name, mhcnuggets_name)
})

test_that("abuse", {
  expect_error(
    to_mhcnuggets_name("nonsense"),
    "'to_mhcnuggets_name' did not result in an MHCnuggets name"
  )
  expect_error(to_mhcnuggets_name(NULL), "'mhc' must be one value")
  expect_error(to_mhcnuggets_name(c()), "'mhc' must be one value")
  expect_error(to_mhcnuggets_name(character(0)), "'mhc' must be one value")
  expect_error(to_mhcnuggets_name(c("", "")), "'mhc' must be one value")

  expect_error(to_mhcnuggets_name(NA), "'mhc' must be of type character")
  expect_error(to_mhcnuggets_name(3.14), "'mhc' must be of type character")
  expect_error(to_mhcnuggets_name(Inf), "'mhc' must be of type character")

})
