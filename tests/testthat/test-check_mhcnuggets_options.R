test_that("use", {
  expect_silent(check_mhcnuggets_options(create_test_mhcnuggets_options()))

  expect_error(
    check_mhcnuggets_options("nonsense"),
    "'mhcnuggets_options' must be a list"
  )
  expect_error(check_mhcnuggets_options(NULL))
  expect_error(check_mhcnuggets_options(NA))
  expect_error(check_mhcnuggets_options(""))
  expect_error(check_mhcnuggets_options(3.14))
  expect_error(check_mhcnuggets_options(42))

  expect_error(
    check_mhcnuggets_options(list()),
    "'mhcnuggets_options' must have an element named 'mhc_class'"
  )
  expect_error(
    check_mhcnuggets_options(list(
      create_test_mhcnuggets_options(), create_test_mhcnuggets_options())
    )
  )

})
