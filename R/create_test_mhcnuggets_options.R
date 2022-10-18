#' Create testing options for MHCnuggets
#'
#' Create a set of testing options to run MHCnuggets with.
#' The most important setting is the use of a specific haplotype.
#' @inheritParams default_params_doc
#' @param folder_name deprecated name for 'mhcnuggetsr_folder'
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   create_test_mhcnuggets_options()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
create_test_mhcnuggets_options <- function(
  mhc_class = NA,
  mhc = "HLA-A02:01",
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
  mhcnuggetsr::create_mhcnuggets_options(
    mhc_class = mhc_class,
    mhc = mhc,
    ba_models = ba_models,
    verbose = verbose,
    mhcnuggetsr_folder = mhcnuggetsr_folder,
    mhcnuggets_url = mhcnuggets_url
  )
}
