#' Determine if the MHCnuggets options is valid
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' expect_true(is_mhcnuggets_options(create_test_mhcnuggets_options()))
#' expect_false(is_mhcnuggets_options("nonsense"))
#' @author Richèl J.C. Bilderbeek
#' @export
is_mhcnuggets_options <- function(
  mhcnuggets_options
) {
  is <- FALSE
  tryCatch({
      mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)
      is <- TRUE
    },
    error = function(e) {} # nolint indeed ignore
  )
  is
}
