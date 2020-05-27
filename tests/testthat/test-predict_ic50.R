test_that("use", {
  # Needed for codecov
  if (is_on_ci() && !is_mhcnuggets_installed()) {
    install_mhcnuggets()
  }

  if (!is_mhcnuggets_installed()) return()

  peptides <- c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV")
  mhc_1_haplotype <- "HLA-A02:01"


  df <- predict_ic50(
    mhc_class = "I",
    peptides = peptides,
    mhc = mhc_1_haplotype
  )
  expect_true("peptide" %in% names(df))
  expect_true("ic50" %in% names(df))
  expect_equal("character", class(df$peptide))
  expect_equal("numeric", class(df$ic50))
})
