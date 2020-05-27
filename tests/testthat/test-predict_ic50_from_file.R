test_that("vignette example 1", {

  # Needed for codecov
  if (is_on_ci() && !is_mhcnuggets_installed()) {
    #' Use triple-l, due to bug upstream,
    #' bug report at https://github.com/r-lib/roxygen2/issues/1101
    install_mhcnuggets()
  }

  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_1_haplotype <- "HLA-A02:01"
  expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

  df <- predict_ic50_from_file(
    mhc_class = "I",
    peptides_path = peptides_path,
    mhc = mhc_1_haplotype
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

  mhc_1_haplotype <- "HLA-A02:01"
  expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

  expect_silent(
    predict_ic50_from_file(
      mhc_class = "I",
      peptides_path = peptides_path,
      mhc = mhc_1_haplotype,
      ba_models = TRUE
    )
  )
})

test_that("vignette example 3", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_2_haplotype <- "HLA-DRB101:01"
  expect_true(mhc_2_haplotype %in% get_trained_mhc_2_haplotypes())

  expect_silent(
    predict_ic50_from_file(
      mhc_class = "II",
      peptides_path = peptides_path,
      mhc = mhc_2_haplotype
    )
  )
})

test_that("vignette example 4", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_1_haplotype <- "HLA-A02:60"

  # It is not in the trained alleles set
  expect_false(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

  expect_silent(
    predict_ic50_from_file(
      mhc_class = "I",
      peptides_path = peptides_path,
      mhc = mhc_1_haplotype
    )
  )
})

test_that("abuse, no MHCnuggets install needed", {

  irrelevant <- "irrelevant"

  expect_error(
    predict_ic50_from_file(
      mhc_class = "nonsense",
      peptides_path = irrelevant,
      mhc = irrelevant
    ),
    "'mhc_class' must be either 'I' or 'II'"
  )
  expect_error(
    predict_ic50_from_file(
      mhc_class = "I",
      peptides_path = "abs.ent",
      mhc = irrelevant
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

  expect_error(
    predict_ic50_from_file(
      mhc_class = "II",
      peptides_path = peptides_path,
      mhc = mhc_1_haplotype
    ),
    "Must use the same 'mhc_class' as the 'mhc' is from"
  )
  expect_error(
    predict_ic50_from_file(
      mhc_class = "I",
      peptides_path = peptides_path,
      mhc = mhc_2_haplotype
    ),
    "Must use the same 'mhc_class' as the 'mhc' is from"
  )
})
