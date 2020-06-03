test_that("use", {
  if (!is_on_ci()) return()
  if (!is_mhcnuggets_installed()) return()

  uninstall_mhcnuggets()
  expect_false(is_mhcnuggets_installed())
  install_mhcnuggets()
  expect_true(is_mhcnuggets_installed())
})

test_that("install in different folder", {
  if (!is_on_ci()) return()
  if (!is_mhcnuggets_installed()) return()

  # Be able to restore situation before
  set_is_mhcnuggets_installed(FALSE)

  folder_name <- tempfile()
  expect_true(!is_mhcnuggets_installed(folder_name = folder_name))
  install_mhcnuggets(folder_name = folder_name)
  expect_true(is_mhcnuggets_installed(folder_name = folder_name))

  peptides_path <- get_example_filename(
    "test_peptides.peps",
    folder_name = folder_name
  )

  tryCatch({
      predict_ic50_from_file(
        peptides_path = peptides_path,
        mhcnuggets_options = create_test_mhcnuggets_options(
          folder_name = folder_name
        )
      )
    },
    error = function(e) {} # nolint this will fail when covr::codecov, with error 'hat this TensorFlow binary was not compiled to use: AVX2 AVX512F FMA', see https://travis-ci.org/github/richelbilderbeek/mhcnuggetsr/builds/691686575#L1038
  )

  uninstall_mhcnuggets(folder_name = folder_name)
  expect_false(is_mhcnuggets_installed(folder_name = folder_name))


  # Restore situation before
  set_is_mhcnuggets_installed(TRUE)
})

test_that("install in different folder", {
  if (!is_on_ci()) return()

  if (is_mhcnuggets_installed()) {
    expect_error(
      install_mhcnuggets(),
      "MHCnuggets is already installed"
    )
  }
})
