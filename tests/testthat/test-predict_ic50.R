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

test_that("automatic deduction for MHC-I", {

  if (!is_mhcnuggets_installed()) return()

  peptide <- "AIAACAMLLV"
  mhcnuggets_options <- create_test_mhcnuggets_options(
    mhc_class = "I",
    mhc = sample(get_trained_mhc_1_haplotypes(), size = 1)
  )

  ic50_1 <- predict_ic50(
    mhcnuggets_options = mhcnuggets_options,
    peptides = peptide
  )
  mhcnuggets_options$mhc_class <- NA
  ic50_na <- predict_ic50(
    mhcnuggets_options = mhcnuggets_options,
    peptides = peptide
  )
  expect_equal(ic50_1, ic50_na)
})

test_that("automatic deduction for MHC-II", {

  if (!is_mhcnuggets_installed()) return()

  peptide <- "AIAACAMLLV"
  mhcnuggets_options <- create_test_mhcnuggets_options(
    mhc_class = "II",
    mhc = sample(get_trained_mhc_2_haplotypes(), size = 1)
  )

  ic50_2 <- predict_ic50(
    mhcnuggets_options = mhcnuggets_options,
    peptides = peptide
  )
  mhcnuggets_options$mhc_class <- NA
  ic50_na <- predict_ic50(
    mhcnuggets_options = mhcnuggets_options,
    peptides = peptide
  )
  expect_equal(ic50_2, ic50_na)
})
