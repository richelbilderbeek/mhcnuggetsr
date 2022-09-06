test_that("use", {
  expect_error(
    check_mhcnuggets_installation(
      mhcnuggetsr_folder = tempfile()
    ),
    "(not found|mhcnuggets not installed)"
  )
  expect_error(
    check_mhcnuggets_installation(
      mhcnuggetsr_folder = tempfile(),
      ormr_folder_name = "python3"
    ),
    "(not found|mhcnuggets not installed)"
  )
})
