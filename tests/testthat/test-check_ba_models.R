test_that("use", {
  expect_silent(check_ba_models(ba_models = TRUE))
  expect_silent(check_ba_models(ba_models = FALSE))
  expect_error(
    check_ba_models("nonsense"),
    "'ba_models' must be either TRUE or FALSE"
  )
  expect_error(
    check_ba_models(NULL),
    "'ba_models' must be either TRUE or FALSE"
  )
  expect_error(
    check_ba_models(Inf),
    "'ba_models' must be either TRUE or FALSE"
  )
  expect_error(
    check_ba_models(3.14),
    "'ba_models' must be either TRUE or FALSE"
  )
  expect_error(
    check_ba_models(42),
    "'ba_models' must be either TRUE or FALSE"
  )
  expect_error(
    check_ba_models(c()),
    "'ba_models' must be either TRUE or FALSE"
  )
  expect_error(
    check_ba_models(c(TRUE, FALSE)),
    "'ba_models' must be either TRUE or FALSE"
  )
  expect_error(
    check_ba_models(c(NA, NA)),
    "'ba_models' must be either TRUE or FALSE"
  )

})
