test_that("use", {
  expect_output(mhcnuggetsr_report())
  expect_output(mhcnuggetsr_report(mhcnuggetsr_folder = tempfile()))
  expect_output(
    mhcnuggetsr_report(
      mhcnuggetsr_folder = tempfile(),
      ormr_folder_name = "python3"
    )
  )
  expect_output(
    mhcnuggetsr_report(
      mhcnuggetsr_folder = tempfile(),
      ormr_folder_name = tempfile()
    )
  )
})
