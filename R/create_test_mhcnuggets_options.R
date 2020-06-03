#' Create a set of testing options to run MHCnuggets with
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'   options <- create_test_mhcnuggets_options()
#'
#'   expect_true(is_mhcnuggets_options(options))
#'   expect_silent(check_mhcnuggets_options(options))
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_mhcnuggets_options <- function(
  mhc_class = "I",
  mhc = "HLA-A02:01",
  ba_models = FALSE,
  verbose = FALSE,
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggetsr::create_mhcnuggets_options(
    mhc_class = mhc_class,
    mhc = mhc,
    ba_models = ba_models,
    verbose = verbose,
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )
}


