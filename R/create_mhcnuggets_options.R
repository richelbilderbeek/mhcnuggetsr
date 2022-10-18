#' Create a set of MHCnuggets options.
#'
#' Create a set of options to run MHCnuggets with.
#'
#' This function will give an error message if the arguments are invalid.
#' @inheritParams default_params_doc
#' @param folder_name deprecated name for 'mhcnuggetsr_folder'
#' @return an \code{mhcnuggets_options}
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   create_mhcnuggets_options(
#'     mhc = "HLA-A02:01"
#'   )
#' }
#' @note an \code{mhcnuggets_options} created
#' by \link{create_mhcnuggets_options} is always
#' checked by \link{check_mhcnuggets_options}
#' @seealso use \link{create_test_mhcnuggets_options} to create an
#'   MHCnuggets object for testing
#' @author Richèl J.C. Bilderbeek
#' @export
create_mhcnuggets_options <- function(
  mhc_class = NA,
  mhc,
  ba_models = FALSE,
  verbose = FALSE,
  mhcnuggetsr_folder = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url(),
  folder_name = "deprecated"
) {
  if (folder_name != "deprecated") {
    stop(
      "The argument 'folder_name' is deprecated. ",
      "Use 'mhcnuggetsr_folder' instead"
    )
  }
  mhcnuggets_options <- list(
    mhc_class = mhc_class,
    mhc = mhc,
    ba_models = ba_models,
    verbose = verbose,
    mhcnuggetsr_folder = mhcnuggetsr_folder,
    mhcnuggets_url = mhcnuggets_url
  )
  mhcnuggetsr::check_mhcnuggets_options(mhcnuggets_options)
  mhcnuggets_options
}
