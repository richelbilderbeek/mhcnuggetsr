test_that("vignette example 1", {

  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = "HLA-A02:01"
  )
  expect_true(mhcnuggets_options$mhc %in% get_trained_mhc_1_haplotypes())

  df <- predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
  expect_true("peptide" %in% names(df))
  expect_true("ic50" %in% names(df))
  expect_equal("character", class(df$peptide))
  expect_equal("numeric", class(df$ic50))
})

test_that("vignette example 2", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = "HLA-A02:01"
  )
  expect_true(mhcnuggets_options$mhc %in% get_trained_mhc_1_haplotypes())

  expect_silent(
    predict_ic50_from_file(
      peptides_path = peptides_path,
      mhcnuggets_options = mhcnuggets_options
    )
  )
})

test_that("vignette example 3", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "II",
    mhc = "HLA-DRB101:01"
  )
  expect_true(mhcnuggets_options$mhc %in% get_trained_mhc_2_haplotypes())

  expect_silent(
    predict_ic50_from_file(
      mhcnuggets_options = mhcnuggets_options,
      peptides_path = peptides_path
    )
  )
})

test_that("vignette example 4", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = "HLA-A02:60"
  )

  # It is not in the trained alleles set
  expect_false(mhcnuggets_options$mhc %in% get_trained_mhc_1_haplotypes())

  expect_silent(
    predict_ic50_from_file(
      mhcnuggets_options = mhcnuggets_options,
      peptides_path = peptides_path
    )
  )
})

test_that("abuse, no MHCnuggets install needed", {

  expect_error(
    predict_ic50_from_file(
      mhcnuggets_options = "nonsense",
      peptides_path = get_example_filename("test_peptides.peps")
    ),
    "'mhcnuggets_options' must be"
  )
  expect_error(
    predict_ic50_from_file(
      mhcnuggets_options = create_test_mhcnuggets_options(),
      peptides_path = "abs.ent"
    ),
    "Cannot find 'peptides_path'"
  )

})

test_that("abuse, MHCnuggets install needed", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_1_haplotype <- get_trained_mhc_1_haplotypes()[1]
  mhc_2_haplotype <- get_trained_mhc_2_haplotypes()[1]

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "II",
    mhc = mhc_1_haplotype
  )
  expect_error(
    predict_ic50_from_file(
      mhcnuggets_options = mhcnuggets_options,
      peptides_path = peptides_path
    ),
    "Must use the same 'mhc_class' as the 'mhc' is from"
  )

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = mhc_2_haplotype
  )
  expect_error(
    predict_ic50_from_file(
      peptides_path = peptides_path,
      mhcnuggets_options = mhcnuggets_options
    ),
    "Must use the same 'mhc_class' as the 'mhc' is from"
  )
})




test_that("abuse, too long peptide", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- tempfile()
  writeLines(text = "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC", con = peptides_path)
  expect_true(file.exists(peptides_path))
  expect_error(
    predict_ic50_from_file(
      peptides_path = peptides_path,
      mhcnuggets_options = create_test_mhcnuggets_options()
    ),
    "'peptides' must have lengths of at most 15"
  )
})
