#' Check if MHCnuggets is installed.
#'
#' Check if MHCnuggets is installed. Will \link{stop} if not.
#'
#' An MHCnuggets installation has two parts:
#'   1. The installation of the Python package,
#'      for running the code
#'   2. The download of the Python source code,
#'      which allows the use of example files
#' @inheritParams default_params_doc
#' @return Nothing.
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_mhcnuggets_installed()) {
#'   check_mhcnuggets_installation()
#' }
#' @export
check_mhcnuggets_installation <- function(
  folder_name = get_default_mhcnuggets_folder(),
  mhcnuggets_url = get_mhcnuggets_url()
) {
  # if (!reticulate::py_available()) stop("Python is not installed") # nolint not now

  if (!mhcnuggetsr::is_pip_installed()) {
    stop("pip is not installed")
  }
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
