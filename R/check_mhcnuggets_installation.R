#' Check if MHCnuggets is installed. Will \link{stop} if not.
#'
#' An MHCnuggets installation has two parts:
#'   1. The installation of the Python package,
#'      for running the code
#'   2. The download of the Python source code,
#'      which allows the use of example files
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
  error_code <- system2(
    reticulate::py_config()$python,
    args = c("-m", "pip", "show", "mhcnuggets"),
    stderr = NULL,
    stdout = NULL
  )
  if (error_code != 0) {
    stop(
      "'mhcnuggets not installed'. ",
      "Tip: use 'mhcnuggetsr_report()' for more information"
    )
  }
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  if (!dir.exists(mhcnuggets_folder)) {
    stop("MHCnuggets GitHub repo not found at '", mhcnuggets_folder, "'")
  }
}
