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
  mhcnuggetsr_folder = get_default_mhcnuggetsr_folder(),
  ormr_folder_name = get_default_orm_folder_name()
) {
  if (!ormr::is_python_package_installed(
      package_name = "mhcnuggets",
      ormr_folder_name = ormr_folder_name
    )
  ) {
    stop(
      "'mhcnuggets not installed'. ",
      "Tip: use 'mhcnuggetsr_report()' for more information"
    )
  }
  mhcnuggets_folder <- mhcnuggetsr::get_default_mhcnuggets_folder(
    mhcnuggetsr_folder = mhcnuggetsr_folder
  )
  if (!dir.exists(mhcnuggets_folder)) {
    stop("MHCnuggets GitHub repo not found at '", mhcnuggets_folder, "'")
  }
  invisible(mhcnuggetsr_folder)
}
