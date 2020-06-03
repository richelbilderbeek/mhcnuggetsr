test_that("use", {

  if (!is_mhcnuggets_installed()) return()

  peptides <- c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV")
  mhcnuggets_options <- create_test_mhcnuggets_options(
    mhc_class = "I",
    mhc = "HLA-A02:01"
  )

  df <- predict_ic50(
    peptides = peptides,
    mhcnuggets_options = mhcnuggets_options
  )
  expect_true("peptide" %in% names(df))
  expect_true("ic50" %in% names(df))
  expect_equal("character", class(df$peptide))
  expect_equal("numeric", class(df$ic50))
})

test_that("peptide lengths must be at most 15", {

  expect_error(
    predict_ic50(
      peptides = "AIAACAMLLVCCCCCC",
      mhcnuggets_options = create_test_mhcnuggets_options()
    ),
    "'peptides' must have lengths of at most 15"
  )
})
