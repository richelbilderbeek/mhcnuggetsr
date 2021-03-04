test_that("default use", {
  if (is_mhcnuggets_installed()) {
    expect_silent(mhcnuggetsr_self_test())
  } else {
    expect_error(mhcnuggetsr_self_test())
  }
})

test_that("verbosity", {
  if (is_mhcnuggets_installed()) {
    expect_message(mhcnuggetsr_self_test(verbose = TRUE))
  } else {
    expect_error(mhcnuggetsr_self_test(verbose = TRUE))
  }
})

test_that("detailed use", {
  if (!is_mhcnuggets_installed()) return()

  mhcnuggets_options <- create_test_mhcnuggets_options()
  peptides_path <- create_temp_peptides_path()
  mhcnuggets_output_filename = mhcnuggetsr::create_temp_peptides_path(
    fileext = ".csv"
  )
  expect_silent(
    mhcnuggetsr_self_test(
      mhcnuggets_options = mhcnuggets_options,
      peptides_path = peptides_path,
      mhcnuggets_output_filename = mhcnuggets_output_filename,
      verbose = FALSE
    )
  )
})
