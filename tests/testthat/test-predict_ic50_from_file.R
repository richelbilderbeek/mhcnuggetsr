test_that("vignette example 1", {

  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = "HLA-A02:01"
  )
  expect_true(mhcnuggets_options$mhc %in% get_trained_mhc_1_haplotypes())

  ic50s_1 <- predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
  expect_true("peptide" %in% names(ic50s_1))
  expect_true("ic50" %in% names(ic50s_1))
  expect_equal("character", class(ic50s_1$peptide))
  expect_equal("numeric", class(ic50s_1$ic50))
  expect_equal(ic50s_1$peptide, c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV"))
  expect_equal(ic50s_1$ic50, c(5578.77, 5634.66, 5554.22))

  # Use NA
  mhcnuggets_options$mhc_class <- NA
  ic50s_na <- predict_ic50_from_file(
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path
  )
  expect_equal(ic50s_1$peptide, ic50s_na$peptide)
  expect_equal(ic50s_1$ic50, ic50s_na$ic50)
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

  ic50s_1 <- predict_ic50_from_file(
    peptides_path = peptides_path,
    mhcnuggets_options = mhcnuggets_options
  )
  expect_equal(ic50s_1$peptide, c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV"))
  expect_equal(ic50s_1$ic50, c(5578.77, 5634.66, 5554.22))

  # Use NA
  mhcnuggets_options$mhc_class <- NA
  ic50s_na <- predict_ic50_from_file(
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path
  )
  expect_equal(ic50s_1$peptide, ic50s_na$peptide)
  expect_equal(ic50s_1$ic50, ic50s_na$ic50)
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

  ic50s_2 <- predict_ic50_from_file(
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path
  )
  expect_equal(ic50s_2$peptide, c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV"))
  expect_equal(ic50s_2$ic50, c(3887.51, 12304.98, 6509.79), tol = 0.1)

  # Use NA
  mhcnuggets_options$mhc_class <- NA
  ic50s_na <- predict_ic50_from_file(
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path
  )
  expect_equal(ic50s_2$peptide, ic50s_2$peptide)
  expect_equal(ic50s_2$ic50, ic50s_na$ic50)
})

test_that("vignette example 4", {
  if (!is_mhcnuggets_installed()) return()

  peptides_path <- get_example_filename("test_peptides.peps")
  expect_true(file.exists(peptides_path))

  # Cannot use 'mhc_class = NA', because the MHC haplotype
  # is not the in set of known haplotypes
  mhcnuggets_options <- create_mhcnuggets_options(
    mhc_class = "I",
    mhc = "HLA-A02:60"
  )

  # It is not in the trained alleles set
  expect_false(mhcnuggets_options$mhc %in% get_trained_mhc_1_haplotypes())

  ic50_1 <- predict_ic50_from_file(
    mhcnuggets_options = mhcnuggets_options,
    peptides_path = peptides_path
  )
  expect_equal(ic50_1$peptide, c("AIAACAMLLV", "ALVCYIVMPV", "ALEPRKEIDV"))
  expect_equal(ic50_1$ic50, c(5578.77, 5634.66, 5554.22))
})

test_that("no temp files left", {

  if (!is_mhcnuggets_installed()) return()

  mhcnuggets_output_filename <- tempfile("predict_ic50_from_file_")

  predict_ic50_from_file(
    mhcnuggets_options = create_test_mhcnuggets_options(),
    peptides_path = get_example_filename("test_peptides.peps"),
    mhcnuggets_output_filename = mhcnuggets_output_filename
  )
  expect_true(!file.exists(mhcnuggets_output_filename))
})

test_that("abuse", {
  if (!is_mhcnuggets_installed()) return()

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
    "abs.ent"
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

test_that("abuse, too long peptide", {
  peptides_path <- tempfile()
  writeLines(text = "CCCCCCCCCCCCCCC", con = peptides_path)
  expect_error(
    predict_ic50_from_file(
      peptides_path = peptides_path,
      mhcnuggets_options = create_test_mhcnuggets_options(),
      mhcnuggets_output_filename = peptides_path
    ),
    "'peptides_path' and 'mhcnuggets_output_filename' must be different"
  )
  file.remove(peptides_path)
})
