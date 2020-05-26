test_that("vignette example 1", {
  if (!is_mhcnuggets_installed()) return()

  skip("Not now")
  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_1_haplotype <- "HLA-A02:01"
  expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

  expect_silent(
    epitope_predict(
      class = "I",
      peptides_path = peptides_path,
      mhc = mhc_1_haplotype
    )
  )
})

test_that("vignette example 2", {
  if (!is_mhcnuggets_installed()) return()
  skip("Not now")

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_1_haplotype <- "HLA-A02:01"
  expect_true(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

  expect_silent(
    epitope_predict(
      class = "I",
      peptides_path = peptides_path,
      mhc = mhc_1_haplotype,
      ba_models = TRUE
    )
  )
})

test_that("vignette example 3", {
  if (!is_mhcnuggets_installed()) return()
  skip("Not now")

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_2_haplotype <- "HLA-DRB101:01"
  expect_true(mhc_2_haplotype %in% get_trained_mhc_2_haplotypes())

  expect_silent(
    epitope_predict(
      class = "II",
      peptides_path = peptides_path,
      mhc = mhc_2_haplotype
    )
  )
})

test_that("vignette example 4", {
  if (!is_mhcnuggets_installed()) return()
  skip("Not now")

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhc_1_haplotype <- "HLA-A02:60"

  # It is not in the trained alleles set
  expect_false(mhc_1_haplotype %in% get_trained_mhc_1_haplotypes())

  expect_silent(
    epitope_predict(
      class = "I",
      peptides_path = peptides_path,
      mhc = mhc_1_haplotype
    )
  )
})

test_that("abuse, no MHCnuggets install needed", {

  irrelevant <- "irrelevant"

  expect_error(
    epitope_predict(
      class = "nonsense",
      peptides_path = irrelevant,
      mhc = irrelevant
    ),
    "'class' must be either 'I' or 'II'"
  )
  expect_error(
    epitope_predict(
      class = "I",
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
    epitope_predict(
      class = "II",
      peptides_path = peptides_path,
      mhc = mhc_1_haplotype
    ),
    "Must use the same 'class' as the 'mhc' is from"
  )
  expect_error(
    epitope_predict(
      class = "I",
      peptides_path = peptides_path,
      mhc = mhc_2_haplotype
    ),
    "Must use the same 'class' as the 'mhc' is from"
  )
})
