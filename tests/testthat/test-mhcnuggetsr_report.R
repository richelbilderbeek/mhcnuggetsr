test_that("use", {
  expect_output(mhcnuggetsr_report())
  expect_output(
    mhcnuggetsr_report(
      folder_name = "absent"
    )
  )
})
