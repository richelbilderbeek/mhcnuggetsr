#' Create a set of options to run MHCnuggets with
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' options <- create_mhcnuggets_options(
#'   mhc_class = "I",
#'   mhc = "HLA-A02:01"
#' )
#'
#' expect_true("mhc_class" %in% names(options))
#' expect_true("mhc" %in% names(options))
#' expect_true("ba_models" %in% names(options))
#' expect_true("verbose" %in% names(options))
#' expect_true("folder_name" %in% names(options))
#' expect_true("mhcnuggets_url" %in% names(options))
#'
#' expect_true(is_mhcnuggets_options(options))
#' expect_silent(check_mhcnuggets_options(options))
#' @seealso use \link{create_test_mhcnuggets_options} to create an
#'   MHCnuggets object for testing
#' @author Richèl J.C. Bilderbeek
#' @export
create_mhcnuggets_options <- function(
  mhc_class,
  mhc,
  ba_models = FALSE,
  verbose = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  list(
    mhc_class = mhc_class,
    mhc = mhc,
    ba_models = ba_models,
    verbose = verbose,
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
}
