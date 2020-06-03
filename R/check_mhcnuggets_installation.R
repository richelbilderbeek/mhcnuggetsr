#' Check if MHCnuggets is installed. Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (is_mhcnuggets_installed()) {
#'   expect_silent(check_mhcnuggets_installation())
#' } else {
#'   expect_error(check_mhcnuggets_installation())
#' }
#' @export
check_mhcnuggets_installation <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  if (!dir.exists(mhcnuggets_folder)) {
    stop("MHCnuggets GitHub repo not found at '", mhcnuggets_folder, "'")
  }
}
