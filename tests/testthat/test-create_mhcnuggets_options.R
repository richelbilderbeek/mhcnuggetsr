test_that("use", {

  if (!is_mhcnuggets_installed()) return()

  options <- create_mhcnuggets_options(
    mhc_class = NA,
    mhc = "HLA-A02:01",
    ba_models = FALSE,
    verbose = FALSE,
    mhcnuggetsr_folder = get_default_mhcnuggets_folder(),
    mhcnuggets_url = get_mhcnuggets_url()
  )
  expect_true("mhc_class" %in% names(options))
  expect_true("mhc" %in% names(options))
  expect_true("ba_models" %in% names(options))
  expect_true("verbose" %in% names(options))
  expect_true("mhcnuggetsr_folder" %in% names(options))
  expect_true("mhcnuggets_url" %in% names(options))

  expect_error(
    create_mhcnuggets_options(
      mhc_class = NA,
      mhc = "HLA-A02:01",
      ba_models = FALSE,
      verbose = FALSE,
      mhcnuggetsr_folder = get_default_mhcnuggets_folder(),
      mhcnuggets_url = get_mhcnuggets_url(),
      folder_name = "something"
    ),
    "deprecated"
  )
})
