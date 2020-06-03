test_that("use", {

  if (!is_mhcnuggets_installed()) return()

  expect_silent(check_mhcnuggets_options(create_test_mhcnuggets_options()))

  # Must be a list
  expect_error(
    check_mhcnuggets_options("nonsense"),
    "'mhcnuggets_options' must be a list"
  )
  expect_error(check_mhcnuggets_options(NULL))
  expect_error(check_mhcnuggets_options(NA))
  expect_error(check_mhcnuggets_options(""))
  expect_error(check_mhcnuggets_options(3.14))
  expect_error(check_mhcnuggets_options(42))

  # Element names
  expect_error(
    check_mhcnuggets_options(list()),
    "'mhcnuggets_options' must have an element named 'mhc_class'"
  )
  expect_error(
    check_mhcnuggets_options(list(
      create_test_mhcnuggets_options(), create_test_mhcnuggets_options())
    )
  )



  expect_error(
    check_mhcnuggets_options(
      create_test_mhcnuggets_options(
        mhc_class = "nonsense"
      )
    ),
    "'mhc_class' must be either 'I' or 'II'"
  )

  expect_error(
    check_mhcnuggets_options(
      create_test_mhcnuggets_options(
        mhc = "nonsense"
      )
    ),
    "'mhc' must be a valid MHC haplotype name"
  )

  expect_error(
    check_mhcnuggets_options(
      create_test_mhcnuggets_options(
        mhc_class = "I",
        mhc = get_trained_mhc_2_haplotypes()[1]
      )
    ),
    "Must use the same 'mhc_class' as the 'mhc' is from"
  )
  expect_error(
    check_mhcnuggets_options(
      create_test_mhcnuggets_options(
        mhc_class = "II",
        mhc = get_trained_mhc_1_haplotypes()[1]
      )
    ),
    "Must use the same 'mhc_class' as the 'mhc' is from"
  )
})
