test_that("use", {
  expect_silent(check_verbose(verbose = TRUE))
  expect_silent(check_verbose(verbose = FALSE))
  expect_error(
    check_verbose("nonsense"),
    "'verbose' must be either TRUE or FALSE"
  )
  expect_error(
    check_verbose(NULL),
    "'verbose' must be either TRUE or FALSE"
  )
  expect_error(
    check_verbose(Inf),
    "'verbose' must be either TRUE or FALSE"
  )
  expect_error(
    check_verbose(3.14),
    "'verbose' must be either TRUE or FALSE"
  )
  expect_error(
    check_verbose(42),
    "'verbose' must be either TRUE or FALSE"
  )
  expect_error(
    check_verbose(c()),
    "'verbose' must be either TRUE or FALSE"
  )
  expect_error(
    check_verbose(c(TRUE, FALSE)),
    "'verbose' must be either TRUE or FALSE"
  )
  expect_error(
    check_verbose(c(NA, NA)),
    "'verbose' must be either TRUE or FALSE"
  )

})
