test_that("use", {
  expect_silent(check_mhc_class("I"))
  expect_silent(check_mhc_class("II"))
  expect_silent(check_mhc_class(NA))
  expect_error(
    check_mhc_class("nonsense"),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
  expect_error(
    check_mhc_class(NULL),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
  expect_error(
    check_mhc_class(Inf),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
  expect_error(
    check_mhc_class(3.14),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
  expect_error(
    check_mhc_class(42),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
  expect_error(
    check_mhc_class(c()),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
  expect_error(
    check_mhc_class(c("I", "II")),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
  expect_error(
    check_mhc_class(c(NA, NA)),
    "'mhc_class' must be either 'I', 'II' or NA"
  )
})
