test_that("vignette examples", {
  expect_silent(
    predict(
      class = "I",
      peptides_path = "data/test/test_peptides.peps",
      mhc = "HLA-A02:01"
    )
  )

  expect_silent(
    predict(
      class = 'I',
      peptides_path = 'data/test/test_peptides.peps',
      mhc = 'HLA-A02:01',
      ba_models = TRUE
    )
  )

  expect_silent(
    predict(
      class = 'II',
      peptides_path = 'data/test/test_peptides.peps',
      mhc = 'HLA-DRB101:01'
    )
  )

  expect_silent(
    predict(
      class = 'I',
      peptides_path = 'data/test/test_peptides.peps',
      mhc = 'HLA-A02:60'
    )
  )
})
