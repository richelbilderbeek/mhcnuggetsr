test_that("use", {
  if (!is_on_ci()) return()

  if (!is_mhcnuggets_installed()) {
    install_mhcnuggets()
    expect_true(is_mhcnuggets_installed())
    get_mhcnuggets_version()
    uninstall_mhcnuggets()
    expect_false(is_mhcnuggets_installed())
  } else {
    uninstall_mhcnuggets()
    expect_false(is_mhcnuggets_installed())
    install_mhcnuggets()
    expect_true(is_mhcnuggets_installed())
  }
})

test_that("install in different folder", {
  if (!is_on_ci()) return()

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
  epitope_predict(
    mhc_class = "I",
    peptides_path = peptides_path,
    mhc = "HLA-A02:01",
    folder_name = folder_name
  )

  uninstall_mhcnuggets(folder_name = folder_name)
  expect_false(is_mhcnuggets_installed(folder_name = folder_name))


  # Restore situation before
  set_is_mhcnuggets_installed(TRUE)
})
