test_that("vignette examples", {
  if (!is_mhcnuggets_installed()) return()
  skip("Not now")
  expect_silent(
    epitope_predict(
      class = "I",
      peptides_path = "data/test/test_peptides.peps",
      mhc = "HLA-A02:01"
    )
  )

  expect_silent(
    epitope_predict(
      class = 'I',
      peptides_path = 'data/test/test_peptides.peps',
      mhc = 'HLA-A02:01',
      ba_models = TRUE
    )
  )

  expect_silent(
    epitope_predict(
      class = 'II',
      peptides_path = 'data/test/test_peptides.peps',
      mhc = 'HLA-DRB101:01'
    )
  )

  expect_silent(
    epitope_predict(
      class = 'I',
      peptides_path = 'data/test/test_peptides.peps',
      mhc = 'HLA-A02:60'
    )
  )
})
