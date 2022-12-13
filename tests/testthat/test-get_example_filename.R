test_that("use", {
  if (!is_mhcnuggets_installed()) return()
  fasta_filename <- "test_peptides.peps"
  full_path <- get_example_filename(fasta_filename)
  expect_true(file.exists(full_path))

  expect_error(
    get_example_filename(
      mhcnuggetsr_folder = "/no/where",
      filename = "irrelevant"
    ),
    "Cannot find 'mhcnuggetsr_folder'"
  )
  get_example_filename
})

test_that("abuse", {
  if (!is_mhcnuggets_installed()) return()
  expect_error(
    get_example_filename("nonsense"),
    "'filename' not found"
  )
})
