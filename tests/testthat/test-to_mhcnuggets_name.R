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
