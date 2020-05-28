test_that("peptide lengths must be at most 15", {

  peptide <- "AIAACAMLLVCCCCCC"
  n_rows_expected <- nchar(peptide) - 15 + 1
  first_peptide_expected <- substr(peptide, 1, 15)
  second_peptide_expected <- substr(peptide, 2, 16)

  df <- predict_ic50s(
    mhc_class = "I",
    peptide = peptide,
    mhc = "HLA-A02:01",
    n_aas = 15
  )

  expect_true("peptide" %in% names(df))
  expect_true("ic50" %in% names(df))
  expect_equal("character", class(df$peptide))
  expect_equal("numeric", class(df$ic50))
  expect_equal(n_rows_expected, nrow(df))
  expect_equal(df$peptide[1], first_peptide_expected)
  expect_equal(df$peptide[2], second_peptide_expected)
})

test_that("peptide lengths must be at most 15", {
  expect_error(
    predict_ic50s(
      mhc_class = "I",
      peptide = "AIAACAMLLVCCCCCC",
      mhc = "HLA-A02:01",
      n_aas = 16
    ),
    "'n_aas' must be 15 at most"
  )
})
