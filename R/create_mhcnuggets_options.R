#' Create a set of options to run MHCnuggets with.
#'
#' Create a set of options to run MHCnuggets with. This function
#' will give an error message if the arguments are invalid.
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'   options <- create_mhcnuggets_options(
#'     mhc = "HLA-A02:01"
#'   )
#'
#'   expect_true("mhc_class" %in% names(options))
#'   expect_true("mhc" %in% names(options))
#'   expect_true("ba_models" %in% names(options))
#'   expect_true("verbose" %in% names(options))
#'   expect_true("folder_name" %in% names(options))
#'   expect_true("mhcnuggets_url" %in% names(options))
#'
#'   # These are guaranteed to pass, as 'create_mhcnuggets_options'
#'   # checks for this
#'   expect_true(is_mhcnuggets_options(options))
#'   expect_silent(check_mhcnuggets_options(options))
#' }
#' @seealso use \link{create_test_mhcnuggets_options} to create an
#'   MHCnuggets object for testing
#' @author Richèl J.C. Bilderbeek
#' @export
create_mhcnuggets_options <- function(
  mhc_class = NA,
  mhc,
  ba_models = FALSE,
  verbose = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggets_options <- list(
    mhc_class = mhc_class,
    mhc = mhc,
    ba_models = ba_models,
    verbose = verbose,
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
  mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)
  mhcnuggets_options
}
